MODULE = Ogre     PACKAGE = Ogre::MaterialManager

static MaterialManager *
MaterialManager::getSingletonPtr()

## void setDefaultTextureFiltering(TextureFilterOptions fo)

void
MaterialManager::setDefaultAnisotropy(maxAniso)
    unsigned int  maxAniso

unsigned int
MaterialManager::getDefaultAnisotropy()
