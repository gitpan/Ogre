package Ogre::SceneManager;

use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);

our %EXPORT_TAGS = (
    'scenetype' => [
        qw(
           ST_GENERIC
           ST_EXTERIOR_CLOSE
           ST_EXTERIOR_FAR
           ST_EXTERIOR_REAL_FAR
           ST_INTERIOR
       )
    ],
    'prefabtype' => [
        qw(
           PT_PLANE
           PT_CUBE
           PT_SPHERE
       )
    ],
);

$EXPORT_TAGS{'all'} = [ map { @{ $EXPORT_TAGS{$_} } } keys %EXPORT_TAGS ];

our @EXPORT_OK = @{ $EXPORT_TAGS{'all'} };
our @EXPORT = ();


1;
