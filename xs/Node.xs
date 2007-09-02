MODULE = Ogre     PACKAGE = Ogre::Node

## Note: Radian is interchangeable with Degree

## void roll(const Radian &angle, TransformSpace relativeTo=Node::TS_LOCAL)
void
Node::roll(angle, relativeTo=Node::TS_LOCAL)
    Degree * angle
    int relativeTo
  C_ARGS:
    *angle, (Ogre::Node::TransformSpace)relativeTo

## void pitch(const Radian &angle, TransformSpace relativeTo=Node::TS_LOCAL)
void
Node::pitch(angle, relativeTo=Node::TS_LOCAL)
    Degree * angle
    int relativeTo
  C_ARGS:
    *angle, (Ogre::Node::TransformSpace)relativeTo

## void yaw(const Radian &angle, TransformSpace relativeTo=Node::TS_LOCAL)
void
Node::yaw(angle, relativeTo=Node::TS_LOCAL)
    Degree * angle
    int relativeTo
  C_ARGS:
    *angle, (Ogre::Node::TransformSpace)relativeTo

## there are 2 versions of this in the C++ API
void
Node::scale(x, y, z)
    float x
    float y
    float z

## 2 versions
void
Node::rotate(axis, angle, relativeTo=Node::TS_LOCAL)
    Vector3 * axis
    Degree *  angle
    int       relativeTo
  C_ARGS:
    *axis, *angle, (Ogre::Node::TransformSpace)relativeTo

String
Node::getName()

Node *
Node::getParent()

# Quaternion & getOrientation()

void
Node::setOrientation(w, x, y, z)
    float  w
    float  x
    float  y
    float  z

void
Node::resetOrientation()

void
Node::setPosition(x, y, z)
    float  x
    float  y
    float  z

void
Node::setScale(x, y, z)
    float  x
    float  y
    float  z

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
void
Node::translate(x, y, z, relativeTo=Node::TS_PARENT)
    float  x
    float  y
    float  z
    int    relativeTo
  C_ARGS:
    x, y, z, (Ogre::Node::TransformSpace)relativeTo

## (createChild, 2 versions)

void
Node::addChild(child)
    Node * child

unsigned short
Node::numChildren()

# 2 versions..
void
Node::getChild(name)
    String  name

# 3 versions..
void
Node::removeChild(name)
    String  name

void
Node::removeAllChildren()



## TransformSpace enum
static int
Node::TS_LOCAL()
  ALIAS:
    Ogre::Node::TS_PARENT = 1
    Ogre::Node::TS_WORLD = 2
  CODE:
    switch (ix) {
        case 0: RETVAL = Ogre::Node::TS_LOCAL; break;
        case 1: RETVAL = Ogre::Node::TS_PARENT; break;
        case 2: RETVAL = Ogre::Node::TS_WORLD; break;
    }
  OUTPUT:
    RETVAL
