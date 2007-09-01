MODULE = Ogre     PACKAGE = Ogre::OverlayContainer

bool
OverlayContainer::isContainer()

void
OverlayContainer::addChild(elem)
    OverlayElement * elem

## xxx: C++ has another version where you can pass an OverlayElement*
## but why not use addChild? Also, what is "Impl"?
void
OverlayContainer::addChildImpl(cont)
    OverlayContainer * cont

void
OverlayContainer::removeChild(name)
     String  name

OverlayElement *
OverlayContainer::getChild(name)
     String  name

bool
OverlayContainer::isChildrenProcessEvents()

void
OverlayContainer::setChildrenProcessEvents(val)
    bool  val
