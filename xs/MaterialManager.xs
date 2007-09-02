MODULE = Ogre     PACKAGE = Ogre::MaterialManager

static MaterialManager *
MaterialManager::getSingletonPtr()

void
MaterialManager::setDefaultTextureFiltering(fo)
    int  fo
  C_ARGS:
    (TextureFilterOptions)fo

void
MaterialManager::setDefaultAnisotropy(maxAniso)
    unsigned int  maxAniso

unsigned int
MaterialManager::getDefaultAnisotropy()
