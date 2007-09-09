package Ogre::ParticleSystem;

use strict;
use warnings;

use Ogre::StringInterface;
use Ogre::MovableObject;
our @ISA = qw(Ogre::StringInterface Ogre::MovableObject);


1;

__END__
=head1 NAME

Ogre::ParticleSystem

=head1 SYNOPSIS

  use Ogre;
  use Ogre::ParticleSystem;
  # (for now see examples/README.txt)

=head1 DESCRIPTION

See the online API documentation at
 L<http://www.ogre3d.org/docs/api/html/classOgre_1_1ParticleSystem.html>

B<Note:> this Perl binding is currently I<experimental> and subject to API changes.

=head1 AUTHOR

Scott Lanning E<lt>slanning@cpan.orgE<gt>

For licensing information, see README.txt .

=cut
