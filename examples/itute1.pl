#!/usr/bin/perl
# This is OGRE's "Intermediate Tutorial 1" in Perl.
# Read that tutorial:
# http://www.ogre3d.org/wiki/index.php/Intermediate_Tutorial_1


package MoveDemoListener;

use strict;
use warnings;

use Ogre::ExampleFrameListener;
@MoveDemoListener::ISA = qw(Ogre::ExampleFrameListener);

use Ogre 0.24;
use Ogre::Quaternion;
use Ogre::Vector3;


sub new {
    my ($pkg, $win, $cam, $sn, $ent, $walk) = @_;

    my $super = $pkg->SUPER::new($win, $cam, 0, 0);
    my $self = bless $super, $pkg;

    $self->{mEntity} = $ent;    # The Entity we are animating
    $self->{mSceneNode} = $sn;  # The SceneNode that the Entity is attached to
    $self->{mWalkList} = $walk; # The list of points we are walking to

    $self->{mWalkSpeed} = 35;  # The speed at which the object is moving
    $self->{mDistance} = 0;    # The distance the object has left to travel
    # direction object is moving, and destination it's moving towards
    $self->{mDirection}   = Ogre::Vector3->new(0, 0, 0);
    $self->{mDestination} = Ogre::Vector3->new(0, 0, 0);


    if (0) {
        # set idle animation
        $self->{mAnimationState} = $ent->getAnimationState("Idle");
        $self->{mAnimationState}->setLoop(1);
        $self->{mAnimationState}->setEnabled(1);
    }

    return $self;
}

# This function is called to start the object moving to the next position in mWalkList.
sub nextLocation {
    return 1;
}

sub frameStarted {
    my ($self, $evt) = @_;




    $self->{mAnimationState}->addTime($evt->timeSinceLastFrame);

    return $self->SUPER::frameStarted($evt);
}


package MoveDemoApplication;

use strict;
use warnings;

use Ogre::ExampleApplication;
@MoveDemoApplication::ISA = qw(Ogre::ExampleApplication);

use Ogre 0.24;
use Ogre::Degree;
use Ogre::ColourValue;
use Ogre::Vector3;


sub new {
    my ($pkg) = @_;

    # call ExampleFrameListener's constructor
    my $super = $pkg->SUPER::new();
    my $self = bless $super, $pkg;

    $self->{mEntity} = undef;     # The Entity of the object we are animating
    $self->{mNode} = undef;  # The SceneNode of the object we are moving
    $self->{mWalkList} = [];      # The waypoints

    return $self;
}

sub createScene {
    my ($self) = @_;

    # set default lighting
    $self->{mSceneMgr}->setAmbientLight(Ogre::ColourValue->new(1, 1, 1));

    # create entity
    $self->{mEntity} = $self->{mSceneMgr}->createEntity("Robot", "robot.mesh");

    # create scene node
    $self->{mNode} = $self->{mSceneMgr}->getRootSceneNode->createChildSceneNode("RobotNode",
                                                                                Ogre::Vector3->new(0, 0, 25));
    $self->{mNode}->attachObject($self->{mEntity});

    # note: in C++ this is a deque; we call that an array in Perl :)
    push @{ $self->{mWalkList} }, Ogre::Vector3->new(550, 0, 50);
    push @{ $self->{mWalkList} }, Ogre::Vector3->new(-100, 0, -200);

    # create objects so we can see movement

    # Knot1
    my $ent = $self->{mSceneMgr}->createEntity("Knot1", "knot.mesh");
    my $node = $self->{mSceneMgr}->getRootSceneNode->createChildSceneNode("Knot1Node",
                                                                          Ogre::Vector3->new(0, -10, 25));
    $node->attachObject($ent);
    $node->setScale(0.1, 0.1, 0.1);

    # Knot2
    $ent = $self->{mSceneMgr}->createEntity("Knot2", "knot.mesh");
    $node = $self->{mSceneMgr}->getRootSceneNode->createChildSceneNode("Knot2Node",
                                                                       Ogre::Vector3->new(550, -10, 50));
    $node->attachObject($ent);
    $node->setScale(0.1, 0.1, 0.1);

    # Knot3
    $ent = $self->{mSceneMgr}->createEntity("Knot3", "knot.mesh");
    $node = $self->{mSceneMgr}->getRootSceneNode->createChildSceneNode("Knot3Node",
                                                                       Ogre::Vector3->new(-100, -10, -200));
    $node->attachObject($ent);
    $node->setScale(0.1, 0.1, 0.1);

    # set the camera
    $self->{mCamera}->setPosition(90, 280, 535);
    $self->{mCamera}->pitch(Ogre::Degree->new(-30));
    $self->{mCamera}->yaw(Ogre::Degree->new(-15));
}

sub createFrameListener {
    my ($self) = @_;

    $self->{mFrameListener} = MoveDemoListener->new($self->{mWindow},
                                                    $self->{mCamera},
                                                    $self->{mNode},
                                                    $self->{mEntity},
                                                    $self->{mWalkList}
                                                );
    $self->{mFrameListener}->showDebugOverlay(1);
    $self->{mRoot}->addFrameListener($self->{mFrameListener});
}


1;


package main;

# uncomment this if the packages are in separate files:
# use MoveDemoApplication;

MoveDemoApplication->new->go();
