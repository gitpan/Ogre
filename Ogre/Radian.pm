package Ogre::Radian;

use strict;
use warnings;


# xxx: this should be in XS, but I can't get it to work
use overload
  '==' => \&eq_xs,
  '!=' => \&ne_xs,
  '<' => \&lt_xs,
  '>' => \&gt_xs,
  '<=' => \&le_xs,
  '>=' => \&ge_xs,
  ;



1;
