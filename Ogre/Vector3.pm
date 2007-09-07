package Ogre::Vector3;

use strict;
use warnings;

# xxx: this should be in XS, but I can't get it to work
use overload
  '==' => \&eq_xs,
  '!=' => \&ne_xs,
  '<' => \&lt_xs,
  '>' => \&gt_xs,
  '+' => \&plus_xs,
  '-' => \&minus_xs,
  '*' => \&mult_xs,
  '/' => \&div_xs,
  ;



require Exporter;
our @ISA = qw(Exporter);

our %EXPORT_TAGS = (

# XXX: sorry, these are unsupported until I can figure out
# how to make them work; just create the vector manually
# (ZERO ==> Ogre::Vector3->new(0, 0, 0))
#     'vectors' => [
#         qw(
#            ZERO
#            UNIT_X
#            UNIT_Y
#            UNIT_Z
#            NEGATIVE_UNIT_X
#            NEGATIVE_UNIT_Y
#            NEGATIVE_UNIT_Z
#            UNIT_SCALE
#        )
#     ],
);

$EXPORT_TAGS{'all'} = [ map { @{ $EXPORT_TAGS{$_} } } keys %EXPORT_TAGS ];

our @EXPORT_OK = @{ $EXPORT_TAGS{'all'} };
our @EXPORT = ();



1;