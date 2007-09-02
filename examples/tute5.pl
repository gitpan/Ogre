#!/usr/bin/perl
# This is OGRE's "Basic Tutorial 5" but in Perl.
# Read that tutorial, but see keyPressed() if you want
# to know what the key commands are.


# Note: normally you'd want to put these packages in separate files
# (and call `use' when needed, uncomment below). I mainly put them
# all here so that CPAN will hopefully not try to index them
# (otherwise they'll show up in http://search.cpan.org searches --
# I know there's supposedly a way to do it with META.yml,
# but I've never had success with that -- give me a patch to META.yml
# and I'll try it, though).


package ExampleFrameListener;
# implements FrameListener, WindowEventListener

use strict;
use warnings;

use Ogre 0.22;
use Ogre::Degree;
use Ogre::OverlayManager;
use Ogre::LogManager;
use Ogre::MaterialManager;
use Ogre::Vector3;
use Ogre::WindowEventUtilities;

use OIS 0.03;
use OIS::InputManager;
use OIS::Keyboard qw(:KeyCode);   # these don't export right, apparently...
use OIS::Mouse qw(:MouseButtonID);

my $ZERO = Ogre::Vector3->new(0, 0, 0);

# Note: I don't have a joystick to test with.... :P

sub new {
    my ($pkg, $win, $cam, $bufferedKeys, $bufferedMouse, $bufferedJoy) = @_;

    $bufferedKeys  = 0 unless defined $bufferedKeys;
    $bufferedMouse = 0 unless defined $bufferedMouse;
    $bufferedJoy   = 0 unless defined $bufferedJoy;

    my $self = bless {
        mWindow              => $win,   # RenderWindow
        mCamera              => $cam,   # Camera
        mTranslateVector     => $ZERO,
        mStatsOn             => 1,
        mNumScreenShots      => 0,
        mMoveScale           => 0,
        mRotScale            => 0,
        mTimeUntilNextToggle => 0,
        mFiltering           => Ogre->TFO_BILINEAR,
        mAniso               => 1,
        mSceneDetailIndex    => 0,
        mMoveSpeed           => 100,
        mRotateSpeed         => 36,
        mDebugOverlay        => undef,
        mInputManager        => undef,
        mMouse               => undef,
        mKeyboard            => undef,
        mJoy                 => undef,
        mDebugText           => '',
        displayCameraDetails => 0,    # static variable, I put it here instead
    }, $pkg;

    $self->{mDebugOverlay} = Ogre::OverlayManager->getSingletonPtr->getByName("Core/DebugOverlay");

    Ogre::LogManager->getSingletonPtr->logMessage("*** Initializing OIS ***");

    my $windowHnd = $win->getCustomAttributePtr('WINDOW');
    $self->{mInputManager} = OIS::InputManager->createInputSystemPtr($windowHnd);

    $self->{mKeyboard} = $self->{mInputManager}->createInputObjectKeyboard($bufferedKeys);
    $self->{mMouse} = $self->{mInputManager}->createInputObjectMouse($bufferedMouse);
    # $self->{mJoy} = $self->{mInputManager}->createInputObjectJoyStick($bufferedJoy);

    $self->windowResized($win);
    $self->showDebugOverlay(1);

    Ogre::WindowEventUtilities->addWindowEventListener($win, $self);

    return $self;
}

sub DESTROY {
    my ($self) = @_;

    # xxx: not sure where things are getting destroyed...

    # use Data::Dumper; print Dumper($self);
    # Ogre::WindowEventUtilities->removeWindowEventListener($self->{mWindow}, $self);

    # $self->windowClosed($self->{mWindow});
}

