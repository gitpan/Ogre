MODULE = Ogre     PACKAGE = Ogre::Overlay

OverlayContainer *
Overlay::getChild(name)
    String  name

String
Overlay::getName()

void
Overlay::setZOrder(zorder)
    unsigned short  zorder

unsigned short
Overlay::getZOrder()

bool
Overlay::isVisible()

bool
Overlay::isInitialised()

void
Overlay::show()

void
Overlay::hide()

void
Overlay::add2D(cont)
    OverlayContainer * cont

void
Overlay::remove2D(cont)
    OverlayContainer * cont

void
Overlay::add3D(node)
    SceneNode * node

void
Overlay::remove3D(node)
    SceneNode * node

void
Overlay::clear()

void
Overlay::setScroll(x, y)
    float  x
    float  y

float
Overlay::getScrollX()

float
Overlay::getScrollY()

void
Overlay::scroll(xoff, yoff)
    float xoff
    float yoff

void
Overlay::setRotate(angle)
    Degree * angle
  C_ARGS:
    *angle

# Degree &getRotate()

void
Overlay::rotate(angle)
    Degree * angle
  C_ARGS:
    *angle

void
Overlay::setScale(x, y)
    float  x
    float  y

float
Overlay::getScaleX()

float
Overlay::getScaleY()

OverlayElement *
Overlay::findElementAt(x, y)
    float  x
    float  y

String
Overlay::getOrigin()
