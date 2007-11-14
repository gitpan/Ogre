package Ogre::MovableObject;

use strict;
use warnings;

use Ogre::ShadowCaster;
use Ogre::AnimableObject;
our @ISA = qw(Ogre::ShadowCaster Ogre::AnimableObject);



1;

__END__
=head1 NAME

Ogre::MovableObject

=head1 SYNOPSIS

  use Ogre;
  use Ogre::MovableObject;
  # (for now see examples/README.txt)

=head1 DESCRIPTION

See the online API documentation at
 L<http://www.ogre3d.org/docs/api/html/classOgre_1_1MovableObject.html>

B<Note:> this Perl binding is currently I<experimental> and subject to API changes.

=head1 INSTANCE METHODS

=head2 $obj->setVisible($visible)

I<Parameter types>

=over

=item $visible : bool

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getVisible()

I<Returns>

=over

=item bool

=back

=head2 $obj->isVisible()

I<Returns>

=over

=item bool

=back

=head1 AUTHOR

Scott Lanning E<lt>slanning@cpan.orgE<gt>

For licensing information, see README.txt .

=cut
