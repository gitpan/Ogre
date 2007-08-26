MODULE = Ogre     PACKAGE = Ogre::SceneNode

## SceneNode * createChildSceneNode(const String &name, const Vector3 &translate=Vector3::ZERO, const Quaternion &rotate=Quaternion::IDENTITY)
## there is also an unnamed version in the C++ API,
## and here I did not yet include the optional 2 arguments
SceneNode *
SceneNode::createChildSceneNode(name)
    String name

## void attachObject (MovableObject *obj)
void
SceneNode::attachObject(obj)
    MovableObject * obj
