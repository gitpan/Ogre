MODULE = Ogre     PACKAGE = Ogre::Vector3

Vector3 *
Vector3::new(...)
  PREINIT:
    char *usage = "Usage: Ogre::Vector3::new(CLASS, x [, y, z]) or new(CLASS, Vector3)\n";
  CODE:
    // Vector3(const Real fX, const Real fY, const Real fZ)
    if (items == 4) {
        RETVAL = new Vector3((Real)SvNV(ST(1)), (Real)SvNV(ST(2)), (Real)SvNV(ST(3)));
    }
    else if (items == 2) {
        // Vector3(const Vector3 &rkVector)
        if (sv_isobject(ST(1)) && sv_derived_from(ST(1), "Ogre::Vector3")) {
            Vector3 *vec = (Vector3 *) SvIV((SV *) SvRV(ST(1)));   // TMOGRE_IN
            RETVAL = new Vector3(*vec);
        }
        // Vector3(const Real scalar)
        else if (looks_like_number(ST(1))) {
            RETVAL = new Vector3((Real)SvNV(ST(1)));
        }
        else {
            croak(usage);
        }
    }
    else if (items == 1) {
        RETVAL = new Vector3();
    }
    else {
        croak(usage);
    }
  OUTPUT:
    RETVAL

void
Vector3::DESTROY()


## overloaded ops, perldoc perlxs
#bool
#Vector3::cmp(lobj, robj, swap)
#    Vector3 * lobj
#    Vector3 * robj
#    IV        swap
#  OVERLOAD: ==
#    RETVAL = (*lobj == *robj);


# ==, !=, <, >
bool
eq_xs(lobj, robj, swap)
    Vector3 * lobj
    Vector3 * robj
    IV        swap
  ALIAS:
    ne_xs = 1
    lt_xs = 2
    gt_xs = 3
  CODE:
    switch(ix) {
        case 0: RETVAL = (*lobj == *robj); break;
        case 1: RETVAL = (*lobj != *robj); break;
        case 2: RETVAL = (*lobj < *robj); break;
        case 3: RETVAL = (*lobj > *robj); break;
    }
  OUTPUT:
    RETVAL

# xxx: this is incomplete (no mult by Real, for example)
# +, -
Vector3 *
plus_xs(lobj, robj, swap)
    Vector3 * lobj
    Vector3 * robj
    IV        swap
  ALIAS:
    minus_xs = 1
    mult_xs = 2
    div_xs = 3
  PREINIT:
    Vector3 *vec = new Vector3;
  CODE:
    switch(ix) {
        case 0: *vec = *lobj + *robj; break;
        case 1: *vec = swap ? (*robj - *lobj) : (*lobj - *robj); break;
        case 2: *vec = *lobj * *robj; break;
        case 3: *vec = swap ? (*robj / *lobj) : (*lobj / *robj); break;
    }
    RETVAL = vec;
  OUTPUT:
    RETVAL


## xxx: it would be nice to be able to do this: $v->{x} = 20;
## but how is that done (the object is a pointer to a C++ object,
## not a hash). For now, we have this gimpy interface with setX, etc.

Real
Vector3::x()
  CODE:
    RETVAL = (*THIS).x;
  OUTPUT:
    RETVAL

Real
Vector3::y()
  CODE:
    RETVAL = (*THIS).y;
  OUTPUT:
    RETVAL

Real
Vector3::z()
  CODE:
    RETVAL = (*THIS).z;
  OUTPUT:
    RETVAL

void
Vector3::setX(x)
    Real  x
  CODE:
    (*THIS).x = x;

void
Vector3::setY(y)
    Real  y
  CODE:
    (*THIS).y = y;

void
Vector3::setZ(z)
    Real  z
  CODE:
    (*THIS).z = z;

Real
Vector3::length()

Real
Vector3::squaredLength()

Real
Vector3::distance(rhs)
    Vector3 * rhs
  C_ARGS:
    *rhs

Real
Vector3::squaredDistance(rhs)
    Vector3 * rhs
  C_ARGS:
    *rhs

Real
Vector3::dotProduct(vec)
    Vector3 * vec
  C_ARGS:
    *vec

Real
Vector3::absDotProduct(vec)
    Vector3 * vec
  C_ARGS:
    *vec

Real
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
    Real  tolerance
  C_ARGS:
    *rhs, tolerance

bool
Vector3::positionCloses(rhs, tolerance=0.001)
    Vector3 * rhs
    Real  tolerance
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
