MODULE = Ogre     PACKAGE = Ogre::Viewport

void
Viewport::setBackgroundColour(colour)
    ColourValue *colour
  C_ARGS:
    *colour

int
Viewport::getActualWidth()

int
Viewport::getActualHeight()
