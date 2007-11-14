MODULE = Ogre     PACKAGE = Ogre::Ray

## xxx: constructors, destructor


void
Ray::setOrigin(origin)
    Vector3 * origin
  C_ARGS:
    *origin

## const Vector3 & 	getOrigin (void) const

void
Ray::setDirection(dir)
    Vector3 * dir
  C_ARGS:
    *dir

## const Vector3 & 	getDirection (void) const

## Vector3 	getPoint (Real t) const

## Vector3 	operator * (Real t) const

##std::pair< bool, Real > 	intersects ( Plane &p) 
##std::pair< bool, Real > 	intersects ( PlaneBoundedVolume &p) 
##std::pair< bool, Real > 	intersects ( Sphere &s) 
##std::pair< bool, Real > 	intersects ( AxisAlignedBox &box)

