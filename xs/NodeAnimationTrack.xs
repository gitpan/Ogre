MODULE = Ogre     PACKAGE = Ogre::NodeAnimationTrack

TransformKeyFrame *
NodeAnimationTrack::createNodeKeyFrame(Real timePos)

Node *
NodeAnimationTrack::getAssociatedNode()

void
NodeAnimationTrack::setAssociatedNode(node)
    Node * node

void
NodeAnimationTrack::applyToNode(node, timeIndex, weight=1.0, scale=1.0f)
    Node * node
    const TimeIndex * timeIndex
    Real weight
    Real scale
  C_ARGS:
    node, *timeIndex, weight, scale

void
NodeAnimationTrack::setUseShortestRotationPath(bool useShortestPath)

bool
NodeAnimationTrack::getUseShortestRotationPath()

# note: C++ API passes in pointer with void return
KeyFrame *
NodeAnimationTrack::getInterpolatedKeyFrame(timeIndex)
    const TimeIndex * timeIndex
  PREINIT:
    KeyFrame * kf;
  CODE:
    THIS->getInterpolatedKeyFrame(*timeIndex, kf);
    RETVAL = kf;
  OUTPUT:
    RETVAL

void
NodeAnimationTrack::apply(timeIndex, weight=1.0, scale=1.0f)
    const TimeIndex * timeIndex
    Real  weight
    Real  scale
  C_ARGS:
    *timeIndex, weight, scale

TransformKeyFrame *
NodeAnimationTrack::getNodeKeyFrame(unsigned short index)

bool
NodeAnimationTrack::hasNonZeroKeyFrames()

void
NodeAnimationTrack::optimise()
