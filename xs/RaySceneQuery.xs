MODULE = Ogre     PACKAGE = Ogre::RaySceneQuery

void
RaySceneQuery::setRay(const Ray *ray)
  C_ARGS:
    *ray

Ray *
RaySceneQuery::getRay()
  CODE:
    RETVAL = new Ray();
    *RETVAL = THIS->getRay();
  OUTPUT:
    RETVAL

void
RaySceneQuery::setSortByDistance(bool sort, unsigned short maxresults=0)

bool
RaySceneQuery::getSortByDistance()

unsigned short
RaySceneQuery::getMaxResults()

## xxx: there is a second version
##   void RaySceneQuery::execute(RaySceneQueryListener *listener)
## but Listeners are for later.
## The following implements this:
##   RaySceneQueryResult & RaySceneQuery::execute()
## Note: see ConfigFile::getSections for a similar example.
## The results here are returned in an aref, each of whose
## items is a hashref whose keys are: distance, movable,
## and worldFragment.
##SV *
##RaySceneQuery::execute()
##  CODE:
##    warn("(.)(.)\n");
##    RaySceneQueryResult& qryResult = THIS->execute();
##    warn("(o)(o)\n");
##    RETVAL = perlOGRE_RSQ2aref(qryResult);
##    warn("(*)(*)\n");
##  OUTPUT:
##    RETVAL

SV *
RaySceneQuery::execute()
  CODE:
    RaySceneQueryResult& qres = THIS->execute();
    RETVAL = perlOGRE_RSQ2aref(qres);
  OUTPUT:
    RETVAL

## Note: same deal as above
## RaySceneQueryResult & RaySceneQuery::getLastResults()
SV *
RaySceneQuery::getLastResults()
  CODE:
    RaySceneQueryResult& qres = THIS->getLastResults();
    RETVAL = perlOGRE_RSQ2aref(qres);
  OUTPUT:
    RETVAL

void
RaySceneQuery::clearResults()

## bool RaySceneQuery::queryResult(SceneQuery::WorldFragment *fragment, Real distance)
## bool RaySceneQuery::queryResult(MovableObject *obj, Real distance)
bool
RaySceneQuery::queryResult(...)
  CODE:
    Real distance = (Real)SvNV(ST(2));
    if (sv_isobject(ST(1)) && sv_derived_from(ST(1), "Ogre::SceneQuery::WorldFragment")) {
        SceneQuery::WorldFragment *fragment = (SceneQuery::WorldFragment *) SvIV((SV *) SvRV(ST(1)));   // TMOGRE_IN
        RETVAL = THIS->queryResult(fragment, distance);
    }
    else if (sv_isobject(ST(1)) && sv_derived_from(ST(1), "Ogre::MovableObject")) {
        MovableObject *obj = (MovableObject *) SvIV((SV *) SvRV(ST(1)));   // TMOGRE_IN
        RETVAL = THIS->queryResult(obj, distance);
    }
    else {
        croak("Usage: Ogre::RaySceneQuery::queryResult(THIS, WorldFragment, dist) or (THIS, MovableObject, dist)\n");
    }
  OUTPUT:
    RETVAL
