package Ogre;

use 5.006;
use strict;
use warnings;

require Exporter;
require DynaLoader;
our @ISA = qw(Exporter DynaLoader);

our $VERSION = '0.20';

# use all files under Ogre/ - probably not a good idea
use Ogre::Camera;
use Ogre::ColourValue;
use Ogre::ConfigFile;
use Ogre::Degree;
use Ogre::Entity;
use Ogre::Light;
use Ogre::LogManager;
use Ogre::MeshManager;
use Ogre::MeshPtr;
use Ogre::MovableObject;
use Ogre::Node;
use Ogre::OverlayManager;
use Ogre::Plane;
use Ogre::Radian;
use Ogre::RenderTarget;
use Ogre::RenderWindow;
use Ogre::ResourceGroupManager;
use Ogre::Root;
use Ogre::SceneManager;
use Ogre::SceneNode;
use Ogre::TextureManager;
use Ogre::Vector3;
use Ogre::Viewport;
use Ogre::WindowEventUtilities;


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