sub updateStats {
    my ($self) = @_;

    # there's a `try' block around this in C++,
    # not sure why - maybe for when these overlay elements
    # don't exist?

    my $om = Ogre::OverlayManager->getSingletonPtr();
    my $guiAvg = $om->getOverlayElement("Core/AverageFps");
    my $guiCurr = $om->getOverlayElement("Core/CurrFps");
    my $guiBest = $om->getOverlayElement("Core/BestFps");
    my $guiWorst = $om->getOverlayElement("Core/WorstFps");

    # I can't get getStatistics to work, so have to use individual
    # methods from RenderTarget as follows.
    # my $stats = $self->{mWindow}->getStatistics();

    my $win = $self->{mWindow};

    $guiAvg->setCaption("Average FPS: " . $win->getAverageFPS);
    $guiCurr->setCaption("Current FPS: " . $win->getLastFPS);
    $guiBest->setCaption("Best FPS: " . $win->getBestFPS
                          . " " . $win->getBestFrameTime . " ms");
    $guiWorst->setCaption("Worst FPS: " . $win->getWorstFPS
                           . " " . $win->getWorstFrameTime . " ms");

    my $guiTris = $om->getOverlayElement("Core/NumTris");
    my $guiBatches = $om->getOverlayElement("Core/NumBatches");
    my $guiDbg = $om->getOverlayElement("Core/DebugText");

    $guiTris->setCaption("Triangle Count: " . $win->getTriangleCount);
    $guiBatches->setCaption("Batch Count: " . $win->getBatchCount);
    $guiDbg->setCaption($self->{mDebugText});
}

# windowEventListener
sub windowResized {
    my ($self, $win) = @_;

    my ($width, $height) = $win->getMetrics();

    my $mousestate = $self->{mMouse}->getMouseState();

    # note: in C++ this would be like  mousestate.width = width;
    # (XXX: maybe should make it more perlish)
    $mousestate->setWidth($width);
    $mousestate->setHeight($height);
}

# windowEventListener
sub windowClosed {
    my ($self, $win) = @_;

    # note: NEED TO IMPLEMENT overload == operator (etc...)
    # if ($win == $self->{mWindow}) {
    if ($win->getName == $self->{mWindow}->getName) {
        if ($self->{mInputManager}) {
            my $im = $self->{mInputManager};
            if ($self->{mMouse}) {
                $im->destroyInputObject($self->{mMouse});
                delete $self->{mMouse};
            }
            if ($self->{mKeyboard}) {
                $im->destroyInputObject($self->{mKeyboard});
                delete $self->{mMouse};
            }
            if ($self->{mJoy}) {
                $im->destroyInputObject($self->{mJoy});
                delete $self->{mJoy};
            }

            OIS::InputManager->destroyInputSystem($im);
            delete $self->{mInputManager};
        }
    }
}

