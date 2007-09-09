package Ogre::ResourceGroupManager;

use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);

our %EXPORT_TAGS = (
    'groupnames' => [
        qw(
           DEFAULT_RESOURCE_GROUP_NAME
           INTERNAL_RESOURCE_GROUP_NAME
           BOOTSTRAP_RESOURCE_GROUP_NAME
           AUTODETECT_RESOURCE_GROUP_NAME
       )
    ],
);

$EXPORT_TAGS{'all'} = [ map { @{ $EXPORT_TAGS{$_} } } keys %EXPORT_TAGS ];

our @EXPORT_OK = @{ $EXPORT_TAGS{'all'} };
our @EXPORT = ();


1;

__END__
=head1 NAME

Ogre::ResourceGroupManager

=head1 SYNOPSIS

  use Ogre;
  use Ogre::ResourceGroupManager;
  # (for now see examples/README.txt)

=head1 DESCRIPTION

See the online API documentation at
 L<http://www.ogre3d.org/docs/api/html/classOgre_1_1ResourceGroupManager.html>

B<Note:> this Perl binding is currently I<experimental> and subject to API changes.

=head1 CLASS METHODS

=head2 Ogre::ResourceGroupManager->getSingletonPtr()

I<Returns>

=over

=item ResourceGroupManager *

=back

=head2 Ogre::ResourceGroupManager->DEFAULT_RESOURCE_GROUP_NAME()

I<Returns>

=over

=item String

=back

=head1 INSTANCE METHODS

=head2 $obj->addResourceLocation($name, $locType, $resGroup)

I<Parameter types>

=over

=item $name : String

=item $locType : String

=item $resGroup : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->initialiseAllResourceGroups()

I<Returns>

=over

=item void

=back

=head1 AUTHOR

Scott Lanning E<lt>slanning@cpan.orgE<gt>

For licensing information, see README.txt .

=cut
