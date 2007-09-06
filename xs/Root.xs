MODULE = Ogre     PACKAGE = Ogre::Root

Root *
Root::new(...)
  CODE:
    if (items == 1) {
        RETVAL = new Root();
    }
    else if (items == 2) {
	String pluginFileName((char *) SvPV_nolen(ST(1)));
        RETVAL = new Root(pluginFileName);
    }
    else if (items == 3) {
	String pluginFileName((char *) SvPV_nolen(ST(1)));
	String configFileName((char *) SvPV_nolen(ST(2)));
        RETVAL = new Root(pluginFileName, configFileName);
    }
    else if (items == 4) {
	String pluginFileName((char *) SvPV_nolen(ST(1)));
	String configFileName((char *) SvPV_nolen(ST(2)));
	String logFileName((char *) SvPV_nolen(ST(3)));
        RETVAL = new Root(pluginFileName, configFileName, logFileName);
    }
    else {
        croak("Usage: Ogre::Root::new(CLASS [, pluginFileName [, configFileName [, logFileName]]])\n");
    }
  OUTPUT:
    RETVAL

void
Root::DESTROY()

void
Root::saveConfig()

bool
Root::restoreConfig()

bool
Root::showConfigDialog()

# addRenderSystem, ...

## RenderWindow * initialise(bool autoCreateWindow, const String &windowTitle="OGRE Render Window")
RenderWindow *
Root::initialise(autoCreateWindow, windowTitle)
    bool    autoCreateWindow
    String  windowTitle

bool
Root::isInitialised()

# addSceneManagerFactory, ...

## note: there are 2 variants of this in the C++ API
SceneManager *
Root::createSceneManager(typeMask, instanceName)
    uint16  typeMask
    String  instanceName

void
Root::destroySceneManager(sm)
    SceneManager * sm

SceneManager *
Root::getSceneManager(instanceName)
    String  instanceName

TextureManager *
Root::getTextureManager()

MeshManager *
Root::getMeshManager()

String
Root::getErrorDescription(errorNumber)
    long  errorNumber

## pass in Perl object of class implementing Ogre::FrameListener
void
Root::addFrameListener(perlListener)
    SV * perlListener
  CODE:
    pogreListenerManager.addFrameListener(perlListener, THIS);

void
Root::removeFrameListener(perlListener)
    SV * perlListener
  CODE:
    pogreListenerManager.removeFrameListener(perlListener, THIS);

void
Root::queueEndRendering()

void
Root::startRendering()

bool
Root::renderOneFrame()

void
Root::shutdown()

# ResourceLocation, ....

RenderWindow *
Root::getAutoCreatedWindow()

# RenderWindow * createRenderWindow(const String &name, unsigned int width, unsigned int height, bool fullScreen, const NameValuePairList *miscParams=0)
RenderWindow *
Root::createRenderWindow(name, width, height, fullScreen)
    String        name
    unsigned int  width
    unsigned int  height
    bool          fullScreen

# xxx: 2 versions
void
Root::detachRenderTarget(name)
    String  name

RenderTarget *
Root::getRenderTarget(name)
    String  name

void
Root::loadPlugin(pluginName)
    String  pluginName

void
Root::unloadPlugin(pluginName)
    String  pluginName

# installPlugin, uninstallPlugin, ..., getTimer

unsigned long
Root::getCurrentFrameNumber()


# ...


void
Root::clearEventTimes()

void
Root::setFrameSmoothingPeriod(period)
    Real  period

Real
Root::getFrameSmoothingPeriod()


# ...
