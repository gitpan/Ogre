package Ogre::SceneManager;

use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);

our %EXPORT_TAGS = (
    'scenetype' => [
        qw(
           ST_GENERIC
           ST_EXTERIOR_CLOSE
           ST_EXTERIOR_FAR
           ST_EXTERIOR_REAL_FAR
           ST_INTERIOR
       )
    ],
    'prefabtype' => [
        qw(
           PT_PLANE
           PT_CUBE
           PT_SPHERE
       )
    ],
    'ShadowTechnique' => [
        qw(
           SHADOWDETAILTYPE_ADDITIVE
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
       ),
    ],
);

$EXPORT_TAGS{'all'} = [ map { @{ $EXPORT_TAGS{$_} } } keys %EXPORT_TAGS ];

our @EXPORT_OK = @{ $EXPORT_TAGS{'all'} };
our @EXPORT = ();


1;

__END__
=head1 NAME

Ogre::SceneManager

=head1 SYNOPSIS

  use Ogre;
  use Ogre::SceneManager;
  # (for now see examples/README.txt)

=head1 DESCRIPTION

See the online API documentation at
 L<http://www.ogre3d.org/docs/api/html/classOgre_1_1SceneManager.html>

B<Note:> this Perl binding is currently I<experimental> and subject to API changes.

=head1 CLASS METHODS

=head2 Ogre::SceneManager->ST_GENERIC()

I<Returns>

=over

=item uint16

=back

=head2 Ogre::SceneManager->PT_PLANE()

I<Returns>

=over

=item int

=back

=head2 Ogre::SceneManager->SHADOWTYPE_NONE()

I<Returns>

=over

=item int

=back

=head1 INSTANCE METHODS

=head2 $obj->getName()

I<Returns>

=over

=item String

=back

=head2 $obj->getTypeName()

I<Returns>

=over

=item String

=back

