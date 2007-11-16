MODULE = Ogre     PACKAGE = Ogre::RenderSystemCapabilities

void
RenderSystemCapabilities::setNumWorldMatricies(unsigned short num)

void
RenderSystemCapabilities::setNumTextureUnits(unsigned short num)

void
RenderSystemCapabilities::setStencilBufferBitDepth(unsigned short num)

void
RenderSystemCapabilities::setNumVertexBlendMatrices(unsigned short num)

void
RenderSystemCapabilities::setNumMultiRenderTargets(unsigned short num)

unsigned short
RenderSystemCapabilities::getNumWorldMatricies()

unsigned short
RenderSystemCapabilities::getNumTextureUnits()

unsigned short
RenderSystemCapabilities::getStencilBufferBitDepth()

unsigned short
RenderSystemCapabilities::numVertexBlendMatrices()

unsigned short
RenderSystemCapabilities::numMultiRenderTargets()

void
RenderSystemCapabilities::setCapability(int c)
  C_ARGS:
    (Capabilities)c

bool
RenderSystemCapabilities::hasCapability(int c)
  C_ARGS:
    (Capabilities)c

String
RenderSystemCapabilities::getMaxVertexProgramVersion()

String
RenderSystemCapabilities::getMaxFragmentProgramVersion()

unsigned short
RenderSystemCapabilities::getVertexProgramConstantFloatCount()

unsigned short
RenderSystemCapabilities::getVertexProgramConstantIntCount()

unsigned short
RenderSystemCapabilities::getVertexProgramConstantBoolCount()

unsigned short
RenderSystemCapabilities::getFragmentProgramConstantFloatCount()

unsigned short
RenderSystemCapabilities::getFragmentProgramConstantIntCount()

unsigned short
RenderSystemCapabilities::getFragmentProgramConstantBoolCount()

void
RenderSystemCapabilities::setMaxVertexProgramVersion(String ver)

void
RenderSystemCapabilities::setMaxFragmentProgramVersion(String ver)

void
RenderSystemCapabilities::setVertexProgramConstantFloatCount(unsigned short c)

void
RenderSystemCapabilities::setVertexProgramConstantIntCount(unsigned short c)

void
RenderSystemCapabilities::setVertexProgramConstantBoolCount(unsigned short c)

void
RenderSystemCapabilities::setFragmentProgramConstantFloatCount(unsigned short c)

void
RenderSystemCapabilities::setFragmentProgramConstantIntCount(unsigned short c)

void
RenderSystemCapabilities::setFragmentProgramConstantBoolCount(unsigned short c)

void
RenderSystemCapabilities::setMaxPointSize(Real s)

Real
RenderSystemCapabilities::getMaxPointSize()

void
RenderSystemCapabilities::setNonPOW2TexturesLimited(bool l)

bool
RenderSystemCapabilities::getNonPOW2TexturesLimited()

void
RenderSystemCapabilities::setNumVertexTextureUnits(unsigned short n)

unsigned short
RenderSystemCapabilities::getNumVertexTextureUnits()

void
RenderSystemCapabilities::setVertexTextureUnitsShared(bool shared)

bool
RenderSystemCapabilities::getVertexTextureUnitsShared()

void
RenderSystemCapabilities::log(Log *pLog)
