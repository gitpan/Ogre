MODULE = Ogre     PACKAGE = Ogre::Light

##Light *
##Light::new(name)
##    String  name
##
##void
##Light::DESTROY()

void
Light::setType(type)
    int  type
  C_ARGS:
    (Ogre::Light::LightTypes)type

int
Light::getType()

## this has 2 versions in the C++ API
void
Light::setDiffuseColour(red, green, blue)
    Real  red
    Real  green
    Real  blue

## const ColourValue & 	getDiffuseColour (void) const

## this has 2 versions in the C++ API
void
Light::setSpecularColour(red, green, blue)
    Real  red
    Real  green
    Real  blue

## ColourValue & 	getSpecularColour (void) const

void
Light::setAttenuation(Real range, Real constant, Real linear, Real quadratic)

Real
Light::getAttenuationRange()

Real
Light::getAttenuationConstant()

Real
Light::getAttenuationLinear()

Real
Light::getAttenuationQuadric()

## this has 2 versions in the C++ API
void
Light::setPosition(x, y, z)
    Real  x
    Real  y
    Real  z

## const Vector3 & 	getPosition (void) const

## this has 2 versions in the C++ API
void
Light::setDirection(x, y, z)
    Real  x
    Real  y
    Real  z

## const Vector3 & 	getDirection (void) const

void
Light::setSpotlightRange(innerAngle, outerAngle, falloff=1.0)
    DegRad * innerAngle
    DegRad * outerAngle
    Real  falloff
  C_ARGS:
    *innerAngle, *outerAngle, falloff

## const Radian & 	getSpotlightInnerAngle (void) const
## const Radian & 	getSpotlightOuterAngle (void) const

Real
Light::getSpotlightFalloff()

void
Light::setSpotlightInnerAngle(val)
    DegRad * val
  C_ARGS:
    *val

void
Light::setSpotlightOuterAngle(val)
    DegRad * val
  C_ARGS:
    *val

void
Light::setSpotlightFalloff(Real val)

void
Light::setPowerScale(Real power)

Real
Light::getPowerScale()

## const AxisAlignedBox & getBoundingBox()

String
Light::getMovableType()

## const Vector3 & getDerivedPosition()

## const Vector3 & getDerivedDirection()

void
Light::setVisible(bool visible)

Real
Light::getBoundingRadius()

## Vector4 getAs4DVector()

uint32
Light::getTypeFlags()

AnimableValue *
Light::createAnimableValue(valueName)
    String valueName
  CODE:
    RETVAL = THIS->createAnimableValue(valueName).getPointer();
  OUTPUT:
    RETVAL

## void Light::setCustomShadowCameraSetup(const ShadowCameraSetupPtr &customShadowSetup)

void
Light::resetCustomShadowCameraSetup()

## const ShadowCameraSetupPtr & getCustomShadowCameraSetup()

