#include <Ogre.h>
#include <string>

#include "perlOGRE.h"
#include "PerlOGREListenerManager.h"
#include "PerlOGREFrameListener.h"
#include "PerlOGREWindowEventListener.h"

using namespace std;
using namespace Ogre;


// This object manages FrameListeners,
// see xs/Root.xs addFrameListener/removeFrameListener
PerlOGREListenerManager pogreListenerManager;


MODULE = Ogre		PACKAGE = Ogre

PROTOTYPES: ENABLE


## TextureFilterOptions enum
static int
Ogre::TFO_NONE()
  ALIAS:
    Ogre::TFO_BILINEAR = 1
    Ogre::TFO_TRILINEAR = 2
    Ogre::TFO_ANISOTROPIC = 3
  CODE:
    switch (ix) {
        case 0: RETVAL = Ogre::TFO_NONE; break;
        case 1: RETVAL = Ogre::TFO_BILINEAR; break;
        case 2: RETVAL = Ogre::TFO_TRILINEAR; break;
        case 3: RETVAL = Ogre::TFO_ANISOTROPIC; break;
    }
  OUTPUT:
    RETVAL

## PolygonMode enum
static int
Ogre::PM_POINTS()
  ALIAS:
    Ogre::PM_WIREFRAME = 1
    Ogre::PM_SOLID = 2
  CODE:
    switch (ix) {
        case 0: RETVAL = Ogre::PM_POINTS; break;
        case 1: RETVAL = Ogre::PM_WIREFRAME; break;
        case 2: RETVAL = Ogre::PM_SOLID; break;
    }
  OUTPUT:
    RETVAL

## FogMode enum
static int
Ogre::FOG_NONE()
  ALIAS:
    Ogre::FOG_EXP = 1
    Ogre::FOG_EXP2 = 2
    Ogre::FOG_LINEAR = 3
  CODE:
    switch (ix) {
        case 0: RETVAL = Ogre::FOG_NONE; break;
        case 1: RETVAL = Ogre::FOG_EXP; break;
        case 2: RETVAL = Ogre::FOG_EXP2; break;
        case 3: RETVAL = Ogre::FOG_LINEAR; break;
    }
  OUTPUT:
    RETVAL


INCLUDE: perl -e "print qq{INCLUDE: \$_\$/} for <xs/*.xs>" |
