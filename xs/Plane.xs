MODULE = Ogre     PACKAGE = Ogre::Plane

Plane *
new0()
  CODE:
    RETVAL = new Plane();
  OUTPUT:
    RETVAL

Plane *
new2(rkNormal, fConstant)
    Vector3 * rkNormal
    float     fConstant
  CODE:
    RETVAL = new Plane(*rkNormal, fConstant);
  OUTPUT:
    RETVAL

void
Plane::DESTROY()


float
Plane::d()
  CODE:
    RETVAL = (*THIS).d;
  OUTPUT:
    RETVAL

# xxx: note: this is just:  Plane p; p.d = d;  in C++....
void
Plane::setD(d)
    float  d
  CODE:
    (*THIS).d = d;

Vector3 *
Plane::normal()
  CODE:
    // this can't be right....
    Vector3 *vec = new Vector3;
    *vec = (*THIS).normal;
    RETVAL = vec;
  OUTPUT:
    RETVAL

# xxx: this does not exist in C++ either
void
Plane::setNormal(normal)
    Vector3 * normal
  CODE:
    (*THIS).normal = *normal;
