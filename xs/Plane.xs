MODULE = Ogre     PACKAGE = Ogre::Plane

Plane *
Plane::new(rkNormal, fConstant)
    Vector3 * rkNormal
    float     fConstant
  C_ARGS:
    *rkNormal, fConstant

void
Plane::DESTROY()
