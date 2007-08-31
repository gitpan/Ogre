#ifndef _PERLOGRE_FRAMELISTENER_H_
#define _PERLOGRE_FRAMELISTENER_H_

#include "perlOGRE.h"
#include <map>
#include <string>

using namespace std;

// XXX: This should be a template class..

// this class implements Ogre::FrameListener,
// so it can be passed to Root->addFrameListener
// but still allowing implementing the callbacks from Perl

class PerlOGREFrameListener : public Ogre::FrameListener
{
 public:
    PerlOGREFrameListener(SV *pobj);
    ~PerlOGREFrameListener();

    // FrameListener interface
    bool frameStarted(const Ogre::FrameEvent &evt);
    bool frameEnded(const Ogre::FrameEvent &evt);

 private:
    bool perlCallbackCan(string const &cbmeth);
    bool callPerlCallback(string const &cbmeth, const Ogre::FrameEvent &evt);

    SV * mPerlObj;

    typedef map<string, bool> CanMap;
    CanMap mCanMap;
};


#endif  /* define _PERLOGRE_FRAMELISTENER_H_ */
