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