sub processUnbufferedKeyInput {
    my ($self, $evt) = @_;
    my $kb = $self->{mKeyboard};
    my $tv = $self->{mTranslateVector};
    my $cam = $self->{mCamera};

    if ($kb->isKeyDown(OIS::Keyboard->KC_A)) {
        $tv->setX(-$self->{mMoveScale});   # Move camera left
    }
    if ($kb->isKeyDown(OIS::Keyboard->KC_D)) {
        $tv->setX($self->{mMoveScale});    # Move camera RIGHT
    }

    if ($kb->isKeyDown(OIS::Keyboard->KC_UP) || $kb->isKeyDown(OIS::Keyboard->KC_W) ) {
        $tv->setZ(-$self->{mMoveScale});   # Move camera forward
    }

    if ($kb->isKeyDown(OIS::Keyboard->KC_DOWN) || $kb->isKeyDown(OIS::Keyboard->KC_S) ) {
        $tv->setZ($self->{mMoveScale});    # Move camera backward
    }

    if ($kb->isKeyDown(OIS::Keyboard->KC_PGUP)) {
        $tv->setY($self->{mMoveScale});    # Move camera up
    }

    if ($kb->isKeyDown(OIS::Keyboard->KC_PGDOWN)) {
        $tv->setY(-$self->{mMoveScale});   # Move camera down
    }

    if ($kb->isKeyDown(OIS::Keyboard->KC_RIGHT)) {
        $cam->yaw(Ogre::Degree->new(- $self->{mRotScale}));
    }

    if ($kb->isKeyDown(OIS::Keyboard->KC_LEFT)) {
        $cam->yaw(Ogre::Degree->new($self->{mRotScale}));
    }

    if ($kb->isKeyDown(OIS::Keyboard->KC_ESCAPE) || $kb->isKeyDown(OIS::Keyboard->KC_Q)) {
        return 0;
    }

    if ($kb->isKeyDown(OIS::Keyboard->KC_F) && $self->{mTimeUntilNextToggle} <= 0) {
        $self->{mStatsOn} = !$self->{mStatsOn};
        $self->showDebugOverlay($self->{mStatsOn});
        $self->{mTimeUntilNextToggle} = 1;
    }

    if ($kb->isKeyDown(OIS::Keyboard->KC_T) && $self->{mTimeUntilNextToggle} <= 0) {
        if ($self->{mFiltering} == Ogre->TFO_BILINEAR) {
            $self->{mFiltering} = Ogre->TFO_TRILINEAR;
            $self->{mAniso} = 1;
        }
        elsif ($self->{mFiltering} == Ogre->TFO_TRILINEAR) {
            $self->{mFiltering} = Ogre->TFO_ANISOTROPIC;
            $self->{mAniso} = 8;
        }
        elsif ($self->{mFiltering} == Ogre->TFO_ANISOTROPIC) {
            $self->{mFiltering} = Ogre->TFO_BILINEAR;
            $self->{mAniso} = 1;
        }

        Ogre::MaterialManager->getSingletonPtr->setDefaultTextureFiltering($self->{mFiltering});
        Ogre::MaterialManager->getSingletonPtr->setDefaultAnisotropy($self->{mAniso});

        $self->showDebugOverlay($self->{mStatsOn});
        $self->{mTimeUntilNextToggle} = 1;
    }

    if ($kb->isKeyDown(OIS::Keyboard->KC_SYSRQ) && $self->{mTimeUntilNextToggle} <= 0) {
        my $ss = "screenshot_" . ++$self->{mNumScreenShots} . ".png";
        $self->{mWindow}->writeContentsToFile($ss);
        $self->{mTimeUntilNextToggle} = 0.5;
        $self->{mDebugText} = "Saved: " + $ss;
    }

    if ($kb->isKeyDown(OIS::Keyboard->KC_R) && $self->{mTimeUntilNextToggle} <= 0) {
        $self->{mSceneDetailIndex} = ($self->{mSceneDetailIndex} + 1) % 3;

        if ($self->{mSceneDetailIndex} == 0) {
            $cam->setPolygonMode(Ogre->PM_SOLID);
        }
        elsif ($self->{mSceneDetailIndex} == 1) {
            $cam->setPolygonMode(Ogre->PM_WIREFRAME);
        }
        elsif ($self->{mSceneDetailIndex} == 2) {
            $cam->setPolygonMode(Ogre->PM_POINTS);
        }

        $self->{mTimeUntilNextToggle} = 0.5;
    }

    if ($kb->isKeyDown(OIS::Keyboard->KC_P) && $self->{mTimeUntilNextToggle} <= 0) {
        $self->{displayCameraDetails} = !$self->{displayCameraDetails};
        $self->{$self->{mTimeUntilNextToggle}} = 0.5;
        if (!$self->{displayCameraDetails}) {
            $self->{mDebugText} = "";
        }
    }

    # Print camera details
    # XXX: not for now - requires overloading "" for Quaternion
    # and Vector3
    #if (displayCameraDetails) {
    #    $self->{mDebugText} = "P: " . $cam->getDerivedPosition() .
    #      " " . "O: " . $cam->getDerivedOrientation();
    #}

    # Return true to continue rendering
    return 1;
}

