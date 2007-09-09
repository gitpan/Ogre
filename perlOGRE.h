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
		croak(#package "::" #func "():" #var " is not an Ogre::" #pkg " object\n"); \
	}

// typedef for handling Degree or Radian input parameters
typedef Ogre::Radian DegRad;

#define TMOGRE_DEGRAD_IN(arg, var, package, func) \
	Radian rad_ ## var; \
	if (sv_isobject(arg) && sv_derived_from(arg, "Ogre::Radian")) { \
		var = (Radian *) SvIV((SV *) SvRV(arg)); \
	} \
	else if (sv_isobject(arg) && sv_derived_from(arg, "Ogre::Degree")) { \
		Degree * degptr_ ## var = (Degree *) SvIV((SV *) SvRV(arg)); \
		rad_ ## var = * degptr_ ## var; \
		var = &rad_ ## var; \
	} else { \
		croak(#package "::" #func "():" #var " is not a Degree or Radian object\n"); \
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
