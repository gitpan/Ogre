MODULE = Ogre     PACKAGE = Ogre::ManualObject

## note: if constructor/destructor ever added, refer to BillboardSet.xs


void
ManualObject::clear()

void
ManualObject::setDynamic(dyn)
    bool  dyn

bool
ManualObject::getDynamic()

void
ManualObject::beginUpdate(sectionIndex)
    size_t  sectionIndex

# ....