sub processUnbufferedMouseInput {
    my ($self, $evt) = @_;

    # Rotation factors, may not be used if the second mouse button is pressed
    # 2nd mouse button - slide, otherwise rotate
    my $ms = $self->{mMouse}->getMouseState();
    if ($ms->buttonDown(OIS::Mouse->MB_Right)) {
        my $tv = $self->{mTranslateVector};
        $tv->setX($tv->x + $ms->X->rel * 0.13);
        $tv->setY($tv->y - $ms->Y->rel * 0.13);
    }
    else {
        $self->{mRotX} = Ogre::Degree->new(- $ms->X->rel * 0.13);
        $self->{mRotY} = Ogre::Degree->new(- $ms->Y->rel * 0.13);
    }

    return 1;
}

sub moveCamera {
    my ($self) = @_;

    # Make all the changes to the camera
    # Note that YAW direction is around a fixed axis (freelook style) rather than a natural YAW
    # (e.g. airplane)
    my $cam = $self->{mCamera};
    $cam->yaw(Ogre::Degree->new($self->{mRotX}));
    $cam->pitch(Ogre::Degree->new($self->{mRotY}));

    $cam->moveRelative($self->{mTranslateVector});
}

sub showDebugOverlay {
    my ($self, $show) = @_;
    if ($self->{mDebugOverlay}) {
        if ($show) {
            $self->{mDebugOverlay}->show();
        } else {
            $self->{mDebugOverlay}->hide();
        }
    }
}

sub frameStarted {
    my ($self, $evt) = @_;
    my $mouse = $self->{mMouse};
    my $keyboard = $self->{mKeyboard};
    my $joy = $self->{mJoy};

    if ($self->{mWindow}->isClosed()) {
        return 0;
    }

    # Need to capture/update each device
    $keyboard->capture();
    $mouse->capture();
    if ($joy) {
        $joy->capture();
    }

    my $buffJ = $joy ? $joy->buffered() : 1;

    # Check if one of the devices is not buffered
    if (!$mouse->buffered() || !$keyboard->buffered() || !$buffJ) {
        # one of the input modes is immediate, so setup what is needed for immediate movement
        if ($self->{mTimeUntilNextToggle} >= 0) {
            $self->{mTimeUntilNextToggle} -= $evt->timeSinceLastFrame;

            # If this is the first frame, pick a speed
            if ($evt->timeSinceLastFrame == 0) {
                $self->{mMoveScale} = 1;
                $self->{mRotScale} = 0.1;
            }
            # Otherwise scale movement units by time passed since last frame
            else {
                # Move about 100 units per second,
                $self->{mMoveScale} = $self->{mMoveSpeed} * $evt->timeSinceLastFrame;
                # Take about 10 seconds for full rotation
                $self->{mRotScale} = $self->{mRotateSpeed} * $evt->timeSinceLastFrame;
            }

            $self->{mRotX} = 0;
            $self->{mRotY} = 0;
            $self->{mTranslateVector} = $ZERO;
        }
    }

    # Check to see which device is not buffered, and handle it
    if (!$keyboard->buffered()) {
        if ($self->processUnbufferedKeyInput($evt) == 0) {
            return 0;
        }
    }
    if (!$mouse->buffered()) {
        if ($self->processUnbufferedMouseInput($evt) == 0) {
            return 0;
        }
    }
    if (!$mouse->buffered() || !$keyboard->buffered() || !$buffJ) {
        $self->moveCamera();
    }

    return 1;
}

sub frameEnded {
    $_[0]->updateStats();
    return 1;
}


1;


package ExampleApplication;

use strict;
use warnings;

use Ogre 0.22;
use Ogre::ColourValue;
use Ogre::Root;
use Ogre::SceneManager;
use Ogre::ResourceGroupManager;
use Ogre::TextureManager;

