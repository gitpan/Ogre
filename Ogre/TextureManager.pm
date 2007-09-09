package Ogre::TextureManager;

use strict;
use warnings;


1;

__END__
=head1 NAME

Ogre::TextureManager

=head1 SYNOPSIS

  use Ogre;
  use Ogre::TextureManager;
  # (for now see examples/README.txt)

=head1 DESCRIPTION

See the online API documentation at
 L<http://www.ogre3d.org/docs/api/html/classOgre_1_1TextureManager.html>

B<Note:> this Perl binding is currently I<experimental> and subject to API changes.

=head1 CLASS METHODS

=head2 Ogre::TextureManager->getSingletonPtr()

I<Returns>

=over

=item TextureManager *

=back

=head1 INSTANCE METHODS

=head2 $obj->setDefaultNumMipmaps($num)

I<Parameter types>

=over

=item $num : size_t

=back

I<Returns>

=over

=item void

=back

=head1 AUTHOR

Scott Lanning E<lt>slanning@cpan.orgE<gt>

For licensing information, see README.txt .

=cut
