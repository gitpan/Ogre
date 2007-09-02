MODULE = Ogre     PACKAGE = Ogre::Vector3

Vector3 *
Vector3::new(fX, fY, fZ)
    float  fX
    float  fY
    float  fZ

void
Vector3::DESTROY()

## xxx: it would be nice to be able to do this: $v->{x} = 20;
## but how is that done (the object is a pointer to a C++ object,
## not a hash). For now, we have this gimpy interface with setX, etc.

float
Vector3::x()
  CODE:
    RETVAL = (*THIS).x;
  OUTPUT:
    RETVAL

float
Vector3::y()
  CODE:
    RETVAL = (*THIS).y;
  OUTPUT:
    RETVAL

float
Vector3::z()
  CODE:
    RETVAL = (*THIS).z;
  OUTPUT:
    RETVAL

void
Vector3::setX(x)
    float  x
  CODE:
    (*THIS).x = x;

void
Vector3::setY(y)
    float  y
  CODE:
    (*THIS).y = y;

void
Vector3::setZ(z)
    float  z
  CODE:
    (*THIS).z = z;

float
Vector3::length()

float
Vector3::squaredLength()

float
Vector3::distance(rhs)
    Vector3 * rhs
  C_ARGS:
    *rhs

float
Vector3::squaredDistance(rhs)
    Vector3 * rhs
  C_ARGS:
    *rhs

float
Vector3::dotProduct(vec)
    Vector3 * vec
  C_ARGS:
    *vec

float
Vector3::absDotProduct(vec)
    Vector3 * vec
  C_ARGS:
    *vec

float
Vector3::normalise()

# ...

void
Vector3::makeFloor(cmp)
    Vector3 * cmp
  C_ARGS:
    *cmp

void
Vector3::makeCeil(cmp)
    Vector3 * cmp
  C_ARGS:
    *cmp

# ...

bool
Vector3::isZeroLength()

bool
Vector3::positionEquals(rhs, tolerance=0.001)
    Vector3 * rhs
    float  tolerance
  C_ARGS:
    *rhs, tolerance

bool
Vector3::positionCloses(rhs, tolerance=0.001)
    Vector3 * rhs
    float  tolerance
  C_ARGS:
    *rhs, tolerance

bool
Vector3::directionEquals(rhs, tolerance)
    Vector3 * rhs
    Radian * tolerance
  C_ARGS:
    *rhs, *tolerance


## XXX: I tried hard to make this work,
## but how do you make Perl not try to delete these pointers?
## special vectors
#static Vector3 *
#Vector3::ZERO()
#  ALIAS:
#    Ogre::Vector3::UNIT_X = 1
#    Ogre::Vector3::UNIT_Y = 2
#    Ogre::Vector3::UNIT_Z = 3
#    Ogre::Vector3::NEGATIVE_UNIT_X = 4
#    Ogre::Vector3::NEGATIVE_UNIT_Y = 5
#    Ogre::Vector3::NEGATIVE_UNIT_Z = 6
#    Ogre::Vector3::UNIT_SCALE = 7
#  PREINIT:
#    Vector3 vp;
#  CODE:
#    switch (ix) {
#        case 0: vp.x = Vector3::ZERO.x; vp.x = Vector3::ZERO.z; vp.z = Vector3::ZERO.z; break;
#        case 1: vp.x = Vector3::UNIT_X.x; vp.y = Vector3::UNIT_X.y; vp.z = Vector3::UNIT_X.z; break;
#        case 2: vp.x = Vector3::UNIT_Y.x; vp.y = Vector3::UNIT_Y.y; vp.z = Vector3::UNIT_Y.z; break;
#        case 3: vp.x = Vector3::UNIT_Z.x; vp.y = Vector3::UNIT_Z.y; vp.z = Vector3::UNIT_Z.z; break;
#        case 4: vp.x = Vector3::NEGATIVE_UNIT_X.x; vp.y = Vector3::NEGATIVE_UNIT_X.y; vp.z = Vector3::NEGATIVE_UNIT_X.z; break;
#        case 5: vp.x = Vector3::NEGATIVE_UNIT_Y.x; vp.y = Vector3::NEGATIVE_UNIT_Y.y; vp.z = Vector3::NEGATIVE_UNIT_Y.z; break;
#        case 6: vp.x = Vector3::NEGATIVE_UNIT_Z.x; vp.y = Vector3::NEGATIVE_UNIT_Z.y; vp.z = Vector3::NEGATIVE_UNIT_Z.z; break;
#        case 7: vp.x = Vector3::UNIT_SCALE.x; vp.y = Vector3::UNIT_SCALE.y; vp.z = Vector3::UNIT_SCALE.z; break;
#    }
#    RETVAL = &vp;
#  OUTPUT:
#    RETVAL
