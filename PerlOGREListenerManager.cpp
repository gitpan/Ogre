#include "PerlOGREListenerManager.h"
#include <string>

using namespace std;


PerlOGREListenerManager::PerlOGREListenerManager()
{
}

PerlOGREListenerManager::~PerlOGREListenerManager()
{
    // delete objects allocated in addFrameListener
    for (FrameListenerMap::iterator it = mListenerMap.begin(); it != mListenerMap.end(); ++it) {
        delete it->second;
    }
    mListenerMap.clear();
}

Ogre::FrameListener * PerlOGREListenerManager::addFrameListener(SV *pobj)
{
    if (sv_isobject(pobj)) {
        PerlOGREFrameListener *fl = new PerlOGREFrameListener(pobj);

        // xxx: I'm not sure if it's necessary/right to do this,
        // but I don't know if pobj is always the same SV * or what,
        // so I index the FrameListeners by their package name.
        HV *stash = SvSTASH(SvRV(pobj));
        string pkgname(HvNAME(stash));   // xxx: does string need copied?

        // won't insert if pkgname already has a listener,
        // is that okay or should it get replaced?
        if (mListenerMap.find(pkgname) != mListenerMap.end()) {
            mListenerMap.insert(FrameListenerMap::value_type(pkgname, static_cast<Ogre::FrameListener *>(fl)));
        }

        return static_cast<Ogre::FrameListener *>(fl);
    } else {
        croak("Argument to addFrameListener has to be an object\n");
    }
}

Ogre::FrameListener * PerlOGREListenerManager::getFrameListener(SV *pobj)
{
    // get package name from object
    HV *stash = SvSTASH(SvRV(pobj));
    string pkgname(HvNAME(stash));   // xxx: does string need copied?

    FrameListenerMap::iterator it = mListenerMap.find(pkgname);
    if (it != mListenerMap.end()) {
        return it->second;
    } else {
        warn("getFrameListener: %s didn't have a FrameListener",
             pkgname.c_str());
        return (Ogre::FrameListener *)NULL;
    }
}

void PerlOGREListenerManager::removeFrameListener(SV *pobj)
{
    // get package name from object
    HV *stash = SvSTASH(SvRV(pobj));
    string pkgname(HvNAME(stash));   // xxx: does string need copied?

    FrameListenerMap::iterator it = mListenerMap.find(pkgname);
    if (it != mListenerMap.end()) {
        delete it->second;
        mListenerMap.erase(it);
    } else {
        warn("removeFrameListener: %s didn't have a FrameListener, so not removed",
             pkgname.c_str());
    }
}
