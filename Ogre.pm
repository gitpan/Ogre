package Ogre;

use 5.006;
use strict;
use warnings;

# use all files under Ogre/ - probably not a good idea
use Ogre::Camera;
use Ogre::ColourValue;
use Ogre::ConfigFile;
use Ogre::Degree;
use Ogre::Entity;
use Ogre::Light;
use Ogre::Node;
use Ogre::MovableObject;
use Ogre::Radian;
use Ogre::RenderWindow;
use Ogre::Root;
use Ogre::SceneManager;
use Ogre::SceneNode;
use Ogre::ResourceGroupManager;
use Ogre::TextureManager;
use Ogre::Viewport;

require Exporter;
require DynaLoader;
our @ISA = qw(Exporter DynaLoader);

our $VERSION = '0.1';

sub dl_load_flags { $^O eq 'darwin' ? 0x00 : 0x01 }

__PACKAGE__->bootstrap($VERSION);


1;

__END__


=head1 NAME

Ogre - Perl binding for the OGRE C++ graphics library

=head1 SYNOPSIS

  use Ogre;
  # for now, see examples/README.txt

=head1 DESCRIPTION

For now, see README.txt.

=head1 AUTHOR

Scott Lanning E<lt>slanning@cpan.orgE<gt>

=cut
