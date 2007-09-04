package Ogre;

use 5.006;
use strict;
use warnings;

require Exporter;
require DynaLoader;
our @ISA = qw(Exporter DynaLoader);

our $VERSION = '0.23';

# use all files under Ogre/ - probably not a good idea
use Ogre::Animation;
use Ogre::AnimationState;
use Ogre::BillboardChain;
use Ogre::BillboardSet;
use Ogre::Camera;
use Ogre::ColourValue;
use Ogre::ConfigFile;
use Ogre::Degree;
use Ogre::Entity;
use Ogre::Frustum;
use Ogre::InstancedGeometry;
use Ogre::Light;
use Ogre::LogManager;
use Ogre::ManualObject;
use Ogre::MaterialManager;
use Ogre::MeshManager;
use Ogre::MeshPtr;
use Ogre::MovableObject;
use Ogre::Node;
use Ogre::Overlay;
use Ogre::OverlayContainer;
use Ogre::OverlayElement;
use Ogre::OverlayManager;
use Ogre::ParticleSystem;
use Ogre::Plane;
use Ogre::Quaternion;
use Ogre::Radian;
use Ogre::Renderable;
use Ogre::RenderTarget;
use Ogre::RenderWindow;
use Ogre::ResourceGroupManager;
use Ogre::RibbonTrail;
use Ogre::Root;
use Ogre::SceneManager;
use Ogre::SceneNode;
use Ogre::StaticGeometry;
use Ogre::StringInterface;
use Ogre::TextureManager;
use Ogre::Vector3;
use Ogre::Viewport;
use Ogre::WindowEventUtilities;


sub dl_load_flags { $^O eq 'darwin' ? 0x00 : 0x01 }

__PACKAGE__->bootstrap($VERSION);


our %EXPORT_TAGS = (
    'TextureFilterOptions' => [
        qw(
           TFO_NONE
           TFO_BILINEAR
           TFO_TRILINEAR
           TFO_ANISOTROPIC
       )
    ],
    'PolygonMode' => [
        qw(
           PM_POINTS
           PM_WIREFRAME
           PM_SOLID
       )
    ],
    'FogMode' => [
        qw(
           FOG_NONE
           FOG_EXP
           FOG_EXP2
           FOG_LINEAR
       )
    ],
);

$EXPORT_TAGS{'all'} = [ map { @{ $EXPORT_TAGS{$_} } } keys %EXPORT_TAGS ];

our @EXPORT_OK = @{ $EXPORT_TAGS{'all'} };
our @EXPORT = ();


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
