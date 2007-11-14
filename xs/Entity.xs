MODULE = Ogre     PACKAGE = Ogre::Entity

## const MeshPtr & getMesh (void) const

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

void
Entity::setRenderQueueGroup(uint8 queueID)

## const AxisAlignedBox & 	getBoundingBox (void) const

## AxisAlignedBox 	getChildObjectsBoundingBox (void) const

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



TagPoint *
Entity::attachObjectToBone(boneName, pMovable, offsetOrientation=&Quaternion::IDENTITY, offsetPosition=&Vector3::ZERO)
    String  boneName
    MovableObject * pMovable
    const Quaternion * offsetOrientation
    const Vector3 * offsetPosition
  CODE:
    RETVAL = THIS->attachObjectToBone(boneName, pMovable, *offsetOrientation, *offsetPosition);
  OUTPUT:
    RETVAL

## xxx: also
##void
##Entity::detachObjectFromBone(obj)
##    MovableObject * obj
MovableObject *
Entity::detachObjectFromBone(movableName)
    String  movableName

void
Entity::detachAllObjectsFromBone()

## ChildObjectListIterator Entity::getAttachedObjectIterator()

Real
Entity::getBoundingRadius()

## const AxisAlignedBox & Entity::getWorldBoundingBox(bool derive=false)

## const Sphere & Entity::getWorldBoundingSphere(bool derive=false)

void
Entity::setNormaliseNormals(bool normalise)

bool
Entity::getNormaliseNormals()

EdgeData *
Entity::getEdgeList()

bool
Entity::hasEdgeList()

## ShadowRenderableListIterator Entity::getShadowVolumeRenderableIterator(ShadowTechnique shadowTechnique, const Light *light, HardwareIndexBufferSharedPtr *indexBuffer, bool extrudeVertices, Real extrusionDistance, unsigned long flags=0)

bool
Entity::hasSkeleton()

SkeletonInstance *
Entity::getSkeleton()

bool
Entity::isHardwareAnimationEnabled()

int
Entity::getSoftwareAnimationRequests()

int
Entity::getSoftwareAnimationNormalsRequests()

void
Entity::addSoftwareAnimationRequest(bool normalsAlso)

void
Entity::removeSoftwareAnimationRequest(bool normalsAlso)

void
Entity::shareSkeletonInstanceWith(entity)
    Entity * entity

bool
Entity::hasVertexAnimation()

void
Entity::stopSharingSkeletonInstance()

bool
Entity::sharesSkeletonInstance()

## xxx: std::set<Entity*>
## const EntitySet * Entity::getSkeletonInstanceSharingSet()

void
Entity::refreshAvailableAnimationState()

uint32
Entity::getTypeFlags()

VertexData *
Entity::getVertexDataForBinding()

int
Entity::chooseVertexDataForBinding(bool hasVertexAnim)

bool
Entity::isInitialised()

void
Entity::backgroundLoadingComplete(res)
    Resource * res
