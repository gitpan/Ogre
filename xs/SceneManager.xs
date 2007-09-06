MODULE = Ogre     PACKAGE = Ogre::SceneManager

String
SceneManager::getName()

String
SceneManager::getTypeName()

Camera *
SceneManager::createCamera(name)
    String  name

Camera *
SceneManager::getCamera(name)
    String  name

bool
SceneManager::hasCamera(name)
    String  name

void
SceneManager::destroyCamera(name)
    String  name

void
SceneManager::destroyAllCameras()

Light *
SceneManager::createLight(name)
    String  name

Light *
SceneManager::getLight(name)
    String  name

bool
SceneManager::hasLight(name)
    String  name

void
SceneManager::destroyLight(name)
    String  name

void
SceneManager::destroyAllLights()

SceneNode *
SceneManager::createSceneNode(name)
    String  name

void
SceneManager::destroySceneNode(name)
    String  name

SceneNode *
SceneManager::getRootSceneNode()

SceneNode *
SceneManager::getSceneNode(name)
    String  name

bool
SceneManager::hasSceneNode(name)
    String  name

## there are 2 versions in the C++ API
Entity *
SceneManager::createEntity(entityName, meshName)
    String entityName
    String meshName

Entity *
SceneManager::getEntity(name)
    String  name

bool
SceneManager::hasEntity(name)
    String  name

void
SceneManager::destroyEntity(name)
    String  name

void
SceneManager::destroyAllEntities()

ManualObject *
SceneManager::createManualObject(name)
    String  name

ManualObject *
SceneManager::getManualObject(name)
    String  name

bool
SceneManager::hasManualObject(name)
    String  name

void
SceneManager::destroyManualObject(name)
    String  name

void
SceneManager::destroyAllManualObjects()

BillboardChain *
SceneManager::createBillboardChain(name)
    String  name

BillboardChain *
SceneManager::getBillboardChain(name)
    String  name

bool
SceneManager::hasBillboardChain(name)
    String  name

void
SceneManager::destroyBillboardChain(name)
    String  name

void
SceneManager::destroyAllBillboardChains()

RibbonTrail *
SceneManager::createRibbonTrail(name)
    String  name

RibbonTrail *
SceneManager::getRibbonTrail(name)
    String  name

bool
SceneManager::hasRibbonTrail(name)
    String  name

void
SceneManager::destroyRibbonTrail(name)
    String  name

void
SceneManager::destroyAllRibbonTrails()

## there is another version of this
ParticleSystem *
SceneManager::createParticleSystem(name, templateName)
    String  name
    String  templateName

ParticleSystem *
SceneManager::getParticleSystem(name)
    String  name

bool
SceneManager::hasParticleSystem(name)
    String  name

void
SceneManager::destroyParticleSystem(name)
    String  name

void
SceneManager::destroyAllParticleSystems()

void
SceneManager::clearScene()

void
SceneManager::setAmbientLight(colour)
    ColourValue * colour
  C_ARGS:
    *colour

# const ColourValue & getAmbientLight()

## there are two versions of this
void
SceneManager::setWorldGeometry(filename)
    String  filename

## there are two versions of this
size_t
SceneManager::estimateWorldGeometry(filename)
    String  filename

# and much, much more....

bool
SceneManager::hasOption(strKey)
    String  strKey

# xxx: damn, I really should figure out how to pass String defaults....
# void setSkyPlane(bool enable, const Plane &plane, const String &materialName, Real scale=1000, Real tiling=10, bool drawFirst=true, Real bow=0, int xsegments=1, int ysegments=1, const String &groupName=ResourceGroupManager::DEFAULT_RESOURCE_GROUP_NAME)
void
SceneManager::setSkyPlane(enable, plane, materialName, scale, tiling, drawFirst, bow, xsegments, ysegments, groupName)
    bool    enable
    Plane * plane
    String  materialName
    Real   scale
    Real   tiling
    bool    drawFirst
    Real   bow
    int     xsegments
    int     ysegments
    String  groupName
  C_ARGS:
    enable, *plane, materialName, scale, tiling, drawFirst, bow, xsegments, ysegments, groupName

bool
SceneManager::isSkyPlaneEnabled()

SceneNode *
SceneManager::getSkyPlaneNode()

# virtual void setSkyBox(bool enable, const String &materialName, Real distance=5000, bool drawFirst=true, const Quaternion &orientation=Quaternion::IDENTITY, const String &groupName=ResourceGroupManager::DEFAULT_RESOURCE_GROUP_NAME)
void
SceneManager::setSkyBox(enable, materialName, distance, drawFirst, orientation, groupName)
    bool         enable
    String       materialName
    Real        distance
    bool         drawFirst
    Quaternion * orientation
    String       groupName
  C_ARGS:
    enable, materialName, distance, drawFirst, *orientation, groupName

bool
SceneManager::isSkyBoxEnabled()

SceneNode *
SceneManager::getSkyBoxNode()

