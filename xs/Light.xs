MODULE = Ogre     PACKAGE = Ogre::Light

void
Light::setType(type)
    int type
  C_ARGS:
    (Ogre::Light::LightTypes)type

## this has 2 versions in the C++ API
void
Light::setPosition(x, y, z)
    float x
    float y
    float z

## this has 2 versions in the C++ API
void
Light::setDiffuseColour(red, green, blue)
    float red
    float green
    float blue

## this has 2 versions in the C++ API
void
Light::setSpecularColour(red, green, blue)
    float red
    float green
    float blue


## LightTypes enum
static int
Light::LT_POINT()
  ALIAS:
    Ogre::Light::LT_DIRECTIONAL = 1
    Ogre::Light::LT_SPOTLIGHT = 2
  CODE:
    switch (ix) {
        case 0: RETVAL = Ogre::Light::LT_POINT; break;
        case 1: RETVAL = Ogre::Light::LT_DIRECTIONAL; break;
        case 2: RETVAL = Ogre::Light::LT_SPOTLIGHT; break;
    }
  OUTPUT:
    RETVAL