sub new {
    my ($pkg) = @_;

    my $self = bless {
        mFrameListener => undef,
        mRoot          => undef,
        mResourcePath  => '',
        mCamera        => undef,
        mSceneMgr      => undef,
        mWindow        => undef,
    }, $pkg;

    # if OGRE_PLATFORM == OGRE_PLATFORM_APPLE
    # $self->mResourcePath = macBundlePath() + "/Contents/Resources/";

    return $self;
}

sub DESTROY {
    my ($self) = @_;

    # not sure this is right..
    if ($self->{mFrameListener}) {
        delete $self->{mFrameListener};
    }
    if ($self->{mRoot}) {
        delete $self->{mRoot};
    }
}

# This function will locate the path to our application on OS X,
# unlike windows you can not rely on the curent working directory
# for locating your configuration files and resources.
# (note: this is a FUNCTION, not a method)
sub macBundlePath {
    # xxx: ExampleApplication.h contains a function macBundlePath
    # which gets the full path for mResourcePath (it says OS X must
    # be given a full path, not relative). That needs to be implemented
    # (presumably in Perl, though).
    # I'm not sure if all platforms can take a full path;
    # assuming so, it'll be easy enough, but otherwise I'll also
    # have to get the OGRE_PLATFORM, OGRE_PLATFORM_APPLE #defines

    return '';
}

sub go {
    my ($self) = @_;

    return unless $self->setup();

    $self->{mRoot}->startRendering();
    $self->destroyScene();
}

# These internal methods package up the stages in the startup process

# Sets up the application - returns false if the user chooses to abandon configuration.
sub setup {
    my ($self) = @_;

    $self->{mRoot} = Ogre::Root->new($self->{mResourcePath} . 'plugins.cfg',
                                     $self->{mResourcePath} . 'ogre.cfg',
                                     $self->{mResourcePath} . 'Ogre.log');

    $self->setupResources();

    return 0 unless $self->configure();

    $self->chooseSceneManager();
    $self->createCamera();
    $self->createViewports();

    # Set default mipmap level (NB some APIs ignore this)
    Ogre::TextureManager->getSingletonPtr->setDefaultNumMipmaps(5);

    # Create any resource listeners (for loading screens)
    $self->createResourceListener();

    $self->loadResources();
    $self->createScene();
    $self->createFrameListener();

    return 1;
}

# Configures the application - returns false if the user chooses to abandon configuration.
sub configure {
    my ($self) = @_;

    # Show the configuration dialog and initialise the system
    # You can skip this and use root.restoreConfig() to load configuration
    # settings if you were sure there are valid ones saved in ogre.cfg
    if ($self->{mRoot}->showConfigDialog()) {
        # If returned true, user clicked OK so initialise
        # Here we choose to let the system create a default rendering window by passing 'true'
        $self->{mWindow} = $self->{mRoot}->initialise(1, "OGRE Render Window");
        return 1;
    }
    else {
        return 0;
    }
}

sub chooseSceneManager {
    my ($self) = @_;

    # Create the SceneManager, in this case a generic one
    $self->{mSceneMgr} = $self->{mRoot}->createSceneManager(Ogre::SceneManager->ST_GENERIC,
                                                            "ExampleSMInstance");
}

sub createCamera {
    my ($self) = @_;

    # Create the camera
    $self->{mCamera} = $self->{mSceneMgr}->createCamera("PlayerCam");

    # Position it at 500 in Z direction
    $self->{mCamera}->setPosition(0, 0, 500);

    # Look back along -Z
    $self->{mCamera}->lookAt(0, 0, -300);
    $self->{mCamera}->setNearClipDistance(5);
}

sub createFrameListener {
    my ($self) = @_;

    $self->{mFrameListener} = ExampleFrameListener->new($self->{mWindow},
                                                        $self->{mCamera});
    $self->{mFrameListener}->showDebugOverlay(1);
    $self->{mRoot}->addFrameListener($self->{mFrameListener});
}