# void setSkyDome(bool enable, const String &materialName, Real curvature=10, Real tiling=8, Real distance=4000, bool drawFirst=true, const Quaternion &orientation=Quaternion::IDENTITY, int xsegments=16, int ysegments=16, int ysegments_keep=-1, const String &groupName=ResourceGroupManager::DEFAULT_RESOURCE_GROUP_NAME)
void
SceneManager::setSkyDome(enable, materialName, curvature, tiling, distance, drawFirst, orientation, xsegments, ysegments, ysegments_keep, groupName)
    bool         enable
    String       materialName
    Real        curvature
    Real        tiling
    Real        distance
    bool         drawFirst
    Quaternion * orientation
    int          xsegments
    int          ysegments
    int          ysegments_keep
    String       groupName
  C_ARGS:
    enable, materialName, curvature, tiling, distance, drawFirst, *orientation, xsegments, ysegments, ysegments_keep, groupName

bool
SceneManager::isSkyDomeEnabled()

SceneNode *
SceneManager::getSkyDomeNode()

# xxx: should be mode=FOG_NONE, colour=ColourValue::White too!
void
SceneManager::setFog(mode, colour, expDensity=0.001, linearStart=0.0, linearEnd=1.0)
    int           mode
    ColourValue * colour
    Real         expDensity
    Real         linearStart
    Real         linearEnd
  C_ARGS:
    (FogMode)mode, *colour, expDensity, linearStart, linearEnd

int
SceneManager::getFogMode()

# getFogColour()

Real
SceneManager::getFogStart()

Real
SceneManager::getFogEnd()

Real
SceneManager::getFogDensity()

BillboardSet *
SceneManager::createBillboardSet(name, poolSize=20)
    String  name
    unsigned int  poolSize

BillboardSet *
SceneManager::getBillboardSet(name)
    String        name

bool
SceneManager::hasBillboardSet(name)
    String  name

# also a version where you pass a pointer
void
SceneManager::destroyBillboardSet(name)
    String  name

void
SceneManager::destroyAllBillboardSets()

void
SceneManager::setDisplaySceneNodes(display)
    bool  display

bool
SceneManager::getDisplaySceneNodes()

Animation *
SceneManager::createAnimation(name, length)
    String  name
    Real  length

Animation *
SceneManager::getAnimation(name)
    String        name

bool
SceneManager::hasAnimation(name)
    String  name

void
SceneManager::destroyAnimation(name)
    String  name

void
SceneManager::destroyAllAnimations()

AnimationState *
SceneManager::createAnimationState(name)
    String  name

AnimationState *
SceneManager::getAnimationState(name)
    String  name

bool
SceneManager::hasAnimationState(name)
    String  name

void
SceneManager::destroyAnimationState(name)
    String  name

void
SceneManager::destroyAllAnimationStates()

# bunch of Render stuff...

void
SceneManager::showBoundingBoxes(bShow)
    bool  bShow

bool
SceneManager::getShowBoundingBoxes()

# bunch of Query stuff, other things...

void
SceneManager::setShadowTechnique(technique)
    int  technique
  C_ARGS:
    (ShadowTechnique)technique

int
SceneManager::getShadowTechnique()

void
SceneManager::setShowDebugShadows(debug)
    bool  debug

bool
SceneManager::getShowDebugShadows()

void
SceneManager::setShadowColour(colour)
    ColourValue * colour
  C_ARGS:
    *colour

# getShadowColour....

void
SceneManager::setShadowDirectionalLightExtrusionDistance(dist)
    Real  dist

Real
SceneManager::getShadowDirectionalLightExtrusionDistance()

void 
SceneManager::setShadowFarDistance(distance)
    Real  distance

Real
SceneManager::getShadowFarDistance()

void 
SceneManager::setShadowIndexBufferSize(size)
    size_t  size

size_t 
SceneManager::getShadowIndexBufferSize()

void 
SceneManager::setShadowTextureSize(size)
    unsigned short  size

# other Shadow stuff....

StaticGeometry *
SceneManager::createStaticGeometry(name)
    String  name

StaticGeometry *
SceneManager::getStaticGeometry(name)
    String  name

bool
SceneManager::hasStaticGeometry(name)
    String  name

# plus a ptr version
void
SceneManager::destroyStaticGeometry(name)
    String  name

void
SceneManager::destroyAllStaticGeometry()

InstancedGeometry *
SceneManager::createInstancedGeometry(name)
    String  name

InstancedGeometry *
SceneManager::getInstancedGeometry(name)
    String        name

# they should have this! :)
#bool
#SceneManager::hasInstancedGeometry(name)
#    String  name

# plus a ptr version
void
SceneManager::destroyInstancedGeometry(name)
    String  name

void
SceneManager::destroyAllInstancedGeometry()

# xxx: skipping params arg for now...
# MovableObject *createMovableObject(const String &name, const String &typeName, const NameValuePairList *params=0)
MovableObject *
SceneManager::createMovableObject(name, typeName)
    String  name
    String  typeName

MovableObject *
SceneManager::getMovableObject(name, typeName)
    String  name
    String  typeName

bool
SceneManager::hasMovableObject(name, typeName)
    String  name
    String  typeName

