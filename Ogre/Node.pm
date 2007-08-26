package Ogre::Node;

use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);

our %EXPORT_TAGS = (
    'transformspace' => [
        qw(
           TS_LOCAL
           TS_PARENT
           TS_WORLD
       )
    ],
);

$EXPORT_TAGS{'all'} = [ map { @{ $EXPORT_TAGS{$_} } } keys %EXPORT_TAGS ];

our @EXPORT_OK = @{ $EXPORT_TAGS{'all'} };
our @EXPORT = ();


1;
