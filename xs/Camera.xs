MODULE = Ogre     PACKAGE = Ogre::Camera

void
Camera::setPosition(x, y, z)
    Real x
    Real y
    Real z

#Vector3 *
#Camera::getPosition()

SceneManager *
Camera::getSceneManager()

Viewport *
Camera::getViewport()

SceneNode *
Camera::getParentSceneNode()

Node *
Camera::getParentNode()

void
Camera::lookAt(x, y, z)
    Real x
    Real y
    Real z

void
Camera::setAspectRatio(ratio)
    Real ratio

void
Camera::setNearClipDistance(nearDist)
    Real nearDist

void
Camera::moveRelative(vec)
    Vector3 * vec
  C_ARGS:
    *vec

void
Camera::move(vec)
    Vector3 * vec
  C_ARGS:
    *vec

void
Camera::roll(angle)
    Degree * angle
  C_ARGS:
    *angle

void
Camera::yaw(angle)
    Degree * angle
  C_ARGS:
    *angle

void
Camera::pitch(angle)
    Degree * angle
  C_ARGS:
    *angle

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

#Quaternion *
#Camera::getOrientation()

void
Camera::setOrientation(q)
    Quaternion * q
  C_ARGS:
    *q

void
Camera::setDirection(x, y, z)
    Real x
    Real y
    Real z

# Vector3 getDirection()
# Vector3 getUp()
# Vector3 getRight()

