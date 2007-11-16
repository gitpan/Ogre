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

#### xxx: void RaySceneQuery::execute(RaySceneQueryListener *listener)
#### RaySceneQueryResult & RaySceneQuery::execute()
#### note: see ConfigFile::getSections
##SV *
##RaySceneQuery::execute()
##  CODE:
##    AV *result = (AV *) sv_2mortal((SV *) newAV());
##
##    RaySceneQueryResult& qryResult = THIS->execute();
##    RaySceneQueryResult::iterator it = qryResult.begin();
##    while (it.hasMoreElements()) {
##        RaySceneQueryResultEntry entry = it.getNext();
##
##        // go from C++ to Perl SV*
##        SV *svdistance = sv_newmortal(),
##           *svmovable = sv_newmortal(),
##           *svworldFragment = sv_newmortal();
##        if (svdistance)
##            sv_setnv(svdistance, (Real)entry->distance);
##        else
##            svdistance = &PL_sv_undef;
##        if (svmovable)
##            TMOGRE_OUT(svmovable, entry->movable, MovableObject);
##        else
##            svmovable = &PL_sv_undef;
##
##        xxx: SceneQuery::WorldFragment is a struct
##
##        if (svworldFragment)
##            TMOGRE_OUT(svworldFragment, entry->worldFragment, SceneQuery::WorldFragment);
##        else
##            svworldFragment = &PL_sv_undef;
##
##        // put the SV* into a hash
##        HV *hventry = (HV *) sv_2mortal((SV *) newHV());
##        hv_store(hventry, "distance", 8, svdistance, 0);
##        hv_store(hventry, "movable", 7, svmovable, 0);
##        hv_store(hventry, "worldFragment", 13, svworldFragment, 0);
##
##        // push the hash onto the array
##        av_push(result, newRV((SV *) hventry));
##    }
##
##    // return the array ref
##    RETVAL = newRV((SV *) result);
##  OUTPUT:
##    RETVAL

##RaySceneQueryResult &
##RaySceneQuery::getLastResults()

void
RaySceneQuery::clearResults()

## xxx: bool RaySceneQuery::queryResult(SceneQuery::WorldFragment *fragment, Real distance)
bool
RaySceneQuery::queryResult(MovableObject *obj, Real distance)
