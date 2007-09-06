MODULE = Ogre     PACKAGE = Ogre::MeshManager

static MeshManager *
MeshManager::getSingletonPtr()

## holy fuck:
## MeshPtr createPlane(const String &name, const String &groupName, const Plane &plane, Real width, Real height, int xsegments=1, int ysegments=1, bool normals=true, int numTexCoordSets=1, Real uTile=1.0f, Real vTile=1.0f, const Vector3 &upVector=Vector3::UNIT_Y, HardwareBuffer::Usage vertexBufferUsage=HardwareBuffer::HBU_STATIC_WRITE_ONLY, HardwareBuffer::Usage indexBufferUsage=HardwareBuffer::HBU_STATIC_WRITE_ONLY, bool vertexShadowBuffer=true, bool indexShadowBuffer=true)
## For now, only args through upVector are wrapped (and required...)
MeshPtr *
MeshManager::createPlane(name, groupName, plane, width, height, xsegments, ysegments, normals, numTexCoordSets, uTile, vTile, upVector)
    String    name
    String    groupName
    Plane   * plane
    Real     width
    Real     height
    int       xsegments
    int       ysegments
    bool      normals
    int       numTexCoordSets
    Real     uTile
    Real     vTile
    Vector3 * upVector
  PREINIT:
    MeshPtr  mp;
  CODE:
    // XXX: I doubt this works
    mp = THIS->createPlane(name, groupName, *plane, width, height, xsegments, ysegments, normals, numTexCoordSets, uTile, vTile, *upVector);
    RETVAL = &mp;
  OUTPUT:
    RETVAL
