MODULE = Ogre     PACKAGE = Ogre::Root

Root *
Root::new(pluginFileName, configFileName, logFileName)
    String  pluginFileName
    String  configFileName
    String  logFileName

void
Root::DESTROY()

bool
Root::restoreConfig()

bool
Root::showConfigDialog()

## RenderWindow * initialise(bool autoCreateWindow, const String &windowTitle="OGRE Render Window")
RenderWindow *
Root::initialise(autoCreateWindow, windowTitle)
    bool    autoCreateWindow
    String  windowTitle

## note: there are 2 variants of this in the C++ API
SceneManager *
Root::createSceneManager(typeMask, instanceName)
    uint16 typeMask
    String instanceName

RenderWindow *
Root::getAutoCreatedWindow()

void
Root::startRendering()
