MODULE = Ogre     PACKAGE = Ogre::Node

## void roll(const Radian &angle, TransformSpace relativeTo=Node::TS_LOCAL)
void
Node::roll(angle, relativeTo=Node::TS_LOCAL)
    DegRad * angle
    int relativeTo
  C_ARGS:
    *angle, (Ogre::Node::TransformSpace)relativeTo

## void pitch(const Radian &angle, TransformSpace relativeTo=Node::TS_LOCAL)
void
Node::pitch(angle, relativeTo=Node::TS_LOCAL)
    DegRad * angle
    int relativeTo
  C_ARGS:
    *angle, (Ogre::Node::TransformSpace)relativeTo

## void yaw(const Radian &angle, TransformSpace relativeTo=Node::TS_LOCAL)
void
Node::yaw(angle, relativeTo=Node::TS_LOCAL)
    DegRad * angle
    int relativeTo
  C_ARGS:
    *angle, (Ogre::Node::TransformSpace)relativeTo

## there are 2 versions of this in the C++ API
void
Node::scale(x, y, z)
    Real x
    Real y
    Real z

## 2 versions
void
Node::rotate(axis, angle, relativeTo=Node::TS_LOCAL)
    Vector3 * axis
    DegRad *  angle
    int       relativeTo
  C_ARGS:
    *axis, *angle, (Ogre::Node::TransformSpace)relativeTo

String
Node::getName()

Node *
Node::getParent()

# Quaternion & getOrientation()
Quaternion *
Node::getOrientation()
  CODE:
    // xxx?
    Quaternion *q = new Quaternion;
    *q = THIS->getOrientation();
    RETVAL = q;
  OUTPUT:
    RETVAL

# xxx: missing the quaternion version
void
Node::setOrientation(w, x, y, z)
    Real  w
    Real  x
    Real  y
    Real  z

void
Node::resetOrientation()

void
Node::setPosition(x, y, z)
    Real  x
    Real  y
    Real  z

Vector3 *
Node::getPosition()
  CODE:
    // xxx?
    Vector3 *vec = new Vector3;
    *vec = THIS->getPosition();
    RETVAL = vec;
  OUTPUT:
    RETVAL

void
Node::setScale(x, y, z)
    Real  x
    Real  y
    Real  z

void
Node::setInheritOrientation(inherit)
    bool  inherit

bool
Node::getInheritOrientation()

void
Node::setInheritScale(inherit)
    bool  inherit

bool
Node::getInheritScale()

## there are 4 versions of this one...
# void translate(const Vector3 &d, TransformSpace relativeTo=TS_PARENT)
# void translate(Real x, Real y, Real z, TransformSpace relativeTo=TS_PARENT)
# void translate(const Matrix3 &axes, const Vector3 &move, TransformSpace relativeTo=TS_PARENT)
# void translate(const Matrix3 &axes, Real x, Real y, Real z, TransformSpace relativeTo=TS_PARENT)
void
Node::translate(x, y, z, relativeTo=Node::TS_PARENT)
    Real  x
    Real  y
    Real  z
    int   relativeTo
  C_ARGS:
    x, y, z, (Ogre::Node::TransformSpace)relativeTo

## (createChild, 2 versions)

void
Node::addChild(child)
    Node * child

unsigned short
Node::numChildren()

# 2 versions..
Node *
Node::getChild(name)
    String  name

# 3 versions..
void
Node::removeChild(name)
    String  name

void
Node::removeAllChildren()

# ...

static void
Node::queueNeedUpdate(n)
    Node * n

static void
Node::processQueuedUpdates()