# plus a ptr version
void
SceneManager::destroyMovableObject(name, typeName)
    String  name
    String  typeName

void
SceneManager::destroyAllMovableObjects()

void
SceneManager::destroyAllMovableObjectsByType(typeName)
    String  typeName

void
SceneManager::injectMovableObject(m)
    MovableObject * m

# plus ptr version
void
SceneManager::extractMovableObject(name, typeName)
    String  name
    String  typeName

void
SceneManager::extractAllMovableObjectsByType(typeName)
    String  typeName

void
SceneManager::setVisibilityMask(vmask)
    unsigned int  vmask

unsigned int
SceneManager::getVisibilityMask()

void
SceneManager::setFindVisibleObjects(find)
    bool  find

bool
SceneManager::getFindVisibleObjects()

Viewport *
SceneManager::getCurrentViewport()

# ...

####################################

## SceneType enum
static uint16
SceneManager::ST_GENERIC()
  ALIAS:
    Ogre::SceneManager::ST_EXTERIOR_CLOSE = 1
    Ogre::SceneManager::ST_EXTERIOR_FAR = 2
    Ogre::SceneManager::ST_EXTERIOR_REAL_FAR = 3
    Ogre::SceneManager::ST_INTERIOR = 4
  CODE:
    // for some reason this is in Ogre::, while PrefabType below is in Ogre::SceneManager::
    switch (ix) {
        case 0: RETVAL = Ogre::ST_GENERIC; break;
        case 1: RETVAL = Ogre::ST_EXTERIOR_CLOSE; break;
        case 2: RETVAL = Ogre::ST_EXTERIOR_FAR; break;
        case 3: RETVAL = Ogre::ST_EXTERIOR_REAL_FAR; break;
        case 4: RETVAL = Ogre::ST_INTERIOR; break;
    }
  OUTPUT:
    RETVAL

## PrefabType enum
static int
SceneManager::PT_PLANE()
  ALIAS:
    Ogre::SceneManager::PT_CUBE = 1
    Ogre::SceneManager::PT_SPHERE = 2
  CODE:
    switch (ix) {
        case 0: RETVAL = Ogre::SceneManager::PT_PLANE; break;
        case 1: RETVAL = Ogre::SceneManager::PT_CUBE; break;
        case 2: RETVAL = Ogre::SceneManager::PT_SPHERE; break;
    }
  OUTPUT:
    RETVAL

## ShadowTechnique enum
## (this is not actually in Ogre::SceneManager, though)
static int
SceneManager::SHADOWTYPE_NONE()
  ALIAS:
    Ogre::SceneManager::SHADOWDETAILTYPE_ADDITIVE = 1
    Ogre::SceneManager::SHADOWDETAILTYPE_MODULATIVE = 2
    Ogre::SceneManager::SHADOWDETAILTYPE_INTEGRATED = 3
    Ogre::SceneManager::SHADOWDETAILTYPE_STENCIL = 4
    Ogre::SceneManager::SHADOWDETAILTYPE_TEXTURE = 5
    Ogre::SceneManager::SHADOWTYPE_STENCIL_MODULATIVE = 6
    Ogre::SceneManager::SHADOWTYPE_STENCIL_ADDITIVE = 7
    Ogre::SceneManager::SHADOWTYPE_TEXTURE_MODULATIVE = 8
    Ogre::SceneManager::SHADOWTYPE_TEXTURE_ADDITIVE = 9
    Ogre::SceneManager::SHADOWTYPE_TEXTURE_ADDITIVE_INTEGRATED = 10
    Ogre::SceneManager::SHADOWTYPE_TEXTURE_MODULATIVE_INTEGRATED = 11
  CODE:
    switch (ix) {
      case 0: RETVAL = Ogre::SHADOWDETAILTYPE_ADDITIVE; break;
      case 1: RETVAL = Ogre::SHADOWDETAILTYPE_ADDITIVE; break;
      case 2: RETVAL = Ogre::SHADOWDETAILTYPE_MODULATIVE; break;
      case 3: RETVAL = Ogre::SHADOWDETAILTYPE_INTEGRATED; break;
      case 4: RETVAL = Ogre::SHADOWDETAILTYPE_STENCIL; break;
      case 5: RETVAL = Ogre::SHADOWDETAILTYPE_TEXTURE; break;
      case 6: RETVAL = Ogre::SHADOWTYPE_STENCIL_MODULATIVE; break;
      case 7: RETVAL = Ogre::SHADOWTYPE_STENCIL_ADDITIVE; break;
      case 8: RETVAL = Ogre::SHADOWTYPE_TEXTURE_MODULATIVE; break;
      case 9: RETVAL = Ogre::SHADOWTYPE_TEXTURE_ADDITIVE; break;
      case 10: RETVAL = Ogre::SHADOWTYPE_TEXTURE_ADDITIVE_INTEGRATED; break;
      case 11: RETVAL = Ogre::SHADOWTYPE_TEXTURE_MODULATIVE_INTEGRATED; break;
    }
  OUTPUT:
    RETVAL
