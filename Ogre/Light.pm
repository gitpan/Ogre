package Ogre::Light;

use strict;
use warnings;


require Exporter;
use Ogre::MovableObject;
our @ISA = qw(Ogre::MovableObject Exporter);

our %EXPORT_TAGS = (
    'lighttypes' => [
        qw(
           LT_POINT
           LT_DIRECTIONAL
           LT_SPOTLIGHT
       )
    ],
);

$EXPORT_TAGS{'all'} = [ map { @{ $EXPORT_TAGS{$_} } } keys %EXPORT_TAGS ];

our @EXPORT_OK = @{ $EXPORT_TAGS{'all'} };
our @EXPORT = ();


1;
