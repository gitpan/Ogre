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

void
SceneManager::setShadowTechnique(technique)
    int  technique
  C_ARGS:
    (ShadowTechnique)technique

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

## ShadowTechnique enum
## (this is not actually in Ogre::SceneManager, though)
static int
SceneManager::SHADOWTYPE_NONE()
  ALIAS:
    Ogre::SceneManager::SHADOWDETAILTYPE_ADDITIVE = 1
    Ogre::SceneManager::SHADOWDETAILTYPE_MODULATIVE = 2
    Ogre::SceneManager::SHADOWDETAILTYPE_INTEGRATED = 3
    Ogre::SceneManager::SHADOWDETAILTYPE_STENCIL = 4
    Ogre::SceneManager::SHADOWDETAILTYPE_TEXTURE = 5
    Ogre::SceneManager::SHADOWTYPE_STENCIL_MODULATIVE = 6
    Ogre::SceneManager::SHADOWTYPE_STENCIL_ADDITIVE = 7
    Ogre::SceneManager::SHADOWTYPE_TEXTURE_MODULATIVE = 8
    Ogre::SceneManager::SHADOWTYPE_TEXTURE_ADDITIVE = 9
    Ogre::SceneManager::SHADOWTYPE_TEXTURE_ADDITIVE_INTEGRATED = 10
    Ogre::SceneManager::SHADOWTYPE_TEXTURE_MODULATIVE_INTEGRATED = 11
  CODE:
    switch (ix) {
      case 0: RETVAL = Ogre::SHADOWDETAILTYPE_ADDITIVE; break;
      case 1: RETVAL = Ogre::SHADOWDETAILTYPE_ADDITIVE; break;
      case 2: RETVAL = Ogre::SHADOWDETAILTYPE_MODULATIVE; break;
      case 3: RETVAL = Ogre::SHADOWDETAILTYPE_INTEGRATED; break;
      case 4: RETVAL = Ogre::SHADOWDETAILTYPE_STENCIL; break;
      case 5: RETVAL = Ogre::SHADOWDETAILTYPE_TEXTURE; break;
      case 6: RETVAL = Ogre::SHADOWTYPE_STENCIL_MODULATIVE; break;
      case 7: RETVAL = Ogre::SHADOWTYPE_STENCIL_ADDITIVE; break;
      case 8: RETVAL = Ogre::SHADOWTYPE_TEXTURE_MODULATIVE; break;
      case 9: RETVAL = Ogre::SHADOWTYPE_TEXTURE_ADDITIVE; break;
      case 10: RETVAL = Ogre::SHADOWTYPE_TEXTURE_ADDITIVE_INTEGRATED; break;
      case 11: RETVAL = Ogre::SHADOWTYPE_TEXTURE_MODULATIVE_INTEGRATED; break;
    }
  OUTPUT:
    RETVAL
