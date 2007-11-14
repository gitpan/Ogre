MODULE = Ogre     PACKAGE = Ogre::Animation

static void
Animation::setDefaultInterpolationMode(int im)
  C_ARGS:
    (Ogre::Animation::InterpolationMode)im

static int
Animation::getDefaultInterpolationMode()

static void
Animation::setDefaultRotationInterpolationMode(int im)
  C_ARGS:
    (Ogre::Animation::RotationInterpolationMode)im

static int
Animation::getDefaultRotationInterpolationMode()

String
Animation::getName()

Real
Animation::getLength()

NodeAnimationTrack *
Animation::createNodeTrack(handle, ...)
    unsigned short  handle
  PREINIT:
    char *usage = "Usage: Ogre::Animation::createNodeTrack(CLASS, handle [, node])\n";
  CODE:
    if (items == 2) {
        RETVAL = THIS->createNodeTrack(handle);
    }
    else if (items > 2) {
        if (sv_isobject(ST(2)) && sv_derived_from(ST(2), "Ogre::Node")) {
            Node *node = (Node *) SvIV((SV *) SvRV(ST(2)));
            RETVAL = THIS->createNodeTrack(handle, node);
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

NumericAnimationTrack *
Animation::createNumericTrack(handle, ...)
    unsigned short  handle
  PREINIT:
    char *usage = "Usage: Ogre::Animation::createNumericTrack(CLASS, handle [, anim])\n";
  CODE:
    if (items == 2) {
        RETVAL = THIS->createNumericTrack(handle);
    }
    else if (items > 2 && sv_isobject(ST(2)) && sv_derived_from(ST(2), "Ogre::AnimableValue")) {
        AnimableValue *anim = (AnimableValue *) SvIV((SV *) SvRV(ST(2)));
        AnimableValuePtr animptr = AnimableValuePtr(anim);
        RETVAL = THIS->createNumericTrack(handle, animptr);
    }
    else {
        croak(usage);
    }
  OUTPUT:
    RETVAL

VertexAnimationTrack *
Animation::createVertexTrack(handle, ...)
    unsigned short  handle
  PREINIT:
    char *usage = "Usage: Ogre::Animation::createVertexTrack(CLASS, handle, animType) or (CLASS, handle, data, animType)\n";
  CODE:
    if (items == 4 && sv_isobject(ST(2)) && sv_derived_from(ST(2), "Ogre::VertexData") && looks_like_number(ST(3))) {
        VertexData *data = (VertexData *) SvIV((SV *) SvRV(ST(2)));
        VertexAnimationType animType = (VertexAnimationType)SvIV(ST(3));
        RETVAL = THIS->createVertexTrack(handle, data, animType);
    }
    else if (items == 3 && looks_like_number(ST(2))) {
        VertexAnimationType animType = (VertexAnimationType)SvIV(ST(2));
        RETVAL = THIS->createVertexTrack(handle, animType);
    }
    else {
        croak(usage);
    }
  OUTPUT:
    RETVAL

unsigned short
Animation::getNumNodeTracks()

NodeAnimationTrack *
Animation::getNodeTrack(unsigned short handle)

bool
Animation::hasNodeTrack(unsigned short handle)

unsigned short
Animation::getNumNumericTracks()

NumericAnimationTrack *
Animation::getNumericTrack(unsigned short handle)

bool
Animation::hasNumericTrack(unsigned short handle)

unsigned short
Animation::getNumVertexTracks()

VertexAnimationTrack *
Animation::getVertexTrack(unsigned short handle)

bool
Animation::hasVertexTrack(unsigned short handle)

void
Animation::destroyNodeTrack(unsigned short handle)

void
Animation::destroyNumericTrack(unsigned short handle)

void
Animation::destroyVertexTrack(unsigned short handle)

void
Animation::destroyAllTracks()

void
Animation::destroyAllNodeTracks()

void
Animation::destroyAllNumericTracks()

void
Animation::destroyAllVertexTracks()

## xxx:
##void
##Animation::apply(Real timePos, Real weight=1.0, Real scale=1.0f)
##
##void
##Animation::apply(Skeleton *skeleton, Real timePos, Real weight=1.0, Real scale=1.0f)
##
##void
##Animation::apply(Entity *entity, Real timePos, Real weight, bool software, bool hardware)
void
Animation::apply(...)
  PREINIT:
    char *usage = "Usage: Ogre::Animation::apply(CLASS, timePos [, weight, scale]) or (CLASS, skeleton, timePos [, weight, scale]) or (CLASS, entity, timePos, weight, software, hardware)\n";
  CODE:
    // apply(Entity *entity, Real timePos, Real weight, bool software, bool hardware)
    if (items == 6 && sv_isobject(ST(1)) && sv_derived_from(ST(1), "Ogre::Entity")) {
        Entity *entity = (Entity *) SvIV((SV *) SvRV(ST(1)));
        // assuming args after entity are the right type
        THIS->apply(entity, (Real)SvNV(ST(2)), (Real)SvNV(ST(3)), (bool)SvTRUE(ST(4)), (bool)SvTRUE(ST(5)));
    }
    // apply(Skeleton *skeleton, Real timePos, Real weight=1.0, Real scale=1.0f)
    else if (items >= 3 && sv_isobject(ST(1)) && sv_derived_from(ST(1), "Ogre::Skeleton")) {
        Skeleton *skeleton = (Skeleton *) SvIV((SV *) SvRV(ST(1)));
        Real timePos = (Real)SvNV(ST(2));
        Real weight = 1.0f, scale = 1.0f;
        if (items >= 4) weight = (Real)SvNV(ST(3));
        if (items >= 5)  scale = (Real)SvNV(ST(4));
        THIS->apply(skeleton, timePos, weight, scale);
    }
    // apply(Real timePos, Real weight=1.0, Real scale=1.0f)
    else if (items >= 2 && looks_like_number(ST(1))) {
        Real timePos = (Real)SvNV(ST(1));
        Real weight = 1.0f, scale = 1.0f;
        if (items >= 3) weight = (Real)SvNV(ST(2));
        if (items >= 4)  scale = (Real)SvNV(ST(3));
        THIS->apply(timePos, weight, scale);
    }
    else {
        croak(usage);
    }

void
Animation::setInterpolationMode(int im)
  C_ARGS:
    (Ogre::Animation::InterpolationMode)im

int
Animation::getInterpolationMode()

void
Animation::setRotationInterpolationMode(int im)
  C_ARGS:
    (Ogre::Animation::RotationInterpolationMode)im

int
Animation::getRotationInterpolationMode()

## NodeTrackIterator Animation::getNodeTrackIterator()

## NumericTrackIterator Animation::getNumericTrackIterator()

## VertexTrackIterator Animation::getVertexTrackIterator()

void
Animation::optimise(bool discardIdentityNodeTracks=true)

Animation *
Animation::clone(newName)
    String  newName
