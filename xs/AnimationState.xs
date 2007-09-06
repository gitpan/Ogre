MODULE = Ogre     PACKAGE = Ogre::AnimationState

# this is all wrapped
# except the overridden == and != operators

String
AnimationState::getAnimationName()

Real
AnimationState::getTimePosition()

void
AnimationState::setTimePosition(timePos)
    Real  timePos

Real
AnimationState::getLength()

void
AnimationState::setLength(len)
    Real  len

Real
AnimationState::getWeight()

void
AnimationState::setWeight(weight)
    Real  weight

void
AnimationState::addTime(offset)
    Real  offset

bool
AnimationState::hasEnded()

bool
AnimationState::getEnabled()

void
AnimationState::setEnabled(enabled)
    bool  enabled

bool
AnimationState::getLoop()

void
AnimationState::setLoop(loop)
    bool  loop

void
AnimationState::copyStateFrom(animState)
    AnimationState * animState
  C_ARGS:
    *animState

AnimationStateSet *
AnimationState::getParent()
