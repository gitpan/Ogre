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


##Ogre.c: In function 'void XS_Ogre__Vector3_nil(PerlInterpreter*, CV*)':
##Ogre.c:11158: error: 'ax' was not declared in this scope
##Ogre.c: In function 'void boot_Ogre(PerlInterpreter*, CV*)':
##Ogre.c:11180: error: cannot convert 'sv' to 'SV*' for argument '3' to 'void Perl_sv_setsv_flags(PerlInterpreter*, SV*, SV*, I32)'

## overloaded ops, perldoc perlxs
##bool
##equals(lobj, robj, swap)
##    Vector3 * lobj
##    Vector3 * robj
##    IV        swap
##  OVERLOAD: ==
##  CODE:
##    RETVAL = (*lobj == *robj);
##  OUTPUT:
##    RETVAL

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
