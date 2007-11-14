MODULE = Ogre     PACKAGE = Ogre::Vector2

## xxx: constructors, destructor, operators


Real
Vector2::length()

Real
Vector2::squaredLength()

Real
Vector2::dotProduct(vec)
    Vector2 * vec
  C_ARGS:
    *vec

Real
Vector2::normalise()

## Vector2 	midPoint (const Vector2 &vec) const

void
Vector2::makeFloor(cmp)
    Vector2 * cmp
  C_ARGS:
    *cmp

void
Vector2::makeCeil(cmp)
    Vector2 * cmp
  C_ARGS:
    *cmp

## Vector2 	perpendicular (void) const

Real
Vector2::crossProduct(rkVector)
    Vector2 * rkVector
  C_ARGS:
    *rkVector

## Vector2 	randomDeviant (Real angle) const

bool
Vector2::isZeroLength()

## Vector2 	normalisedCopy (void) const

## Vector2 	reflect (const Vector2 &normal) const