sub createScene {
    die "implement createScene!\n";
}

sub destroyScene { }

sub createViewports {
    my ($self) = @_;

    # Create one viewport, entire window
    my $vp = $self->{mWindow}->addViewport($self->{mCamera});
    $vp->setBackgroundColour(Ogre::ColourValue->new(0,0,0));

    # Alter the camera aspect ratio to match the viewport
    $self->{mCamera}->setAspectRatio($vp->getActualWidth() / $vp->getActualHeight());
}

# Method which will define the source of resources (other than current folder)
sub setupResources {
    my ($self) = @_;

    my $cf = Ogre::ConfigFile->new();
    # resources.cfg and its required media files are included in this directory.
    # You may want to change this, and use different media.
    # Look in the source distribution for OGRE under Samples/Media/ .
    $cf->load($self->{mResourcePath} . "resources.cfg");

    # note: this is a Perlish replacement for iterators used in C++
    my $secs = $cf->getSections();

    # moved this outside the for loops
    my $rgm = Ogre::ResourceGroupManager->getSingletonPtr();

    foreach my $sec (@$secs) {
        my $secName = $sec->{name};

        my $settings = $sec->{settings};
        foreach my $setting (@$settings) {
            my ($typeName, $archName) = @$setting;

            # XXX:
            # if OGRE_PLATFORM == OGRE_PLATFORM_APPLE
            # OS X does not set the working directory relative to the app,
            # In order to make things portable on OS X we need to provide
            # the loading with it's own bundle path location
            # $archName = macBundlePath() . "/" . $archName

            $rgm->addResourceLocation($archName, $typeName, $secName);
        }
    }

}

# Optional override method where you can create resource listeners (e.g. for loading screens)
sub createResourceListener { }

# Optional override method where you can perform resource group loading
# Must at least do ResourceGroupManager::getSingleton().initialiseAllResourceGroups();
sub loadResources {
    # Initialise, parse scripts etc
    Ogre::ResourceGroupManager->getSingletonPtr->initialiseAllResourceGroups();
}


1;


package TutorialFrameListener;
# implements ExampleFrameListener, OIS::MouseListener, OIS::KeyListener

use strict;
use warnings;

# uncomment this if the packages are in separate files
# use ExampleFrameListener;
@TutorialFrameListener::ISA = qw(ExampleFrameListener);

use Ogre 0.22;
use Ogre::Node;

use OIS 0.03;
use OIS::Keyboard;
use OIS::Mouse;


sub new {
    my ($pkg, $win, $cam, $sceneMgr) = @_;

    # call ExampleFrameListener's constructor
    my $super = $pkg->SUPER::new($win, $cam, 1, 1);
    my $self = bless $super, $pkg;

    $self->{mRotate}    = 0.13;       # the rotate constant
    $self->{mMove}      = 250;        # the movement constant
    $self->{mSceneMgr}  = $sceneMgr;  # the current SceneManager
    $self->{mContinue}  = 1;          # whether to continue rendering or not
    # value to move in the correct direction
    $self->{mDirection} = Ogre::Vector3->new(0, 0, 0);
    # the SceneNode the camera is currently attached to
    $self->{mCamNode} = $cam->getParentSceneNode();

    # note: mMouse, mKeyboard are from ExampleFrameListener constructor
    $self->{mMouse}->setEventCallback($self);
    $self->{mKeyboard}->setEventCallback($self);

    return $self;
}

# FrameListener
sub frameStarted {
    my ($self, $evt) = @_;

    if ($self->{mMouse}) {
        $self->{mMouse}->capture();
    }
    if ($self->{mKeyboard}) {
        $self->{mKeyboard}->capture();
    }

    # xxx: have yet to overload * for Vector3,
    # so can't just multiply it by $t
    my $t = $evt->timeSinceLastFrame;
    my $d = $self->{mDirection};
    $self->{mCamNode}->translate($t * $d->x,
                                 $t * $d->y,
                                 $t * $d->z,
                                 Ogre::Node->TS_LOCAL);

    return $self->{mContinue};
}

