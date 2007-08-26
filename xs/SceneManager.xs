MODULE = Ogre     PACKAGE = Ogre::SceneManager

Camera *
SceneManager::createCamera(name)
    String  name

Light *
SceneManager::createLight(name)
    String  name

void
SceneManager::setAmbientLight(colour)
    ColourValue * colour
  C_ARGS:
    *colour

## there are 2 versions in the C++ API
Entity *
SceneManager::createEntity(entityName, meshName)
    String entityName
    String meshName

SceneNode *
SceneManager::getRootSceneNode()


## SceneType enum
static uint16
SceneManager::ST_GENERIC()
  ALIAS:
    Ogre::SceneManager::ST_EXTERIOR_CLOSE = 1
    Ogre::SceneManager::ST_EXTERIOR_FAR = 2
    Ogre::SceneManager::ST_EXTERIOR_REAL_FAR = 3
    Ogre::SceneManager::ST_INTERIOR = 4
  CODE:
    // for some reason this is in Ogre::, while PrefabType below is in Ogre::SceneManager::
    switch (ix) {
        case 0: RETVAL = Ogre::ST_GENERIC; break;
        case 1: RETVAL = Ogre::ST_EXTERIOR_CLOSE; break;
        case 2: RETVAL = Ogre::ST_EXTERIOR_FAR; break;
        case 3: RETVAL = Ogre::ST_EXTERIOR_REAL_FAR; break;
        case 4: RETVAL = Ogre::ST_INTERIOR; break;
    }
  OUTPUT:
    RETVAL

## PrefabType enum
static int
SceneManager::PT_PLANE()
  ALIAS:
    Ogre::SceneManager::PT_CUBE = 1
    Ogre::SceneManager::PT_SPHERE = 2
  CODE:
    switch (ix) {
        case 0: RETVAL = Ogre::SceneManager::PT_PLANE; break;
        case 1: RETVAL = Ogre::SceneManager::PT_CUBE; break;
        case 2: RETVAL = Ogre::SceneManager::PT_SPHERE; break;
    }
  OUTPUT:
    RETVAL
