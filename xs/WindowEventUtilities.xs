MODULE = Ogre     PACKAGE = Ogre::WindowEventUtilities

static void
WindowEventUtilities::messagePump()

static void
WindowEventUtilities::addWindowEventListener(win, perlListener)
    RenderWindow * win
    SV * perlListener
  CODE:
    pogreListenerManager.addWindowEventListener(perlListener, win);

static void
WindowEventUtilities::removeWindowEventListener(win, perlListener)
    RenderWindow * win
    SV * perlListener
  CODE:
    pogreListenerManager.removeWindowEventListener(perlListener, win);
