package Ogre::Plane;

use strict;
use warnings;

sub new {
    my ($pkg, $norm, $dist) = @_;

    if (defined($norm) && defined($dist)) {
        my $cpp_obj = new2($norm, $dist);
        bless $cpp_obj, $pkg;
        return $cpp_obj;
    }
    else {
        my $cpp_obj = new0();
        bless $cpp_obj, $pkg;
        return $cpp_obj;
    }
}


1;
