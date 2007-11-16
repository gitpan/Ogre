MODULE = Ogre     PACKAGE = Ogre::Camera

SceneManager *
Camera::getSceneManager()

String
Camera::getName()

void
Camera::setPolygonMode(sd)
    int  sd
  C_ARGS:
    (PolygonMode)sd

int
Camera::getPolygonMode()

void
Camera::setPosition(...)
  CODE:
    if (sv_isobject(ST(1)) && sv_derived_from(ST(1), "Ogre::Vector3")) {
        Vector3 *vec = (Vector3 *) SvIV((SV *) SvRV(ST(1)));   // TMOGRE_IN
        THIS->setPosition(*vec);
    }
    else if (items == 4) {
        THIS->setPosition((Real)SvNV(ST(1)), (Real)SvNV(ST(2)), (Real)SvNV(ST(3)));
    }
    else {
        croak("Usage: Ogre::Camera::setPosition(THIS, vec) or (THIS, x , y, z)\n");
    }

Vector3 *
Camera::getPosition()
  CODE:
    RETVAL = new Vector3;
    *RETVAL = THIS->getPosition();
  OUTPUT:
    RETVAL

void
Camera::move(vec)
    Vector3 * vec
  C_ARGS:
    *vec

void
Camera::moveRelative(vec)
    Vector3 * vec
  C_ARGS:
    *vec

void
Camera::setDirection(...)
  CODE:
    if (sv_isobject(ST(1)) && sv_derived_from(ST(1), "Ogre::Vector3")) {
        Vector3 *vec = (Vector3 *) SvIV((SV *) SvRV(ST(1)));   // TMOGRE_IN
        THIS->lookAt(*vec);
    }
    else if (items == 4) {
        THIS->lookAt((Real)SvNV(ST(1)), (Real)SvNV(ST(2)), (Real)SvNV(ST(3)));
    }
    else {
        croak("Usage: Ogre::Camera::setDirection(THIS, vec) or (THIS, x , y, z)\n");
    }

# Vector3 getDirection()
# Vector3 getUp()
# Vector3 getRight()

void
Camera::lookAt(...)
  CODE:
    if (sv_isobject(ST(1)) && sv_derived_from(ST(1), "Ogre::Vector3")) {
        Vector3 *vec = (Vector3 *) SvIV((SV *) SvRV(ST(1)));   // TMOGRE_IN
        THIS->lookAt(*vec);
    }
    else if (items == 4) {
        THIS->lookAt((Real)SvNV(ST(1)), (Real)SvNV(ST(2)), (Real)SvNV(ST(3)));
    }
    else {
        croak("Usage: Ogre::Camera::lookAt(THIS, vec) or (THIS, x , y, z)\n");
    }

void
Camera::roll(angle)
    DegRad * angle
  C_ARGS:
    *angle

void
Camera::yaw(angle)
    DegRad * angle
  C_ARGS:
    *angle

void
Camera::pitch(angle)
    DegRad * angle
  C_ARGS:
    *angle

## xxx: void 	rotate (const Vector3 &axis, const Radian &angle)
void
Camera::rotate(q)
    Quaternion * q
  C_ARGS:
    *q

void
Camera::setFixedYawAxis(useFixed, fixedAxis)
    bool  useFixed
    Vector3 * fixedAxis
  C_ARGS:
    useFixed, *fixedAxis

# const Quaternion &  Camera::getOrientation()

void
Camera::setOrientation(q)
    Quaternion * q
  C_ARGS:
    *q

## const Quaternion & 	getDerivedOrientation ()
## const Vector3 & 	getDerivedPosition ()
## Vector3 	getDerivedDirection ()
## Vector3 	getDerivedUp ()
## Vector3 	getDerivedRight ()
## const Quaternion & 	getRealOrientation ()
## const Vector3 & 	getRealPosition ()
## Vector3 	getRealDirection ()
## Vector3 	getRealUp ()
## Vector3 	getRealRight ()

String
Camera::getMovableType()

void
Camera::setAutoTracking(enabled, target=0, offset=&Vector3::ZERO)
    bool  enabled
    SceneNode * target
    const Vector3 * offset
  C_ARGS:
    enabled, target, *offset

void
Camera::setLodBias(Real factor=1.0)

Real
Camera::getLodBias()

## xxx:  Ray  Camera::getCameraToViewportRay(Real screenx, Real screeny)

void
Camera::setWindow(Real Left, Real Top, Real Right, Real Bottom)

void
Camera::resetWindow()

bool
Camera::isWindowSet()

## const std::vector< Plane > & Camera::getWindowPlanes()

Real
Camera::getBoundingRadius()

SceneNode *
Camera::getAutoTrackTarget()

## const Vector3 & Camera::getAutoTrackOffset()

Viewport *
Camera::getViewport()

void
Camera::setAutoAspectRatio(bool autoratio)

bool
Camera::getAutoAspectRatio()

void
Camera::setCullingFrustum(frustum)
    Frustum * frustum

Frustum *
Camera::getCullingFrustum()

## void Camera::forwardIntersect(const Plane &worldPlane, std::vector< Vector4 > *intersect3d)

## xxx
##bool
##Camera::isVisible(const AxisAlignedBox &bound, FrustumPlane *culledBy=0)
##bool
##Camera::isVisible(const Sphere &bound, FrustumPlane *culledBy=0)
##bool
##Camera::isVisible(const Vector3 &vert, FrustumPlane *culledBy=0)

## xxx: this is actually a pointer to a list of Vector3
## const Vector3 *  Camera::getWorldSpaceCorners()

## const Plane & Camera::getFrustumPlane(unsigned short plane)

## xxx
##bool
##Camera::projectSphere(const Sphere &sphere, Real *left, Real *top, Real *right, Real *bottom)

Real
Camera::getNearClipDistance()

Real
Camera::getFarClipDistance()

## const Matrix4 & Camera::getViewMatrix()
## const Matrix4 & Camera::getViewMatrix(bool ownFrustumOnly)

void
Camera::setUseRenderingDistance(bool use)

bool
Camera::getUseRenderingDistance()

