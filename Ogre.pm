package Ogre;

use 5.006;
use strict;
use warnings;

require DynaLoader;
our @ISA = qw(DynaLoader);

our $VERSION = '0.28';

# use all files under Ogre/ - probably not a good idea
use Ogre::AnimableValue;
use Ogre::Animation;
use Ogre::AnimationState;
use Ogre::AnimationStateSet;
use Ogre::AxisAlignedBox;
use Ogre::BillboardChain;
use Ogre::BillboardSet;
use Ogre::Camera;
use Ogre::ColourValue;
use Ogre::CompositionPass;
use Ogre::CompositionTargetPass;
use Ogre::ConfigFile;
use Ogre::Degree;
use Ogre::Entity;
use Ogre::Exception;
use Ogre::Frustum;
use Ogre::GpuProgramParameters;
use Ogre::HardwareBuffer;
use Ogre::HardwareBufferManager;
use Ogre::HardwareIndexBuffer;
use Ogre::Image;
use Ogre::InstancedGeometry::InstancedObject;
use Ogre::InstancedGeometry;
use Ogre::Light;
use Ogre::LogManager;
use Ogre::ManualObject;
use Ogre::MaterialManager;
use Ogre::Math;
use Ogre::Matrix3;
use Ogre::MeshManager;
use Ogre::MeshPtr;
use Ogre::MovableObject;
use Ogre::Node;
use Ogre::Overlay;
use Ogre::OverlayContainer;
use Ogre::OverlayElement;
use Ogre::OverlayManager;
use Ogre::Particle;
use Ogre::ParticleSystem;
use Ogre::Pass;
use Ogre::PatchSurface;
use Ogre::Plane;
use Ogre::ProgressiveMesh;
use Ogre::Quaternion;
use Ogre::QueuedRenderableCollection;
use Ogre::Radian;
use Ogre::RenderOperation;
use Ogre::RenderTarget;
use Ogre::RenderWindow;
use Ogre::Renderable;
use Ogre::Resource;
use Ogre::ResourceGroupManager;
use Ogre::RibbonTrail;
use Ogre::Root;
use Ogre::SceneManager;
use Ogre::SceneNode;
use Ogre::SceneQuery;
use Ogre::Serializer;
use Ogre::StaticGeometry;
use Ogre::StringInterface;
use Ogre::SubEntity;
use Ogre::TextureManager;
use Ogre::TextureUnitState;
use Ogre::Vector3;
use Ogre::VertexAnimationTrack;
use Ogre::VertexCacheProfiler;
use Ogre::Viewport;
use Ogre::WindowEventUtilities;


sub dl_load_flags { $^O eq 'darwin' ? 0x00 : 0x01 }

__PACKAGE__->bootstrap($VERSION);


########## GENERATED CONSTANTS BEGIN
require Exporter;
unshift @Ogre::ISA, 'Exporter';

