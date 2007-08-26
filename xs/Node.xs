MODULE = Ogre     PACKAGE = Ogre::Node

## Note: Radian is interchangeable with Degree

## void roll(const Radian &angle, TransformSpace relativeTo=TS_LOCAL)
void
Node::roll(angle, relativeTo)
    Degree * angle
    int relativeTo
  C_ARGS:
    *angle, (Ogre::Node::TransformSpace)relativeTo

## void pitch(const Radian &angle, TransformSpace relativeTo=TS_LOCAL)
void
Node::pitch(angle, relativeTo)
    Degree * angle
    int relativeTo
  C_ARGS:
    *angle, (Ogre::Node::TransformSpace)relativeTo

## void yaw(const Radian &angle, TransformSpace relativeTo=TS_LOCAL)
void
Node::yaw(angle, relativeTo)
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