# MouseListener
sub mouseMoved {
    my ($self, $evt) = @_;

    my $state = $evt->state;
    if ($state->buttonDown(OIS::Mouse->MB_Right)) {
        $self->{mCamNode}->yaw(Ogre::Degree->new(- $self->{mRotate} * $state->X->rel),
                               Ogre::Node->TS_WORLD);
        $self->{mCamNode}->pitch(Ogre::Degree->new(- $self->{mRotate} * $state->Y->rel),
                                 Ogre::Node->TS_LOCAL);
    }

    return 1;
}

# MouseListener
sub mousePressed {
    my ($self, $evt, $id) = @_;

    my $light = $self->{mSceneMgr}->getLight("Light1");

    # left click toggles light on/off
    if ($id == OIS::Mouse->MB_Left) {
        $light->setVisible(! $light->isVisible);
    }

    return 1;
}

# MouseListener
# sub mouseReleased {
#     my ($self, $evt, $id) = @_;
#     return 1;
# }

# KeyListener
sub keyPressed {
    my ($self, $evt) = @_;

    my $key = $evt->key;

    # stop rendering if ESC is pressed
    if ($key == OIS::Keyboard->KC_ESCAPE) {
        $self->{mContinue} = 0;
    }

    # switch between two cameras
    elsif ($key == OIS::Keyboard->KC_1) {
        $self->{mCamera}->getParentSceneNode->detachObject($self->{mCamera});
        $self->{mCamNode} = $self->{mSceneMgr}->getSceneNode("CamNode1");
        $self->{mCamNode}->attachObject($self->{mCamera});
    }
    elsif ($key == OIS::Keyboard->KC_2) {
        $self->{mCamera}->getParentSceneNode->detachObject($self->{mCamera});
        $self->{mCamNode} = $self->{mSceneMgr}->getSceneNode("CamNode2");
        $self->{mCamNode}->attachObject($self->{mCamera});
    }

    # keyboard movement
    elsif ($key == OIS::Keyboard->KC_UP || $key == OIS::Keyboard->KC_W) {
        $self->{mDirection}->setZ($self->{mDirection}->z - $self->{mMove});
    }
    elsif ($key == OIS::Keyboard->KC_DOWN || $key == OIS::Keyboard->KC_S) {
        $self->{mDirection}->setZ($self->{mDirection}->z + $self->{mMove});
    }
    elsif ($key == OIS::Keyboard->KC_LEFT || $key == OIS::Keyboard->KC_A) {
        $self->{mDirection}->setX($self->{mDirection}->x - $self->{mMove});
    }
    elsif ($key == OIS::Keyboard->KC_RIGHT || $key == OIS::Keyboard->KC_D) {
        $self->{mDirection}->setX($self->{mDirection}->x + $self->{mMove});
    }
    elsif ($key == OIS::Keyboard->KC_PGDOWN || $key == OIS::Keyboard->KC_E) {
        $self->{mDirection}->setY($self->{mDirection}->y - $self->{mMove});
    }
    elsif ($key == OIS::Keyboard->KC_PGUP || $key == OIS::Keyboard->KC_Q) {
        $self->{mDirection}->setY($self->{mDirection}->y + $self->{mMove});
    }

    return 1;
}

