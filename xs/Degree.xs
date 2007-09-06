MODULE = Ogre     PACKAGE = Ogre::Degree

Degree *
Degree::new(...)
  PREINIT:
    char *usage = "Usage: Ogre::Degree::new(CLASS [, d]) or new(CLASS, Radian)\n";
  CODE:
    // Degree()
    if (items == 1) {
        RETVAL = new Degree();
    }
    else if (items == 2) {
        // Degree(Real d)
        if (looks_like_number(ST(1))) {
            RETVAL = new Degree((Real)SvNV(ST(1)));
        }
        // Degree(const Radian &d)
        else if (sv_isobject(ST(1)) && sv_derived_from(ST(1), "Ogre::Radian")) {
            Radian *rad = (Radian *) SvIV((SV *) SvRV(ST(1)));   // TMOGRE_IN
            RETVAL = new Degree(*rad);
        }
    }
    else {
        croak(usage);
    }
  OUTPUT:
    RETVAL

void
Degree::DESTROY()


# ==, !=, <, >, <=, >=
bool
eq_xs(lobj, robj, swap)
    Degree * lobj
    Degree * robj
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
Degree::valueDegrees()

Real
Degree::valueRadians()

Real
Degree::valueAngleUnits()
