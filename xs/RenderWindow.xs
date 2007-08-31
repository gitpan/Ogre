MODULE = Ogre     PACKAGE = Ogre::RenderWindow

## Viewport * addViewport(Camera *cam, int ZOrder=0, float left=0.0f, float top=0.0f, float width=1.0f, float height=1.0f)
Viewport *
RenderWindow::addViewport(cam, ZOrder, left, top, width, height)
    Camera * cam
    int ZOrder
    float left
    float top
    float width
    float height



## XXX: not sure if this will work right in all cases,
## the C++ API returns a void* in the 2nd input parameter,
## while here we just return a string. I have no idea what
## all "custom attributes" there are, so I just implemented
## a few types to cover some of the bases (let me know if there
## are particular ones that are missing).
## void getCustomAttribute(const String &name, void *pData)
size_t
RenderWindow::getCustomAttributePtr(name)
    String  name
  PREINIT:
    size_t pData;
  CODE:
    THIS->getCustomAttribute(name, &pData);
    RETVAL = pData;
  OUTPUT:
    RETVAL

int
RenderWindow::getCustomAttributeInt(name)
    String  name
  PREINIT:
    int pData;
  CODE:
    THIS->getCustomAttribute(name, &pData);
    RETVAL = pData;
  OUTPUT:
    RETVAL

float
RenderWindow::getCustomAttributeFloat(name)
    String  name
  PREINIT:
    float pData;
  CODE:
    THIS->getCustomAttribute(name, &pData);
    RETVAL = pData;
  OUTPUT:
    RETVAL

String
RenderWindow::getCustomAttributeStr(name)
    String  name
  PREINIT:
    String pData;
  CODE:
    THIS->getCustomAttribute(name, &pData);
    RETVAL = pData;
  OUTPUT:
    RETVAL

bool
RenderWindow::getCustomAttributeBool(name)
    String  name
  PREINIT:
    bool pData;
  CODE:
    THIS->getCustomAttribute(name, &pData);
    RETVAL = pData;
  OUTPUT:
    RETVAL
