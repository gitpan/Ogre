#include <Ogre.h>
#include <string>

#include "perlOGRE.h"
#include "PerlOGREListenerManager.h"
#include "PerlOGREFrameListener.h"

using namespace std;
using namespace Ogre;


// This object manages FrameListeners,
// see xs/Root.xs addFrameListener/removeFrameListener
PerlOGREListenerManager pogreListenerManager;


MODULE = Ogre		PACKAGE = Ogre

PROTOTYPES: ENABLE

INCLUDE: perl -e "print qq{INCLUDE: \$_\$/} for <xs/*.xs>" |
