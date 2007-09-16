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

__END__
=head1 NAME

Ogre::Radian

=head1 SYNOPSIS

  use Ogre;
  use Ogre::Radian;
  # (for now see examples/README.txt)

=head1 DESCRIPTION

See the online API documentation at
 L<http://www.ogre3d.org/docs/api/html/classOgre_1_1Radian.html>

B<Note:> this Perl binding is currently I<experimental> and subject to API changes.

=head1 CLASS METHODS

=head2 Ogre::Radian->new(...)

I<Parameter types>

=over

=item ... : this varies... (sorry, look in the .xs file)

=back

I<Returns>

=over

=item Radian *

=back

=head2 Ogre::Radian->DESTROY()

This method is called automatically; don't call it yourself.

=head2 \&eq_xs

This is an operator overload method; don't call it yourself.

=head1 INSTANCE METHODS

=head2 $obj->valueDegrees()

I<Returns>

=over

=item Real

=back

=head2 $obj->valueRadians()

I<Returns>

=over

=item Real

=back

=head2 $obj->valueAngleUnits()

I<Returns>

=over

=item Real

=back

=head1 AUTHOR

Scott Lanning E<lt>slanning@cpan.orgE<gt>

For licensing information, see README.txt .

=cut
