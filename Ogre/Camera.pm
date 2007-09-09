package Ogre::Camera;

use strict;
use warnings;

use Ogre::Frustum;
our @ISA = qw(Ogre::Frustum);


1;

__END__
=head1 NAME

Ogre::Camera

=head1 SYNOPSIS

  use Ogre;
  use Ogre::Camera;
  # (for now see examples/README.txt)

=head1 DESCRIPTION

See the online API documentation at
 L<http://www.ogre3d.org/docs/api/html/classOgre_1_1Camera.html>

B<Note:> this Perl binding is currently I<experimental> and subject to API changes.

=head1 INSTANCE METHODS

=head2 $obj->setPosition($x, $y, $z)

I<Parameter types>

=over

=item $x : Real

=item $y : Real

=item $z : Real

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getSceneManager()

I<Returns>

=over

=item SceneManager *

=back

=head2 $obj->getViewport()

I<Returns>

=over

=item Viewport *

=back

=head2 $obj->getParentSceneNode()

I<Returns>

=over

=item SceneNode *

=back

=head2 $obj->getParentNode()

I<Returns>

=over

=item Node *

=back

=head2 $obj->lookAt($x, $y, $z)

I<Parameter types>

=over

=item $x : Real

=item $y : Real

=item $z : Real

=back

I<Returns>

=over

=item void

=back

=head2 $obj->setAspectRatio($ratio)

I<Parameter types>

=over

=item $ratio : Real

=back

I<Returns>

=over

=item void

=back

=head2 $obj->setNearClipDistance($nearDist)

I<Parameter types>

=over

=item $nearDist : Real

=back

I<Returns>

=over

=item void

=back

=head2 $obj->moveRelative($vec)

I<Parameter types>

=over

=item $vec : Vector3 *

=back

I<Returns>

=over

=item void

=back

=head2 $obj->move($vec)

I<Parameter types>

=over

=item $vec : Vector3 *

=back

I<Returns>

=over

=item void

=back

=head2 $obj->roll($angle)

I<Parameter types>

=over

=item $angle : Degree (or Radian) *

=back

I<Returns>

=over

=item void

=back

=head2 $obj->yaw($angle)

I<Parameter types>

=over

=item $angle : Degree (or Radian) *

=back

I<Returns>

=over

=item void

=back

=head2 $obj->pitch($angle)

I<Parameter types>

=over

=item $angle : Degree (or Radian) *

=back

I<Returns>

=over

=item void

=back

=head2 $obj->rotate($q)

I<Parameter types>

=over

=item $q : Quaternion *

=back

I<Returns>

=over

=item void

=back

=head2 $obj->setFixedYawAxis($useFixed, $fixedAxis)

I<Parameter types>

=over

=item $useFixed : bool

=item $fixedAxis : Vector3 *

=back

I<Returns>

=over

=item void

=back

=head2 $obj->setOrientation($q)

I<Parameter types>

=over

=item $q : Quaternion *

=back

I<Returns>

=over

=item void

=back

=head2 $obj->setDirection($x, $y, $z)

I<Parameter types>

=over

=item $x : Real

=item $y : Real

=item $z : Real

=back

I<Returns>

=over

=item void

=back

=head1 AUTHOR

Scott Lanning E<lt>slanning@cpan.orgE<gt>

For licensing information, see README.txt .

=cut
