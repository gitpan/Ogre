MODULE = Ogre     PACKAGE = Ogre::OverlayElement

void
OverlayElement::initialise()

void
OverlayElement::show()

void
OverlayElement::hide()

String
OverlayElement::getName()

bool
OverlayElement::isVisible()

bool
OverlayElement::isEnabled()

void
OverlayElement::setEnabled(b)
    bool  b

void
OverlayElement::setDimensions(width, height)
    Real  width
    Real  height

void
OverlayElement::setPosition(left, top)
    Real  left
    Real  top

void
OverlayElement::setWidth(width)
    Real  width

void
OverlayElement::setHeight(height)
    Real  height

void
OverlayElement::setLeft(left)
    Real  left

void
OverlayElement::setTop(top)
    Real  top

Real
OverlayElement::getWidth()

Real
OverlayElement::getHeight()

Real
OverlayElement::getLeft()

Real
OverlayElement::getTop()

String
OverlayElement::getMaterialName()

void
OverlayElement::setMaterialName(matName)
    String  matName

String
OverlayElement::getTypeName()

## XXX: Caption methods actually take DisplayString,
## which typedefs to either String or UTFString (utf-16),
## but the code I see in the examples just uses String,
## and UTFString converts back and forth with String automatically,
## and it is easier so thats what I used.
String
OverlayElement::getCaption()

void
OverlayElement::setCaption(text)
    String  text

void
OverlayElement::setColour(col)
    ColourValue * col
  C_ARGS:
    *col

## getColour

bool
OverlayElement::contains(x, y)
    Real  x
    Real  y

OverlayElement *
OverlayElement::findElementAt(x, y)
    Real  x
    Real  y

bool
OverlayElement::isContainer()

bool
OverlayElement::isKeyEnabled()

bool
OverlayElement::isCloneable()

OverlayContainer *
OverlayElement::getParent()

unsigned short
OverlayElement::getZOrder()

Real
OverlayElement::getSquaredViewDepth(cam)
    Camera * cam

void
OverlayElement::copyFromTemplate(templateOverlay)
    OverlayElement * templateOverlay

OverlayElement *
OverlayElement::clone(instanceName)
    String  instanceName

const OverlayElement *
OverlayElement::getSourceTemplate()


## ....
