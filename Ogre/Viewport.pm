package Ogre::Viewport;

use strict;
use warnings;


1;

__END__
=head1 NAME

Ogre::Viewport

=head1 SYNOPSIS

  use Ogre;
  use Ogre::Viewport;
  # (for now see examples/README.txt)

=head1 DESCRIPTION

See the online API documentation at
 L<http://www.ogre3d.org/docs/api/html/classOgre_1_1Viewport.html>

B<Note:> this Perl binding is currently I<experimental> and subject to API changes.

=head1 INSTANCE METHODS

=head2 $obj->setBackgroundColour($colour)

I<Parameter types>

=over

=item $colour : ColourValue *colour

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getActualWidth()

I<Returns>

=over

=item int

=back

=head2 $obj->getActualHeight()

I<Returns>

=over

=item int

=back

=head1 AUTHOR

Scott Lanning E<lt>slanning@cpan.orgE<gt>

For licensing information, see README.txt .

=cut
