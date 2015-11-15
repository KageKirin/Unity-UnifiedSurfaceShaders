//! Unified Surface Shader
//! common header
//!
//! UNISS_


#ifdef UNISS_STANDARD
#define UnissOutput SurfaceOutputStandard
#endif //UNISS_STANDARD

#ifdef UNISS_STANDARD_SPECULAR
#define UnissOutput SurfaceOutputStandardSpecular
#endif //UNISS_STANDARD_SPECULAR

#ifdef UNISS_LAMBERT
#define UnissOutput SurfaceOutput
#endif //UNISS_LAMBERT

#ifdef UNISS_BLINNPHONG
#define UnissOutput SurfaceOutput
#endif //UNISS_BLINNPHONG
