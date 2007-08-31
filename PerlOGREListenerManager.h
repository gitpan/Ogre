#ifndef _PERLOGRE_LISTENERMANAGER_H_
#define _PERLOGRE_LISTENERMANAGER_H_

/*
  In OGRE, there can be multiple FrameListeners added by Root->addFrameListener,
  and they can be deleted later by passing in the FrameListener
  to Root->removeFrameListener. Since we're implementing FrameListeners
  in Perl, we have to instantiate the C++ object to be passed to
  Root->addFrameListener.

*/

#include <map>
#include "perlOGRE.h"
#include "PerlOGREFrameListener.h"

using namespace std;

class PerlOGREListenerManager
{
 private:
    typedef map<string, Ogre::FrameListener*> FrameListenerMap;
    FrameListenerMap mListenerMap;

 public:
    PerlOGREListenerManager();
    ~PerlOGREListenerManager();

    Ogre::FrameListener * addFrameListener(SV *pobj);
    Ogre::FrameListener * getFrameListener(SV *pobj);
    void removeFrameListener(SV *pobj);
};


#endif  /* define _PERLOGRE_LISTENERMANAGER_H_ */