=head2 $obj->createCamera($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item Camera *

=back

=head2 $obj->getCamera($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item Camera *

=back

=head2 $obj->hasCamera($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item bool

=back

=head2 $obj->destroyCamera($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->destroyAllCameras()

I<Returns>

=over

=item void

=back

=head2 $obj->createLight($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item Light *

=back

=head2 $obj->getLight($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item Light *

=back

=head2 $obj->hasLight($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item bool

=back

=head2 $obj->destroyLight($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->destroyAllLights()

I<Returns>

=over

=item void

=back

=head2 $obj->createSceneNode($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item SceneNode *

=back

=head2 $obj->destroySceneNode($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getRootSceneNode()

I<Returns>

=over

=item SceneNode *

=back

=head2 $obj->getSceneNode($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item SceneNode *

=back

=head2 $obj->hasSceneNode($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item bool

=back

=head2 $obj->createEntity($entityName, $meshName)

I<Parameter types>

=over

=item $entityName : String

=item $meshName : String

=back

I<Returns>

=over

=item Entity *

=back

=head2 $obj->getEntity($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item Entity *

=back

=head2 $obj->hasEntity($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item bool

=back

=head2 $obj->destroyEntity($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->destroyAllEntities()

I<Returns>

=over

=item void

=back

=head2 $obj->createManualObject($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item ManualObject *

=back

=head2 $obj->getManualObject($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item ManualObject *

=back

=head2 $obj->hasManualObject($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item bool

=back

=head2 $obj->destroyManualObject($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->destroyAllManualObjects()

I<Returns>

=over

=item void

=back

=head2 $obj->createBillboardChain($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item BillboardChain *

=back

=head2 $obj->getBillboardChain($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item BillboardChain *

=back

=head2 $obj->hasBillboardChain($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item bool

=back

=head2 $obj->destroyBillboardChain($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->destroyAllBillboardChains()

I<Returns>

=over

=item void

=back

=head2 $obj->createRibbonTrail($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item RibbonTrail *

=back

=head2 $obj->getRibbonTrail($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item RibbonTrail *

=back

=head2 $obj->hasRibbonTrail($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item bool

=back

=head2 $obj->destroyRibbonTrail($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->destroyAllRibbonTrails()

I<Returns>

=over

=item void

=back

=head2 $obj->createParticleSystem($name, $templateName)

I<Parameter types>

=over

=item $name : String

=item $templateName : String

=back

I<Returns>

=over

=item ParticleSystem *

=back

=head2 $obj->getParticleSystem($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item ParticleSystem *

=back

=head2 $obj->hasParticleSystem($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item bool

=back

=head2 $obj->destroyParticleSystem($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->destroyAllParticleSystems()

I<Returns>

=over

=item void

=back

=head2 $obj->clearScene()

I<Returns>

=over

=item void

=back

=head2 $obj->setAmbientLight($colour)

I<Parameter types>

=over

=item $colour : ColourValue *

=back

I<Returns>

=over

=item void

=back

=head2 $obj->setWorldGeometry($filename)

I<Parameter types>

=over

=item $filename : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->estimateWorldGeometry($filename)

I<Parameter types>

=over

=item $filename : String

=back

I<Returns>

=over

=item size_t

=back

=head2 $obj->hasOption($strKey)

I<Parameter types>

=over

=item $strKey : String

=back

I<Returns>

=over

=item bool

=back

=head2 $obj->setSkyPlane($enable, $plane, $materialName, $scale, $tiling, $drawFirst, $bow, $xsegments, $ysegments, $groupName)

I<Parameter types>

=over

=item $enable : bool

=item $plane : Plane *

=item $materialName : String

=item $scale : Real

=item $tiling : Real

=item $drawFirst : bool

=item $bow : Real

=item $xsegments : int

=item $ysegments : int

=item $groupName : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->isSkyPlaneEnabled()

I<Returns>

=over

=item bool

=back

=head2 $obj->getSkyPlaneNode()

I<Returns>

=over

=item SceneNode *

=back

=head2 $obj->setSkyBox($enable, $materialName, $distance, $drawFirst, $orientation, $groupName)

I<Parameter types>

=over

=item $enable : bool

=item $materialName : String

=item $distance : Real

=item $drawFirst : bool

=item $orientation : Quaternion *

=item $groupName : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->isSkyBoxEnabled()

I<Returns>

=over

=item bool

=back

=head2 $obj->getSkyBoxNode()

I<Returns>

=over

=item SceneNode *

=back

=head2 $obj->setSkyDome($enable, $materialName, $curvature, $tiling, $distance, $drawFirst, $orientation, $xsegments, $ysegments, $ysegments_keep, $groupName)

I<Parameter types>

=over

=item $enable : bool

=item $materialName : String

=item $curvature : Real

=item $tiling : Real

=item $distance : Real

=item $drawFirst : bool

=item $orientation : Quaternion *

=item $xsegments : int

=item $ysegments : int

=item $ysegments_keep : int

=item $groupName : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->isSkyDomeEnabled()

I<Returns>

=over

=item bool

=back

=head2 $obj->getSkyDomeNode()

I<Returns>

=over

=item SceneNode *

=back

=head2 $obj->setFog($mode, $colour, $expDensity=0.001, $linearStart=0.0, $linearEnd=1.0)

I<Parameter types>

=over

=item $mode : int

=item $colour : ColourValue *

=item $expDensity=0.001 : Real

=item $linearStart=0.0 : Real

=item $linearEnd=1.0 : Real

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getFogMode()

I<Returns>

=over

=item int

=back

=head2 $obj->getFogStart()

I<Returns>

=over

=item Real

=back

=head2 $obj->getFogEnd()

I<Returns>

=over

=item Real

=back

=head2 $obj->getFogDensity()

I<Returns>

=over

=item Real

=back

=head2 $obj->createBillboardSet($name, $poolSize=20)

I<Parameter types>

=over

=item $name : String

=item $poolSize=20 : unsigned int

=back

I<Returns>

=over

=item BillboardSet *

=back

=head2 $obj->getBillboardSet($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item BillboardSet *

=back

=head2 $obj->hasBillboardSet($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item bool

=back

=head2 $obj->destroyBillboardSet($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->destroyAllBillboardSets()

I<Returns>

=over

=item void

=back

=head2 $obj->setDisplaySceneNodes($display)

I<Parameter types>

=over

=item $display : bool

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getDisplaySceneNodes()

I<Returns>

=over

=item bool

=back

=head2 $obj->createAnimation($name, $length)

I<Parameter types>

=over

=item $name : String

=item $length : Real

=back

I<Returns>

=over

=item Animation *

=back

=head2 $obj->getAnimation($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item Animation *

=back

=head2 $obj->hasAnimation($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item bool

=back

=head2 $obj->destroyAnimation($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->destroyAllAnimations()

I<Returns>

=over

=item void

=back

=head2 $obj->createAnimationState($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item AnimationState *

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

=head2 $obj->hasAnimationState($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item bool

=back

=head2 $obj->destroyAnimationState($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->destroyAllAnimationStates()

I<Returns>

=over

=item void

=back

=head2 $obj->showBoundingBoxes($bShow)

I<Parameter types>

=over

=item $bShow : bool

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getShowBoundingBoxes()

I<Returns>

=over

=item bool

=back

=head2 $obj->setShadowTechnique($technique)

I<Parameter types>

=over

=item $technique : int

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getShadowTechnique()

I<Returns>

=over

=item int

=back

=head2 $obj->setShowDebugShadows($debug)

I<Parameter types>

=over

=item $debug : bool

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getShowDebugShadows()

I<Returns>

=over

=item bool

=back

=head2 $obj->setShadowColour($colour)

I<Parameter types>

=over

=item $colour : ColourValue *

=back

I<Returns>

=over

=item void

=back

=head2 $obj->setShadowDirectionalLightExtrusionDistance($dist)

I<Parameter types>

=over

=item $dist : Real

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getShadowDirectionalLightExtrusionDistance()

I<Returns>

=over

=item Real

=back

=head2 $obj->setShadowFarDistance($distance)

I<Parameter types>

=over

=item $distance : Real

=back

I<Returns>

=over

=item void 

=back

=head2 $obj->getShadowFarDistance()

I<Returns>

=over

=item Real

=back

=head2 $obj->setShadowIndexBufferSize($size)

I<Parameter types>

=over

=item $size : size_t

=back

I<Returns>

=over

=item void 

=back

=head2 $obj->getShadowIndexBufferSize()

I<Returns>

=over

=item size_t 

=back

=head2 $obj->setShadowTextureSize($size)

I<Parameter types>

=over

=item $size : unsigned short

=back

I<Returns>

=over

=item void 

=back

=head2 $obj->createStaticGeometry($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item StaticGeometry *

=back

=head2 $obj->getStaticGeometry($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item StaticGeometry *

=back

=head2 $obj->hasStaticGeometry($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item bool

=back

=head2 $obj->destroyStaticGeometry($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->destroyAllStaticGeometry()

I<Returns>

=over

=item void

=back

=head2 $obj->createInstancedGeometry($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item InstancedGeometry *

=back

=head2 $obj->getInstancedGeometry($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item InstancedGeometry *

=back

=head2 $obj->destroyInstancedGeometry($name)

I<Parameter types>

=over

=item $name : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->destroyAllInstancedGeometry()

I<Returns>

=over

=item void

=back

=head2 $obj->createMovableObject($name, $typeName)

I<Parameter types>

=over

=item $name : String

=item $typeName : String

=back

I<Returns>

=over

=item MovableObject *

=back

=head2 $obj->getMovableObject($name, $typeName)

I<Parameter types>

=over

=item $name : String

=item $typeName : String

=back

I<Returns>

=over

=item MovableObject *

=back

=head2 $obj->hasMovableObject($name, $typeName)

I<Parameter types>

=over

=item $name : String

=item $typeName : String

=back

I<Returns>

=over

=item bool

=back

=head2 $obj->destroyMovableObject($name, $typeName)

I<Parameter types>

=over

=item $name : String

=item $typeName : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->destroyAllMovableObjects()

I<Returns>

=over

=item void

=back

=head2 $obj->destroyAllMovableObjectsByType($typeName)

I<Parameter types>

=over

=item $typeName : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->injectMovableObject($m)

I<Parameter types>

=over

=item $m : MovableObject *

=back

I<Returns>

=over

=item void

=back

=head2 $obj->extractMovableObject($name, $typeName)

I<Parameter types>

=over

=item $name : String

=item $typeName : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->extractAllMovableObjectsByType($typeName)

I<Parameter types>

=over

=item $typeName : String

=back

I<Returns>

=over

=item void

=back

=head2 $obj->setVisibilityMask($vmask)

I<Parameter types>

=over

=item $vmask : unsigned int

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getVisibilityMask()

I<Returns>

=over

=item unsigned int

=back

=head2 $obj->setFindVisibleObjects($find)

I<Parameter types>

=over

=item $find : bool

=back

I<Returns>

=over

=item void

=back

=head2 $obj->getFindVisibleObjects()

I<Returns>

=over

=item bool

=back

=head2 $obj->getCurrentViewport()

I<Returns>

=over

=item Viewport *

=back

=head1 AUTHOR

Scott Lanning E<lt>slanning@cpan.orgE<gt>

For licensing information, see README.txt .

=cut
