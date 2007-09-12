package Ogre::Node;

use strict;
use warnings;

use Ogre::Renderable;
require Exporter;
our @ISA = qw(Ogre::Renderable);


########## GENERATED CONSTANTS BEGIN
require Exporter;
unshift @Ogre::Node::ISA, 'Exporter';

our %EXPORT_TAGS = (
	'TransformSpace' => [qw(
		TS_LOCAL
		TS_PARENT
		TS_WORLD
	)],
);

$EXPORT_TAGS{'all'} = [ map { @{ $EXPORT_TAGS{$_} } } keys %EXPORT_TAGS ];
our @EXPORT_OK = @{ $EXPORT_TAGS{'all'} };
our @EXPORT = ();
########## GENERATED CONSTANTS END

1;

__END__
=head1 NAME

Ogre::Node

=head1 SYNOPSIS

  use Ogre;
  use Ogre::Node;
  # (for now see examples/README.txt)

=head1 DESCRIPTION

See the online API documentation at
 L<http://www.ogre3d.org/docs/api/html/classOgre_1_1Node.html>

B<Note:> this Perl binding is currently I<experimental> and subject to API changes.

=head1 CLASS METHODS

=head2 Ogre::Node->queueNeedUpdate($n)

I<Parameter types>

=over

=item $n : Node *

=back

I<Returns>

=over

=item void

=back

=head2 Ogre::Node->processQueuedUpdates()

I<Returns>

=over

=item void

=back

=head2 Ogre::Node->TS_LOCAL()

I<Returns>

=over

=item int

=back

=head1 INSTANCE METHODS

=head2 $obj->roll($angle, $relativeTo=Node::TS_LOCAL)

I<Parameter types>

=over

=item $angle : Degree (or Radian) *

=item $relativeTo=Node::TS_LOCAL : int

=back

I<Returns>

=over

=item void

=back

=head2 $obj->pitch($angle, $relativeTo=Node::TS_LOCAL)

I<Parameter types>

=over

=item $angle : Degree (or Radian) *

=item $relativeTo=Node::TS_LOCAL : int

=back

I<Returns>

=over

=item void

=back

=head2 $obj->yaw($angle, $relativeTo=Node::TS_LOCAL)

I<Parameter types>

=over

=item $angle : Degree (or Radian) *

=item $relativeTo=Node::TS_LOCAL : int

=back

I<Returns>

=over

=item void

=back

=head2 $obj->scale($x, $y, $z)

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

=head2 $obj->rotate($axis, $angle, $relativeTo=Node::TS_LOCAL)

I<Parameter types>

=over

=item $axis : Vector3 *

=item $angle : Degree (or Radian) *

=item $relativeTo=Node::TS_LOCAL : int

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getName()

I<Returns>

=over

=item String

=back

=head2 $obj->getParent()

I<Returns>

=over

=item Node *

=back

=head2 $obj->getOrientation()

I<Returns>

=over

=item Quaternion *

=back

=head2 $obj->setOrientation($w, $x, $y, $z)

I<Parameter types>

=over

=item $w : Real

=item $x : Real

=item $y : Real

=item $z : Real

=back

I<Returns>

=over

=item void

=back

=head2 $obj->resetOrientation()

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

=head2 $obj->getPosition()

I<Returns>

=over

=item Vector3 *

=back

=head2 $obj->setScale($x, $y, $z)

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

=head2 $obj->setInheritOrientation($inherit)

I<Parameter types>

=over

=item $inherit : bool

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getInheritOrientation()

I<Returns>

=over

=item bool

=back

=head2 $obj->setInheritScale($inherit)

I<Parameter types>

=over

=item $inherit : bool

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getInheritScale()

I<Returns>

=over

=item bool

=back

=head2 $obj->translate($x, $y, $z, $relativeTo=Node::TS_PARENT)

I<Parameter types>

=over

=item $x : Real

=item $y : Real

=item $z : Real

=item $relativeTo=Node::TS_PARENT : int

=back

I<Returns>

=over

=item void

=back

=head2 $obj->addChild($child)

I<Parameter types>

=over

=item $child : Node *

=back

I<Returns>

=over

=item void

=back

=head2 $obj->numChildren()

I<Returns>

=over

=item unsigned short

=back

=head2 $obj->getChild($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item Node *

=back

=head2 $obj->removeChild($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->removeAllChildren()

I<Returns>

=over

=item void

=back

=head1 AUTHOR

Scott Lanning E<lt>slanning@cpan.orgE<gt>

For licensing information, see README.txt .

=cut
