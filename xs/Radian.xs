MODULE = Ogre     PACKAGE = Ogre::Radian

Radian *
Radian::new(...)
  PREINIT:
    char *usage = "Usage: Ogre::Radian::new(CLASS [, d]) or new(CLASS, Degree)\n";
  CODE:
    // Radian()
    if (items == 1) {
        RETVAL = new Radian();
    }
    else if (items == 2) {
        // Radian(Real r)
        if (looks_like_number(ST(1))) {
            RETVAL = new Radian((Real)SvNV(ST(1)));
        }
        // Radian(const Degree &d)
        else if (sv_isobject(ST(1)) && sv_derived_from(ST(1), "Ogre::Degree")) {
            Degree *deg = (Degree *) SvIV((SV *) SvRV(ST(1)));   // TMOGRE_IN
            RETVAL = new Radian(*deg);
        }
    }
    else {
        croak(usage);
    }
  OUTPUT:
    RETVAL

void
Radian::DESTROY()


# ==, !=, <, >, <=, >=
bool
eq_xs(lobj, robj, swap)
    Radian * lobj
    Radian * robj
    IV        swap
  ALIAS:
    ne_xs = 1
    lt_xs = 2
    gt_xs = 3
    le_xs = 4
    ge_xs = 5
  CODE:
    switch(ix) {
        case 0: RETVAL = (*lobj == *robj); break;
        case 1: RETVAL = (*lobj != *robj); break;
        case 2: RETVAL = (*lobj < *robj); break;
        case 3: RETVAL = (*lobj > *robj); break;
        case 4: RETVAL = (*lobj <= *robj); break;
        case 5: RETVAL = (*lobj >= *robj); break;
    }
  OUTPUT:
    RETVAL



Real
Radian::valueDegrees()

Real
Radian::valueRadians()

Real
Radian::valueAngleUnits()
