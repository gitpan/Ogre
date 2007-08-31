MODULE = Ogre     PACKAGE = Ogre::ResourceGroupManager

static ResourceGroupManager *
ResourceGroupManager::getSingletonPtr()

## void addResourceLocation (const String &name, const String &locType, const String &resGroup=DEFAULT_RESOURCE_GROUP_NAME, bool recursive=false)
void
ResourceGroupManager::addResourceLocation(name, locType, resGroup)
    String  name
    String  locType
    String  resGroup

void
ResourceGroupManager::initialiseAllResourceGroups()


## resource group names
static String
ResourceGroupManager::DEFAULT_RESOURCE_GROUP_NAME()
  ALIAS:
    Ogre::ResourceGroupManager::INTERNAL_RESOURCE_GROUP_NAME = 1
    Ogre::ResourceGroupManager::BOOTSTRAP_RESOURCE_GROUP_NAME = 2
    Ogre::ResourceGroupManager::AUTODETECT_RESOURCE_GROUP_NAME = 3
  CODE:
    switch (ix) {
        case 0: RETVAL = Ogre::ResourceGroupManager::DEFAULT_RESOURCE_GROUP_NAME; break;
        case 1: RETVAL = Ogre::ResourceGroupManager::INTERNAL_RESOURCE_GROUP_NAME; break;
        case 2: RETVAL = Ogre::ResourceGroupManager::BOOTSTRAP_RESOURCE_GROUP_NAME; break;
        case 3: RETVAL = Ogre::ResourceGroupManager::AUTODETECT_RESOURCE_GROUP_NAME; break;
    }
  OUTPUT:
    RETVAL
