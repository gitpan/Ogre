MODULE = Ogre     PACKAGE = Ogre::Light

void
Light::setType(type)
    int  type
  C_ARGS:
    (Ogre::Light::LightTypes)type

## this has 2 versions in the C++ API
void
Light::setPosition(x, y, z)
    Real  x
    Real  y
    Real  z

## this has 2 versions in the C++ API
void
Light::setDiffuseColour(red, green, blue)
    Real  red
    Real  green
    Real  blue

## this has 2 versions in the C++ API
void
Light::setSpecularColour(red, green, blue)
    Real  red
    Real  green
    Real  blue

## this has 2 versions in the C++ API
void
Light::setDirection(x, y, z)
    Real  x
    Real  y
    Real  z

void
Light::setSpotlightRange(innerAngle, outerAngle, falloff=1.0)
    DegRad * innerAngle
    DegRad * outerAngle
    Real  falloff
  C_ARGS:
    *innerAngle, *outerAngle, falloff
