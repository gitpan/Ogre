MODULE = Ogre     PACKAGE = Ogre::RenderWindow

## C++ version uses output parameters (pointers),
## this Perl version will return a list instead:
## ($w, $h, $d, $l, $t) = $win->getMetrics();
## (wow, that was painful to get working :)
## (note: there is a different version in RenderTarget)
void
RenderWindow::getMetrics(OUTLIST unsigned int width, OUTLIST unsigned int height, OUTLIST unsigned int colourDepth, OUTLIST int left, OUTLIST int top)
  C_ARGS:
    width, height, colourDepth, left, top

bool
RenderWindow::isVisible()

void
RenderWindow::setVisible(visible)
    bool  visible

bool
RenderWindow::isActive()

bool
RenderWindow::isClosed()

bool
RenderWindow::isFullScreen()

void
RenderWindow::destroy()

void
RenderWindow::resize(width, height)
    unsigned int  width
    unsigned int  height