# KeyListener
sub keyReleased {
    my ($self, $evt) = @_;

    my $key = $evt->key;

    # undo change to mDirection vector when key is released
    if ($key == OIS::Keyboard->KC_UP || $key == OIS::Keyboard->KC_W) {
        $self->{mDirection}->setZ($self->{mDirection}->z + $self->{mMove});
    }
    elsif ($key == OIS::Keyboard->KC_DOWN || $key == OIS::Keyboard->KC_S) {
        $self->{mDirection}->setZ($self->{mDirection}->z - $self->{mMove});
    }
    elsif ($key == OIS::Keyboard->KC_LEFT || $key == OIS::Keyboard->KC_A) {
        $self->{mDirection}->setX($self->{mDirection}->x + $self->{mMove});
    }
    elsif ($key == OIS::Keyboard->KC_RIGHT || $key == OIS::Keyboard->KC_D) {
        $self->{mDirection}->setX($self->{mDirection}->x - $self->{mMove});
    }
    elsif ($key == OIS::Keyboard->KC_PGDOWN || $key == OIS::Keyboard->KC_E) {
        $self->{mDirection}->setY($self->{mDirection}->y + $self->{mMove});
    }
    elsif ($key == OIS::Keyboard->KC_PGUP || $key == OIS::Keyboard->KC_Q) {
        $self->{mDirection}->setY($self->{mDirection}->y - $self->{mMove});
    }

    return 1;
}


1;


package TutorialApplication;

use strict;
use warnings;

use Ogre 0.22;
use Ogre::ColourValue;
use Ogre::Degree;
use Ogre::Light;
use Ogre::Vector3;

# uncomment these if the packages are in separate files
# use TutorialFrameListener;
# use ExampleApplication;
@TutorialApplication::ISA = qw(ExampleApplication);

# sub new {
#     my ($pkg) = @_;

#     require Carp;Carp::confess("new?");


#     my $self = $pkg->SUPER::new();
#     bless $self, $pkg;
#     return $self;
# }

sub createCamera {
    my ($self) = @_;

    $self->{mCamera} = $self->{mSceneMgr}->createCamera("PlayerCam");
    $self->{mCamera}->setNearClipDistance(5);
}

sub createScene {
    my ($self) = @_;

    $self->{mSceneMgr}->setAmbientLight(Ogre::ColourValue->new(0.25, 0.25, 0.25));

    # add the ninja
    my $ent = $self->{mSceneMgr}->createEntity("Ninja", "ninja.mesh");
    my $node = $self->{mSceneMgr}->getRootSceneNode()->createChildSceneNode("NinjaNode");
    $node->attachObject($ent);

    # create the light
    my $light = $self->{mSceneMgr}->createLight("Light1");
    $light->setType(Ogre::Light->LT_POINT);
    $light->setPosition(250, 150, 250);
    $light->setDiffuseColour(1, 1, 1);
    $light->setSpecularColour(1, 1, 1);

    # Create the scene node
    $node = $self->{mSceneMgr}->getRootSceneNode()->createChildSceneNode("CamNode1",
                                                                         Ogre::Vector3->new(-400, 200, 400));

    # Make it look towards the ninja
    $node->yaw(Ogre::Degree->new(-45));

    # Create the pitch node
    $node = $node->createChildSceneNode("PitchNode1");
    $node->attachObject($self->{mCamera});

    # create the second camera node/pitch node
    $node = $self->{mSceneMgr}->getRootSceneNode()->createChildSceneNode("CamNode2",
                                                                         Ogre::Vector3->new(0, 200, 400));
    $node = $node->createChildSceneNode("PitchNode2");
}

sub createFrameListener {
    my ($self) = @_;

    # Create the FrameListener
    $self->{mFrameListener} = TutorialFrameListener->new($self->{mWindow},
                                                         $self->{mCamera},
                                                         $self->{mSceneMgr});
    $self->{mRoot}->addFrameListener($self->{mFrameListener});

    # Show the frame stats overlay
    $self->{mFrameListener}->showDebugOverlay(1);
}


1;


package main;

use strict;
use warnings;


# uncomment this if the packages are in separate files
# use TutorialApplication;

main();
exit(0);

sub main {
    my $app = TutorialApplication->new();
    $app->go();
}
