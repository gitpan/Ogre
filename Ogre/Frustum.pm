package Ogre::Frustum;

use strict;
use warnings;

use Ogre::MovableObject;
use Ogre::Renderable;
our @ISA = qw(Ogre::MovableObject Ogre::Renderable);



1;

__END__
=head1 NAME

Ogre::Frustum

=head1 SYNOPSIS

  use Ogre;
  use Ogre::Frustum;
  # (for now see examples/README.txt)

=head1 DESCRIPTION

See the online API documentation at
 L<http://www.ogre3d.org/docs/api/html/classOgre_1_1Frustum.html>

B<Note:> this Perl binding is currently I<experimental> and subject to API changes.

=head1 AUTHOR

Scott Lanning E<lt>slanning@cpan.orgE<gt>

For licensing information, see README.txt .

=cut
