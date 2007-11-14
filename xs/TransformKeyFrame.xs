MODULE = Ogre     PACKAGE = Ogre::TransformKeyFrame

void
TransformKeyFrame::setTranslate(trans)
    const Vector3 * trans
  C_ARGS:
    *trans

## const Vector3 & TransformKeyFrame::getTranslate()

void
TransformKeyFrame::setScale(scale)
    const Vector3 * scale
  C_ARGS:
    *scale

## const Vector3 & TransformKeyFrame::getScale()

void
TransformKeyFrame::setRotation(rot)
    const Quaternion * rot
  C_ARGS:
    *rot

## const Quaternion & TransformKeyFrame::getRotation()

