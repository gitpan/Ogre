package Ogre::ResourceGroupManager;

use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);

our %EXPORT_TAGS = (
    'groupnames' => [
        qw(
           DEFAULT_RESOURCE_GROUP_NAME
           INTERNAL_RESOURCE_GROUP_NAME
           BOOTSTRAP_RESOURCE_GROUP_NAME
           AUTODETECT_RESOURCE_GROUP_NAME
       )
    ],
);

$EXPORT_TAGS{'all'} = [ map { @{ $EXPORT_TAGS{$_} } } keys %EXPORT_TAGS ];

our @EXPORT_OK = @{ $EXPORT_TAGS{'all'} };
our @EXPORT = ();


1;
