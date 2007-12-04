MODULE = Ogre     PACKAGE = Ogre::Vector2

## xxx: operator overloading methods

Vector2 *
Vector2::new(...)
  PREINIT:
    char *usage = "Usage: Ogre::Vector2::new(CLASS, x [, y]) or new(CLASS, Vector2)\n";
  CODE:
    // Vector2(const Real fX, const Real fY)
    if (items == 3) {
        RETVAL = new Vector2((Real)SvNV(ST(1)), (Real)SvNV(ST(2)));
    }
    else if (items == 2) {
        // Vector2(const Vector2 &rkVector)
        if (sv_isobject(ST(1)) && sv_derived_from(ST(1), "Ogre::Vector2")) {
            Vector2 *vec = (Vector2 *) SvIV((SV *) SvRV(ST(1)));   // TMOGRE_IN
            RETVAL = new Vector2(*vec);
        }
        // Vector2(const Real scalar)
        else if (looks_like_number(ST(1))) {
            RETVAL = new Vector2((Real)SvNV(ST(1)));
        }
        else {
            croak(usage);
        }
    }
    else if (items == 1) {
        RETVAL = new Vector2();
    }
    else {
        croak(usage);
    }
  OUTPUT:
    RETVAL

void
Vector2::DESTROY()

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



## xxx: it would be nice to be able to do this: $v->{x} = 20;
## but how is that done (the object is a pointer to a C++ object,
## not a hash). For now, we have this gimpy interface with setX, etc.

Real
Vector2::x()
  CODE:
    RETVAL = (*THIS).x;
  OUTPUT:
    RETVAL

Real
Vector2::y()
  CODE:
    RETVAL = (*THIS).y;
  OUTPUT:
    RETVAL

void
Vector2::setX(x)
    Real  x
  CODE:
    (*THIS).x = x;

void
Vector2::setY(y)
    Real  y
  CODE:
    (*THIS).y = y;
