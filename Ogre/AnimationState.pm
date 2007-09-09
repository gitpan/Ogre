package Ogre::AnimationState;

use strict;
use warnings;


1;

__END__
=head1 NAME

Ogre::AnimationState

=head1 SYNOPSIS

  use Ogre;
  use Ogre::AnimationState;
  # (for now see examples/README.txt)

=head1 DESCRIPTION

See the online API documentation at
 L<http://www.ogre3d.org/docs/api/html/classOgre_1_1AnimationState.html>

B<Note:> this Perl binding is currently I<experimental> and subject to API changes.

=head1 INSTANCE METHODS

=head2 $obj->getAnimationName()

I<Returns>

=over

=item String

=back

=head2 $obj->getTimePosition()

I<Returns>

=over

=item Real

=back

=head2 $obj->setTimePosition($timePos)

I<Parameter types>

=over

=item $timePos : Real

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getLength()

I<Returns>

=over

=item Real

=back

=head2 $obj->setLength($len)

I<Parameter types>

=over

=item $len : Real

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getWeight()

I<Returns>

=over

=item Real

=back

=head2 $obj->setWeight($weight)

I<Parameter types>

=over

=item $weight : Real

=back

I<Returns>

=over

=item void

=back

=head2 $obj->addTime($offset)

I<Parameter types>

=over

=item $offset : Real

=back

I<Returns>

=over

=item void

=back

=head2 $obj->hasEnded()

I<Returns>

=over

=item bool

=back

=head2 $obj->getEnabled()

I<Returns>

=over

=item bool

=back

=head2 $obj->setEnabled($enabled)

I<Parameter types>

=over

=item $enabled : bool

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getLoop()

I<Returns>

=over

=item bool

=back

=head2 $obj->setLoop($loop)

I<Parameter types>

=over

=item $loop : bool

=back

I<Returns>

=over

=item void

=back

=head2 $obj->copyStateFrom($animState)

I<Parameter types>

=over

=item $animState : AnimationState *

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getParent()

I<Returns>

=over

=item AnimationStateSet *

=back

=head1 AUTHOR

Scott Lanning E<lt>slanning@cpan.orgE<gt>

For licensing information, see README.txt .

=cut
