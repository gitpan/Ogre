MODULE = Ogre     PACKAGE = Ogre::Entity

# there is also an unsigned int version
SubEntity *
Entity::getSubEntity(name)
    String  name

unsigned int
Entity::getNumSubEntities()

Entity *
Entity::clone(name)
    String  name

void
Entity::setMaterialName(name)
    String  name

String
Entity::getMovableType()

AnimationState *
Entity::getAnimationState(name)
    String  name

AnimationStateSet *
Entity::getAllAnimationStates()

void
Entity::setDisplaySkeleton(display)
    bool  display

bool
Entity::getDisplaySkeleton()

Entity *
Entity::getManualLodLevel(index)
    size_t  index

size_t
Entity::getNumManualLodLevels()

void
Entity::setMeshLodBias(factor, maxDetailIndex=0, minDetailIndex=99)
    Real           factor
    unsigned short  maxDetailIndex
    unsigned short  minDetailIndex

void
Entity::setMaterialLodBias(factor, maxDetailIndex=0, minDetailIndex=99)
    Real           factor
    unsigned short  maxDetailIndex
    unsigned short  minDetailIndex

void
Entity::setPolygonModeOverrideable(PolygonModeOverrideable)
    bool  PolygonModeOverrideable

# many methods here....

void
Entity::setCastShadows(enabled)
    bool  enabled

bool
Entity::getCastShadows()


