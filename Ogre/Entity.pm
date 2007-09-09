package Ogre::Entity;

use strict;
use warnings;

use Ogre::MovableObject;
our @ISA = qw(Ogre::MovableObject);   # Ogre::Resource::Listener


1;

__END__
=head1 NAME

Ogre::Entity

=head1 SYNOPSIS

  use Ogre;
  use Ogre::Entity;
  # (for now see examples/README.txt)

=head1 DESCRIPTION

See the online API documentation at
 L<http://www.ogre3d.org/docs/api/html/classOgre_1_1Entity.html>

B<Note:> this Perl binding is currently I<experimental> and subject to API changes.

=head1 INSTANCE METHODS

=head2 $obj->getSubEntity($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item SubEntity *

=back

=head2 $obj->getNumSubEntities()

I<Returns>

=over

=item unsigned int

=back

=head2 $obj->clone($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item Entity *

=back

=head2 $obj->setMaterialName($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getMovableType()

I<Returns>

=over

=item String

=back

=head2 $obj->getAnimationState($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item AnimationState *

=back

=head2 $obj->getAllAnimationStates()

I<Returns>

=over

=item AnimationStateSet *

=back

=head2 $obj->setDisplaySkeleton($display)

I<Parameter types>

=over

=item $display : bool

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getDisplaySkeleton()

I<Returns>

=over

=item bool

=back

=head2 $obj->getManualLodLevel($index)

I<Parameter types>

=over

=item $index : size_t

=back

I<Returns>

=over

=item Entity *

=back

=head2 $obj->getNumManualLodLevels()

I<Returns>

=over

=item size_t

=back

=head2 $obj->setMeshLodBias($factor, $maxDetailIndex=0, $minDetailIndex=99)

I<Parameter types>

=over

=item $factor : Real

=item $maxDetailIndex=0 : unsigned short

=item $minDetailIndex=99 : unsigned short

=back

I<Returns>

=over

=item void

=back

=head2 $obj->setMaterialLodBias($factor, $maxDetailIndex=0, $minDetailIndex=99)

I<Parameter types>

=over

=item $factor : Real

=item $maxDetailIndex=0 : unsigned short

=item $minDetailIndex=99 : unsigned short

=back

I<Returns>

=over

=item void

=back

=head2 $obj->setPolygonModeOverrideable($PolygonModeOverrideable)

I<Parameter types>

=over

=item $PolygonModeOverrideable : bool

=back

I<Returns>

=over

=item void

=back

=head2 $obj->setCastShadows($enabled)

I<Parameter types>

=over

=item $enabled : bool

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getCastShadows()

I<Returns>

=over

=item bool

=back

=head1 AUTHOR

Scott Lanning E<lt>slanning@cpan.orgE<gt>

For licensing information, see README.txt .

=cut
