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

__END__
=head1 NAME

Ogre::Light

=head1 SYNOPSIS

  use Ogre;
  use Ogre::Light;
  # (for now see examples/README.txt)

=head1 DESCRIPTION

See the online API documentation at
 L<http://www.ogre3d.org/docs/api/html/classOgre_1_1Light.html>

B<Note:> this Perl binding is currently I<experimental> and subject to API changes.

=head1 CLASS METHODS

=head2 Ogre::Light->LT_POINT()

I<Returns>

=over

=item int

=back

=head1 INSTANCE METHODS

=head2 $obj->setType($type)

I<Parameter types>

=over

=item $type : int

=back

I<Returns>

=over

=item void

=back

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

=head2 $obj->setDiffuseColour($red, $green, $blue)

I<Parameter types>

=over

=item $red : Real

=item $green : Real

=item $blue : Real

=back

I<Returns>

=over

=item void

=back

=head2 $obj->setSpecularColour($red, $green, $blue)

I<Parameter types>

=over

=item $red : Real

=item $green : Real

=item $blue : Real

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

=head2 $obj->setSpotlightRange($innerAngle, $outerAngle, $falloff=1.0)

I<Parameter types>

=over

=item $innerAngle : Degree (or Radian) *

=item $outerAngle : Degree (or Radian) *

=item $falloff=1.0 : Real

=back

I<Returns>

=over

=item void

=back

=head1 AUTHOR

Scott Lanning E<lt>slanning@cpan.orgE<gt>

For licensing information, see README.txt .

=cut
