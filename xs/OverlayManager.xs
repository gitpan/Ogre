MODULE = Ogre     PACKAGE = Ogre::OverlayManager

static OverlayManager *
OverlayManager::getSingletonPtr()

Overlay *
OverlayManager::create(name)
    String  name

Overlay *
OverlayManager::getByName(name)
    String  name

# there is another version passing the Overlay*
void
OverlayManager::destroy(name)
    String  name

void
OverlayManager::destroyAll()

bool
OverlayManager::hasViewportChanged()

int
OverlayManager::getViewportHeight()

int
OverlayManager::getViewportWidth()

float
OverlayManager::getViewportAspectRatio()

OverlayElement *
OverlayManager::createOverlayElement(typeName, instanceName, isTemplate=false)
    String  typeName
    String  instanceName
    bool    isTemplate

OverlayElement *
OverlayManager::getOverlayElement(name, isTemplate=false)
    String  name
    bool    isTemplate

# there is another version passing OverlayElement*
void
OverlayManager::destroyOverlayElement(instanceName, isTemplate=false)
    String  instanceName
    bool    isTemplate

void
OverlayManager::destroyAllOverlayElements(isTemplate=false)
    bool  isTemplate

# ....

bool
OverlayManager::isTemplate(strName)
    String strName
