#ifndef _PERLOGRE_H_
#define _PERLOGRE_H_


#include <Ogre.h>


// macros for typemap
// xxx: let me know if you have a better way to do this...
#define TMOGRE_OUT(arg, var, pkg) sv_setref_pv(arg, "Ogre::" #pkg, (void *) var);
#define TMOGRE_IN(arg, var, type, package, func, pkg) \
if (sv_isobject(arg) && sv_derived_from(arg, "Ogre::" #pkg)) { \
		var = (type) SvIV((SV *) SvRV(arg)); \
	} else { \
		warn(#package "::" #func "():" #var " is not an Ogre::" #pkg " object"); \
		XSRETURN_UNDEF; \
	}

// for C++
#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#ifdef __cplusplus
}
#endif


#endif  /* define _PERLOGRE_H_ */
