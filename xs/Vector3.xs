MODULE = Ogre     PACKAGE = Ogre::Vector3

Vector3 *
Vector3::new(fX, fY, fZ)
    float  fX
    float  fY
    float  fZ

void
Vector3::DESTROY()



## XXX: I tried hard to make this work,
## but how do you make Perl not try to delete these pointers?
## special vectors
#static Vector3 *
#Vector3::ZERO()
#  ALIAS:
#    Ogre::Vector3::UNIT_X = 1
#    Ogre::Vector3::UNIT_Y = 2
#    Ogre::Vector3::UNIT_Z = 3
#    Ogre::Vector3::NEGATIVE_UNIT_X = 4
#    Ogre::Vector3::NEGATIVE_UNIT_Y = 5
#    Ogre::Vector3::NEGATIVE_UNIT_Z = 6
#    Ogre::Vector3::UNIT_SCALE = 7
#  PREINIT:
#    Vector3 vp;
#  CODE:
#    switch (ix) {
#        case 0: vp.x = Vector3::ZERO.x; vp.x = Vector3::ZERO.z; vp.z = Vector3::ZERO.z; break;
#        case 1: vp.x = Vector3::UNIT_X.x; vp.y = Vector3::UNIT_X.y; vp.z = Vector3::UNIT_X.z; break;
#        case 2: vp.x = Vector3::UNIT_Y.x; vp.y = Vector3::UNIT_Y.y; vp.z = Vector3::UNIT_Y.z; break;
#        case 3: vp.x = Vector3::UNIT_Z.x; vp.y = Vector3::UNIT_Z.y; vp.z = Vector3::UNIT_Z.z; break;
#        case 4: vp.x = Vector3::NEGATIVE_UNIT_X.x; vp.y = Vector3::NEGATIVE_UNIT_X.y; vp.z = Vector3::NEGATIVE_UNIT_X.z; break;
#        case 5: vp.x = Vector3::NEGATIVE_UNIT_Y.x; vp.y = Vector3::NEGATIVE_UNIT_Y.y; vp.z = Vector3::NEGATIVE_UNIT_Y.z; break;
#        case 6: vp.x = Vector3::NEGATIVE_UNIT_Z.x; vp.y = Vector3::NEGATIVE_UNIT_Z.y; vp.z = Vector3::NEGATIVE_UNIT_Z.z; break;
#        case 7: vp.x = Vector3::UNIT_SCALE.x; vp.y = Vector3::UNIT_SCALE.y; vp.z = Vector3::UNIT_SCALE.z; break;
#    }
#    RETVAL = &vp;
#  OUTPUT:
#    RETVAL
