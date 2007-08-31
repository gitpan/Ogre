#include "PerlOGREFrameListener.h"

// class implementing Ogre::FrameListener interface,
// but using Perl callbacks; pobj is an instance of a Perl class
// that (maybe) has frameStarted and/or frameEnded methods

PerlOGREFrameListener::PerlOGREFrameListener(SV *pobj)
{
    if (sv_isobject(pobj)) {
        mPerlObj = newSVsv(pobj);   // copy the SV*
    } else {
        warn("Argument wasn't an object, so FrameListener wasn't set.\n");
    }

    // these lookups are cached here so they're not done every frame!
    mCanMap["frameStarted"] = perlCallbackCan("frameStarted");
    mCanMap["frameEnded"] = perlCallbackCan("frameEnded");
}

PerlOGREFrameListener::~PerlOGREFrameListener()
{
    if (mPerlObj != (SV *)NULL && SvREFCNT(mPerlObj)) {
        SvREFCNT_dec(mPerlObj);  // delete our copy
    }
}

bool PerlOGREFrameListener::frameStarted(const Ogre::FrameEvent &evt)
{
    return callPerlCallback("frameStarted", evt);
}

bool PerlOGREFrameListener::frameEnded(const Ogre::FrameEvent &evt)
{
    return callPerlCallback("frameEnded", evt);
}

// check whether the Perl object has a callback method implemented
// (is there a perl API method or something easier than this?)
bool PerlOGREFrameListener::perlCallbackCan(string const &cbmeth)
{
    int count;
    SV *methret;
    bool can;

    dSP;

    ENTER;
    SAVETMPS;

    // call `can' to see if they implemented the callback
    PUSHMARK(SP);
    XPUSHs(mPerlObj);
    XPUSHs(sv_2mortal(newSVpv(cbmeth.c_str(), 0)));
    PUTBACK;

    count = call_method("can", G_SCALAR);
    SPAGAIN;
    if (count != 1) {
        croak("can (%s) didn't return a single value?", cbmeth.c_str());
    }

    methret = POPs;
    PUTBACK;

    can = SvTRUE(methret);

    FREETMPS;
    LEAVE;

    return can;
}

bool PerlOGREFrameListener::callPerlCallback(string const &cbmeth, const Ogre::FrameEvent &evt)
{
    int count;
    SV *methret;
    bool retval = true;

    if (! (mCanMap[cbmeth] == true)) {
        // method not implemented, just return true
        return retval;
    }

    dSP;

    ENTER;
    SAVETMPS;

    // put the C++ object (evt) into a Perl object (frameevt)
    SV *frameevt = sv_newmortal();
    TMOGRE_OUT(frameevt, &evt, FrameEvent);

    // call the callback
    PUSHMARK(SP);
    XPUSHs(mPerlObj);
    XPUSHs(frameevt);
    PUTBACK;

    count = call_method(cbmeth.c_str(), G_SCALAR);
    SPAGAIN;
    if (count != 1) {
        croak("Callbacks must return a single (boolean) value");
    }

    methret = POPs;
    PUTBACK;

    retval = SvTRUE(methret) ? true : false;

    FREETMPS;
    LEAVE;

    return retval;
}
