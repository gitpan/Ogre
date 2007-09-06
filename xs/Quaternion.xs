MODULE = Ogre     PACKAGE = Ogre::Quaternion

Quaternion *
Quaternion::new(...)
  PREINIT:
    char *usage = "Usage: Ogre::Quaternion::new(CLASS [, Quaternion]) or new(CLASS, Vector3, Real) or...\n";
  CODE:
    // Quaternion (Real fW=1.0, Real fX=0.0, Real fY=0.0, Real fZ=0.0)
    if (items == 1) {
        RETVAL = new Quaternion();
    }
    else if (items == 2) {
        // Quaternion (Real fW=1.0, Real fX=0.0, Real fY=0.0, Real fZ=0.0)
        if (looks_like_number(ST(1))) {
            RETVAL = new Quaternion((Real)SvNV(ST(1)));
        }
        // Quaternion (const Quaternion &rkQ)
        else if (sv_isobject(ST(1)) && sv_derived_from(ST(1), "Ogre::Quaternion")) {
            Quaternion *q = (Quaternion *) SvIV((SV *) SvRV(ST(1)));   // TMOGRE_IN
            RETVAL = new Quaternion(*q);
        }
        // Quaternion (const Matrix3 &rot)
        else if (sv_isobject(ST(1)) && sv_derived_from(ST(1), "Ogre::Matrix3")) {
            Matrix3 *m = (Matrix3 *) SvIV((SV *) SvRV(ST(1)));   // TMOGRE_IN
            RETVAL = new Quaternion(*m);
        }
        else {
            croak(usage);
        }
    }
    else if (items == 3) {
        // Quaternion (Real fW=1.0, Real fX=0.0, Real fY=0.0, Real fZ=0.0)
        if (looks_like_number(ST(1)) && looks_like_number(ST(2))) {
            RETVAL = new Quaternion((Real)SvNV(ST(1)), (Real)SvNV(ST(2)));
        }
        // Quaternion (const Radian &rfAngle, const Vector3 &rkAxis)
        else if (sv_isobject(ST(2)) && sv_derived_from(ST(2), "Ogre::Vector3")) {
            Vector3 *v = (Vector3 *) SvIV((SV *) SvRV(ST(2)));

            // either Degree or Radian works
            if (sv_isobject(ST(1)) && sv_derived_from(ST(1), "Ogre::Radian")) {
                Radian *r = (Radian *) SvIV((SV *) SvRV(ST(1)));   // TMOGRE_IN
                RETVAL = new Quaternion(*r, *v);
            }
            else if (sv_isobject(ST(1)) && sv_derived_from(ST(1), "Ogre::Degree")) {
                Degree *d = (Degree *) SvIV((SV *) SvRV(ST(1)));   // TMOGRE_IN
                RETVAL = new Quaternion(*d, *v);
            }
            else {
                croak(usage);
            }
        }
        else {
            croak(usage);
        }
    }
    else if (items == 4) {
        // Quaternion (Real fW=1.0, Real fX=0.0, Real fY=0.0, Real fZ=0.0)
        if (looks_like_number(ST(1)) && looks_like_number(ST(2)) && looks_like_number(ST(3))) {
            RETVAL = new Quaternion((Real)SvNV(ST(1)), (Real)SvNV(ST(2)), (Real)SvNV(ST(3)));
        }
        // Quaternion (const Vector3 &xaxis, const Vector3 &yaxis, const Vector3 &zaxis)
        else if (sv_isobject(ST(1)) && sv_derived_from(ST(1), "Ogre::Vector3")
                 && sv_isobject(ST(2)) && sv_derived_from(ST(2), "Ogre::Vector3")
                 && sv_isobject(ST(3)) && sv_derived_from(ST(3), "Ogre::Vector3"))
        {
            Vector3 *v1 = (Vector3 *) SvIV((SV *) SvRV(ST(1)));
            Vector3 *v2 = (Vector3 *) SvIV((SV *) SvRV(ST(2)));
            Vector3 *v3 = (Vector3 *) SvIV((SV *) SvRV(ST(3)));
            RETVAL = new Quaternion(*v1, *v2, *v3);
        }
        else {
            croak(usage);
        }
    }
    else if (items == 5) {
        // Quaternion (Real fW=1.0, Real fX=0.0, Real fY=0.0, Real fZ=0.0)
        if (looks_like_number(ST(1)) && looks_like_number(ST(2))
            && looks_like_number(ST(3)) && looks_like_number(ST(4)))
        {
            RETVAL = new Quaternion((Real)SvNV(ST(1)), (Real)SvNV(ST(2)),
                                    (Real)SvNV(ST(3)), (Real)SvNV(ST(4)));
        }
        else {
            croak(usage);
        }
    }
    else {
        croak(usage);
    }
  OUTPUT:
    RETVAL

void
Quaternion::DESTROY()


# ==, !=
bool
eq_xs(lobj, robj, swap)
    Vector3 * lobj
    Vector3 * robj
    IV        swap
  ALIAS:
    ne_xs = 1
  CODE:
    switch(ix) {
        case 0: RETVAL = (*lobj == *robj); break;
        case 1: RETVAL = (*lobj != *robj); break;
    }
  OUTPUT:
    RETVAL


# ....
