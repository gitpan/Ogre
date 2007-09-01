#ifndef _PERLOGRE_LISTENER_H_
#define _PERLOGRE_LISTENER_H_

#include "perlOGRE.h"
#include <map>
#include <string>
#include <vector>

using namespace std;

// this is a baseclass for the other listeners

class PerlOGREListener
{
 public:
    PerlOGREListener(SV *pobj);
    ~PerlOGREListener();

 protected:
    bool perlCallbackCan(string const &cbmeth);
    bool callPerlCallback(string const &cbmeth);

    SV * mPerlObj;

    typedef vector<SV *> CBArgList;
    CBArgList mCallbackArgs;

    typedef map<string, bool> CBCanMap;
    CBCanMap mCanMap;
};


#endif  /* define _PERLOGRE_LISTENER_H_ */
