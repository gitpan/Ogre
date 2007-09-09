package Ogre::MeshManager;

use strict;
use warnings;


1;

__END__
=head1 NAME

Ogre::MeshManager

=head1 SYNOPSIS

  use Ogre;
  use Ogre::MeshManager;
  # (for now see examples/README.txt)

=head1 DESCRIPTION

See the online API documentation at
 L<http://www.ogre3d.org/docs/api/html/classOgre_1_1MeshManager.html>

B<Note:> this Perl binding is currently I<experimental> and subject to API changes.

=head1 CLASS METHODS

=head2 Ogre::MeshManager->getSingletonPtr()

I<Returns>

=over

=item MeshManager *

=back

=head1 INSTANCE METHODS

=head2 $obj->createPlane($name, $groupName, $plane, $width, $height, $xsegments, $ysegments, $normals, $numTexCoordSets, $uTile, $vTile, $upVector)

I<Parameter types>

=over

=item $name : String

=item $groupName : String

=item $plane : Plane *

=item $width : Real

=item $height : Real

=item $xsegments : int

=item $ysegments : int

=item $normals : bool

=item $numTexCoordSets : int

=item $uTile : Real

=item $vTile : Real

=item $upVector : Vector3 *

=back

I<Returns>

=over

=item MeshPtr *

=back

=head1 AUTHOR

Scott Lanning E<lt>slanning@cpan.orgE<gt>

For licensing information, see README.txt .

=cut