our %EXPORT_TAGS = (
	'SceneType' => [qw(
		ST_GENERIC
		ST_EXTERIOR_CLOSE
		ST_EXTERIOR_FAR
		ST_EXTERIOR_REAL_FAR
		ST_INTERIOR
	)],
	'StencilOperation' => [qw(
		SOP_KEEP
		SOP_ZERO
		SOP_REPLACE
		SOP_INCREMENT
		SOP_DECREMENT
		SOP_INCREMENT_WRAP
		SOP_DECREMENT_WRAP
		SOP_INVERT
	)],
	'TexCoordCalcMethod' => [qw(
		TEXCALC_NONE
		TEXCALC_ENVIRONMENT_MAP
		TEXCALC_ENVIRONMENT_MAP_PLANAR
		TEXCALC_ENVIRONMENT_MAP_REFLECTION
		TEXCALC_ENVIRONMENT_MAP_NORMAL
		TEXCALC_PROJECTIVE_TEXTURE
	)],
	'Capabilities' => [qw(
		RSC_AUTOMIPMAP
		RSC_BLENDING
		RSC_ANISOTROPY
		RSC_DOT3
		RSC_CUBEMAPPING
		RSC_HWSTENCIL
		RSC_VBO
		RSC_VERTEX_PROGRAM
		RSC_FRAGMENT_PROGRAM
		RSC_TEXTURE_COMPRESSION
		RSC_TEXTURE_COMPRESSION_DXT
		RSC_TEXTURE_COMPRESSION_VTC
		RSC_SCISSOR_TEST
		RSC_TWO_SIDED_STENCIL
		RSC_STENCIL_WRAP
		RSC_HWOCCLUSION
		RSC_USER_CLIP_PLANES
		RSC_VERTEX_FORMAT_UBYTE4
		RSC_INFINITE_FAR_PLANE
		RSC_HWRENDER_TO_TEXTURE
		RSC_TEXTURE_FLOAT
		RSC_NON_POWER_OF_2_TEXTURES
		RSC_TEXTURE_3D
		RSC_POINT_SPRITES
		RSC_POINT_EXTENDED_PARAMETERS
		RSC_VERTEX_TEXTURE_FETCH
		RSC_MIPMAP_LOD_BIAS
	)],
	'IlluminationStage' => [qw(
		IS_AMBIENT
		IS_PER_LIGHT
		IS_DECAL
	)],
	'GuiVerticalAlignment' => [qw(
		GVA_TOP
		GVA_CENTER
		GVA_BOTTOM
	)],
	'GuiHorizontalAlignment' => [qw(
		GHA_LEFT
		GHA_CENTER
		GHA_RIGHT
	)],
	'GuiMetricsMode' => [qw(
		GMM_RELATIVE
		GMM_PIXELS
		GMM_RELATIVE_ASPECT_ADJUSTED
	)],
	'MaterialScriptSection' => [qw(
		MSS_NONE
		MSS_MATERIAL
		MSS_TECHNIQUE
		MSS_PASS
		MSS_TEXTUREUNIT
		MSS_PROGRAM_REF
		MSS_PROGRAM
		MSS_DEFAULT_PARAMETERS
		MSS_TEXTURESOURCE
	)],
	'LogMessageLevel' => [qw(
		LML_TRIVIAL
		LML_NORMAL
		LML_CRITICAL
	)],
	'LoggingLevel' => [qw(
		LL_LOW
		LL_NORMAL
		LL_BOREME
	)],
	'SkeletonAnimationBlendMode' => [qw(
		ANIMBLEND_AVERAGE
		ANIMBLEND_CUMULATIVE
	)],
	'TextureMipmap' => [qw(
		MIP_UNLIMITED
		MIP_DEFAULT
	)],
	'TextureType' => [qw(
		TEX_TYPE_1D
		TEX_TYPE_2D
		TEX_TYPE_3D
		TEX_TYPE_CUBE_MAP
	)],
	'TextureUsage' => [qw(
		TU_STATIC
		TU_DYNAMIC
		TU_WRITE_ONLY
		TU_STATIC_WRITE_ONLY
		TU_DYNAMIC_WRITE_ONLY
		TU_DYNAMIC_WRITE_ONLY_DISCARDABLE
		TU_AUTOMIPMAP
		TU_RENDERTARGET
		TU_DEFAULT
	)],
	'ImageFlags' => [qw(
		IF_COMPRESSED
		IF_CUBEMAP
		IF_3D_TEXTURE
	)],
	'PixelComponentType' => [qw(
		PCT_BYTE
		PCT_SHORT
		PCT_FLOAT16
		PCT_FLOAT32
		PCT_COUNT
	)],
	'PixelFormatFlags' => [qw(
		PFF_HASALPHA
		PFF_COMPRESSED
		PFF_FLOAT
		PFF_DEPTH
		PFF_NATIVEENDIAN
		PFF_LUMINANCE
	)],
	'PixelFormat' => [qw(
		PF_UNKNOWN
		PF_L8
		PF_BYTE_L
		PF_L16
		PF_SHORT_L
		PF_A8
		PF_BYTE_A
		PF_A4L4
		PF_BYTE_LA
		PF_R5G6B5
		PF_B5G6R5
		PF_R3G3B2
		PF_A4R4G4B4
		PF_A1R5G5B5
		PF_R8G8B8
		PF_B8G8R8
		PF_A8R8G8B8
		PF_A8B8G8R8
		PF_B8G8R8A8
		PF_R8G8B8A8
		PF_X8R8G8B8
		PF_X8B8G8R8
		PF_BYTE_RGB
		PF_BYTE_BGR
		PF_BYTE_BGRA
		PF_BYTE_RGBA
		PF_A2R10G10B10
		PF_A2B10G10R10
		PF_DXT1
		PF_DXT2
		PF_DXT3
		PF_DXT4
		PF_DXT5
		PF_FLOAT16_R
		PF_FLOAT16_RGB
		PF_FLOAT16_RGBA
		PF_FLOAT32_R
		PF_FLOAT32_RGB
		PF_FLOAT32_RGBA
		PF_FLOAT16_GR
		PF_FLOAT32_GR
		PF_DEPTH
		PF_SHORT_RGBA
		PF_SHORT_GR
		PF_SHORT_RGB
		PF_COUNT
	)],
	'FrustumPlane' => [qw(
		FRUSTUM_PLANE_NEAR
		FRUSTUM_PLANE_FAR
		FRUSTUM_PLANE_LEFT
		FRUSTUM_PLANE_RIGHT
		FRUSTUM_PLANE_TOP
		FRUSTUM_PLANE_BOTTOM
	)],
	'ProjectionType' => [qw(
		PT_ORTHOGRAPHIC
		PT_PERSPECTIVE
	)],
	'BillboardType' => [qw(
		BBT_POINT
		BBT_ORIENTED_COMMON
		BBT_ORIENTED_SELF
		BBT_PERPENDICULAR_COMMON
		BBT_PERPENDICULAR_SELF
	)],
	'BillboardRotationType' => [qw(
		BBR_VERTEX
		BBR_TEXCOORD
	)],
	'BillboardOrigin' => [qw(
		BBO_TOP_LEFT
		BBO_TOP_CENTER
		BBO_TOP_RIGHT
		BBO_CENTER_LEFT
		BBO_CENTER
		BBO_CENTER_RIGHT
		BBO_BOTTOM_LEFT
		BBO_BOTTOM_CENTER
		BBO_BOTTOM_RIGHT
	)],
	'ShadowRenderableFlags' => [qw(
		SRF_INCLUDE_LIGHT_CAP
		SRF_INCLUDE_DARK_CAP
		SRF_EXTRUDE_TO_INFINITY
	)],
	'GpuConstantType' => [qw(
		GCT_FLOAT1
		GCT_FLOAT2
		GCT_FLOAT3
		GCT_FLOAT4
		GCT_SAMPLER1D
		GCT_SAMPLER2D
		GCT_SAMPLER3D
		GCT_SAMPLERCUBE
		GCT_SAMPLER1DSHADOW
		GCT_SAMPLER2DSHADOW
		GCT_MATRIX_2X2
		GCT_MATRIX_2X3
		GCT_MATRIX_2X4
		GCT_MATRIX_3X2
		GCT_MATRIX_3X3
		GCT_MATRIX_3X4
		GCT_MATRIX_4X2
		GCT_MATRIX_4X3
		GCT_MATRIX_4X4
		GCT_INT1
		GCT_INT2
		GCT_INT3
		GCT_INT4
		GCT_UNKNOWN
	)],
	'GpuProgramType' => [qw(
		GPT_VERTEX_PROGRAM
		GPT_FRAGMENT_PROGRAM
	)],
	'SceneBlendFactor' => [qw(
		SBF_ONE
		SBF_ZERO
		SBF_DEST_COLOUR
		SBF_SOURCE_COLOUR
		SBF_ONE_MINUS_DEST_COLOUR
		SBF_ONE_MINUS_SOURCE_COLOUR
		SBF_DEST_ALPHA
		SBF_SOURCE_ALPHA
		SBF_ONE_MINUS_DEST_ALPHA
		SBF_ONE_MINUS_SOURCE_ALPHA
	)],
	'SceneBlendType' => [qw(
		SBT_TRANSPARENT_ALPHA
		SBT_TRANSPARENT_COLOUR
		SBT_ADD
		SBT_MODULATE
		SBT_REPLACE
	)],
	'LayerBlendSource' => [qw(
		LBS_CURRENT
		LBS_TEXTURE
		LBS_DIFFUSE
		LBS_SPECULAR
		LBS_MANUAL
	)],
	'LayerBlendOperationEx' => [qw(
		LBX_SOURCE1
		LBX_SOURCE2
		LBX_MODULATE
		LBX_MODULATE_X2
		LBX_MODULATE_X4
		LBX_ADD
		LBX_ADD_SIGNED
		LBX_ADD_SMOOTH
		LBX_SUBTRACT
		LBX_BLEND_DIFFUSE_ALPHA
		LBX_BLEND_TEXTURE_ALPHA
		LBX_BLEND_CURRENT_ALPHA
		LBX_BLEND_MANUAL
		LBX_DOTPRODUCT
		LBX_BLEND_DIFFUSE_COLOUR
	)],
	'LayerBlendOperation' => [qw(
		LBO_REPLACE
		LBO_ADD
		LBO_MODULATE
		LBO_ALPHA_BLEND
	)],
	'LayerBlendType' => [qw(
		LBT_COLOUR
		LBT_ALPHA
	)],
	'RenderQueueGroupID' => [qw(
		RENDER_QUEUE_BACKGROUND
		RENDER_QUEUE_SKIES_EARLY
		RENDER_QUEUE_1
		RENDER_QUEUE_2
		RENDER_QUEUE_WORLD_GEOMETRY_1
		RENDER_QUEUE_3
		RENDER_QUEUE_4
		RENDER_QUEUE_MAIN
		RENDER_QUEUE_6
		RENDER_QUEUE_7
		RENDER_QUEUE_WORLD_GEOMETRY_2
		RENDER_QUEUE_8
		RENDER_QUEUE_9
		RENDER_QUEUE_SKIES_LATE
		RENDER_QUEUE_OVERLAY
		RENDER_QUEUE_MAX
	)],
	'ParameterType' => [qw(
		PT_BOOL
		PT_REAL
		PT_INT
		PT_UNSIGNED_INT
		PT_SHORT
		PT_UNSIGNED_SHORT
		PT_LONG
		PT_UNSIGNED_LONG
		PT_STRING
		PT_VECTOR3
		PT_MATRIX3
		PT_MATRIX4
		PT_QUATERNION
		PT_COLOURVALUE
	)],
	'FrameBufferType' => [qw(
		FBT_COLOUR
		FBT_DEPTH
		FBT_STENCIL
	)],
	'SortMode' => [qw(
		SM_DIRECTION
		SM_DISTANCE
	)],
	'TrackVertexColourEnum' => [qw(
		TVC_NONE
		TVC_AMBIENT
		TVC_DIFFUSE
		TVC_SPECULAR
		TVC_EMISSIVE
	)],
	'ShadowTechnique' => [qw(
		SHADOWTYPE_NONE
		SHADOWDETAILTYPE_ADDITIVE
		SHADOWDETAILTYPE_MODULATIVE
		SHADOWDETAILTYPE_INTEGRATED
		SHADOWDETAILTYPE_STENCIL
		SHADOWDETAILTYPE_TEXTURE
		SHADOWTYPE_STENCIL_MODULATIVE
		SHADOWTYPE_STENCIL_ADDITIVE
		SHADOWTYPE_TEXTURE_MODULATIVE
		SHADOWTYPE_TEXTURE_ADDITIVE
		SHADOWTYPE_TEXTURE_ADDITIVE_INTEGRATED
		SHADOWTYPE_TEXTURE_MODULATIVE_INTEGRATED
	)],
	'PolygonMode' => [qw(
		PM_POINTS
		PM_WIREFRAME
		PM_SOLID
	)],
	'WaveformType' => [qw(
		WFT_SINE
		WFT_TRIANGLE
		WFT_SQUARE
		WFT_SAWTOOTH
		WFT_INVERSE_SAWTOOTH
		WFT_PWM
	)],
	'ManualCullingMode' => [qw(
		MANUAL_CULL_NONE
		MANUAL_CULL_BACK
		MANUAL_CULL_FRONT
	)],
	'CullingMode' => [qw(
		CULL_NONE
		CULL_CLOCKWISE
		CULL_ANTICLOCKWISE
	)],
	'FogMode' => [qw(
		FOG_NONE
		FOG_EXP
		FOG_EXP2
		FOG_LINEAR
	)],
	'ShadeOptions' => [qw(
		SO_FLAT
		SO_GOURAUD
		SO_PHONG
	)],
	'FilterOptions' => [qw(
		FO_NONE
		FO_POINT
		FO_LINEAR
		FO_ANISOTROPIC
	)],
	'FilterType' => [qw(
		FT_MIN
		FT_MAG
		FT_MIP
	)],
	'TextureFilterOptions' => [qw(
		TFO_NONE
		TFO_BILINEAR
		TFO_TRILINEAR
		TFO_ANISOTROPIC
	)],
	'CompareFunction' => [qw(
		CMPF_ALWAYS_FAIL
		CMPF_ALWAYS_PASS
		CMPF_LESS
		CMPF_LESS_EQUAL
		CMPF_EQUAL
		CMPF_NOT_EQUAL
		CMPF_GREATER_EQUAL
		CMPF_GREATER
	)],
	'VertexAnimationType' => [qw(
		VAT_NONE
		VAT_MORPH
		VAT_POSE
	)],
	'VertexElementType' => [qw(
		VET_FLOAT1
		VET_FLOAT2
		VET_FLOAT3
		VET_FLOAT4
		VET_COLOUR
		VET_SHORT1
		VET_SHORT2
		VET_SHORT3
		VET_SHORT4
		VET_UBYTE4
		VET_COLOUR_ARGB
		VET_COLOUR_ABGR
	)],
	'VertexElementSemantic' => [qw(
		VES_POSITION
		VES_BLEND_WEIGHTS
		VES_BLEND_INDICES
		VES_NORMAL
		VES_DIFFUSE
		VES_SPECULAR
		VES_TEXTURE_COORDINATES
		VES_BINORMAL
		VES_TANGENT
	)],
);

$EXPORT_TAGS{'all'} = [ map { @{ $EXPORT_TAGS{$_} } } keys %EXPORT_TAGS ];
our @EXPORT_OK = @{ $EXPORT_TAGS{'all'} };
our @EXPORT = ();
########## GENERATED CONSTANTS END


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

For licensing info, see README.txt .

=cut
