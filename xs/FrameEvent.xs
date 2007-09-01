MODULE = Ogre     PACKAGE = Ogre::FrameEvent

## These are "public attributes", not methods.

float
FrameEvent::timeSinceLastEvent()
  CODE:
    RETVAL = (*THIS).timeSinceLastEvent;
  OUTPUT:
    RETVAL

float
FrameEvent::timeSinceLastFrame()
  CODE:
    RETVAL = (*THIS).timeSinceLastFrame;
  OUTPUT:
    RETVAL
