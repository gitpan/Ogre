MODULE = Ogre     PACKAGE = Ogre::MaterialManager

static MaterialManager *
MaterialManager::getSingletonPtr()

## xxx: all the ResourceManager subclasses need to override 'load' like this
## xxx: skipped last arg, NameValuePairList
Material *
MaterialManager::load(String name, String group, bool isManual=false, ManualResourceLoader *loader=0)
  CODE:
    MaterialPtr mat = THIS->load(name, group, isManual, loader);
    RETVAL = mat.getPointer();
  OUTPUT:
    RETVAL

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
