package Ogre::Quaterion;

use strict;
use warnings;

# xxx: this should be in XS, but I can't get it to work
use overload
  '==' => \&eq_xs,
  '!=' => \&ne_xs,
  ;


1;
