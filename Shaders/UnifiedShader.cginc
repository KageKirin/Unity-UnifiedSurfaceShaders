//! Unified Surface Shader
//! common header
//!
//! UNISS_

//! defines lighting functions
//! half4 UnissLighting_Forward(SurfaceOutput s, half3 lightDir, half atten); //This is used in forward rendering path
//! for light models that are not view direction dependent (e.g. diffuse).
//! half4 UnissLighting_Forward_ViewDir(SurfaceOutput s, half3 lightDir, half3 viewDir, half atten); //This is used in
//! forward rendering path for light models that are view direction dependent.
//! half4 UnissLighting_PrePass(SurfaceOutput s, half4 light); //This is used in deferred lighting path.
//! half4 UnissLighting_SingleLightmap(SurfaceOutput s, fixed4 color); //This is used for light models that are not view
//! direction dependent (e.g. diffuse).
//! half4 UnissLighting_SingleLightmap_ViewDir(SurfaceOutput s, fixed4 color, half3 viewDir); //This is used for light
//! models that are view direction dependent.
//! half4 UnissLighting_DualLightmap(SurfaceOutput s, fixed4 totalColor, fixed4 indirectOnlyColor, half indirectFade);
//! //This is used for light models that are not view direction dependent (e.g. diffuse).
//! half4 UnissLighting_DualLightmap_ViewDir(SurfaceOutput s, fixed4 totalColor, fixed4 indirectOnlyColor, half
//! indirectFade, half3 viewDir); //This is used for light models that are view direction dependent.
//! half4 UnissLighting_DirLightmap(SurfaceOutput s, fixed4 color, fixed4 scale, bool surfFuncWritesNormal); //This is
//! used for light models that are not view direction dependent (e.g. diffuse).
//! half4 UnissLighting_DirLightmap_ViewDir(SurfaceOutput s, fixed4 color, fixed4 scale, half3 viewDir, bool
//! surfFuncWritesNormal, out half3 specColor); //This is used for light models that are view direction dependent.
//! half4 UnissLighting_GlobalIllumination(SurfaceOutput s, half3 lightDir, UnityGI gi); //Global Illumination version


#ifdef UNISS_STANDARD
#define UnissOutput SurfaceOutputStandard

#define __UnissLighting_Forward                 LightingStandard
#define __UnissLighting_Forward_ViewDir         LightingStandard
#define __UnissLighting_PrePass                 LightingStandard_PrePass
#define __UnissLighting_SingleLightmap          LightingStandard_SingleLightmap
#define __UnissLighting_SingleLightmap_ViewDir  LightingStandard_SingleLightmap
#define __UnissLighting_DualLightmap            LightingStandard_DualLightmap
#define __UnissLighting_DualLightmap_ViewDir    LightingStandard_DualLightmap
#define __UnissLighting_DirLightmap             LightingStandard_DirLightmap
#define __UnissLighting_DirLightmap_ViewDir     LightingStandard_DirLightmap
#define __UnissLighting_GlobalIllumination      LightingStandard

#endif //UNISS_STANDARD

#ifdef UNISS_STANDARD_SPECULAR
#define UnissOutput SurfaceOutputStandardSpecular

#define __UnissLighting_Forward                 LightingStandardSpecular
#define __UnissLighting_Forward_ViewDir         LightingStandardSpecular
#define __UnissLighting_PrePass                 LightingStandardSpecular_PrePass
#define __UnissLighting_SingleLightmap          LightingStandardSpecular_SingleLightmap
#define __UnissLighting_SingleLightmap_ViewDir  LightingStandardSpecular_SingleLightmap
#define __UnissLighting_DualLightmap            LightingStandardSpecular_DualLightmap
#define __UnissLighting_DualLightmap_ViewDir    LightingStandardSpecular_DualLightmap
#define __UnissLighting_DirLightmap             LightingStandardSpecular_DirLightmap
#define __UnissLighting_DirLightmap_ViewDir     LightingStandardSpecular_DirLightmap
#define __UnissLighting_GlobalIllumination      LightingStandardSpecular

#endif //UNISS_STANDARD_SPECULAR

#ifdef UNISS_LAMBERT
#define UnissOutput SurfaceOutput

#define __UnissLighting_Forward                 LightingLambert
#define __UnissLighting_Forward_ViewDir         LightingLambert
#define __UnissLighting_PrePass                 LightingLambert_PrePass
#define __UnissLighting_SingleLightmap          LightingLambert_SingleLightmap
#define __UnissLighting_SingleLightmap_ViewDir  LightingLambert_SingleLightmap
#define __UnissLighting_DualLightmap            LightingLambert_DualLightmap
#define __UnissLighting_DualLightmap_ViewDir    LightingLambert_DualLightmap
#define __UnissLighting_DirLightmap             LightingLambert_DirLightmap
#define __UnissLighting_DirLightmap_ViewDir     LightingLambert_DirLightmap
#define __UnissLighting_GlobalIllumination      LightingLambert

#endif //UNISS_LAMBERT

#ifdef UNISS_BLINNPHONG
#define UnissOutput SurfaceOutput

#define __UnissLighting_Forward                 LightingBlinnPhong
#define __UnissLighting_Forward_ViewDir         LightingBlinnPhong
#define __UnissLighting_PrePass                 LightingBlinnPhong_PrePass
#define __UnissLighting_SingleLightmap          LightingBlinnPhong_SingleLightmap
#define __UnissLighting_SingleLightmap_ViewDir  LightingBlinnPhong_SingleLightmap
#define __UnissLighting_DualLightmap            LightingBlinnPhong_DualLightmap
#define __UnissLighting_DualLightmap_ViewDir    LightingBlinnPhong_DualLightmap
#define __UnissLighting_DirLightmap             LightingBlinnPhong_DirLightmap
#define __UnissLighting_DirLightmap_ViewDir     LightingBlinnPhong_DirLightmap
#define __UnissLighting_GlobalIllumination      LightingBlinnPhong

#endif //UNISS_BLINNPHONG




// 2-step indirection for better control
#ifdef OVERRIDE_UnissLighting_Forward
#define UnissLighting_Forward __UnissLighting_Forward
#endif	// OVERRIDE_UnissLighting_Forward

#ifdef OVERRIDE_UnissLighting_Forward_ViewDir
#define UnissLighting_Forward_ViewDir __UnissLighting_Forward_ViewDir
#endif	// OVERRIDE_UnissLighting_Forward_ViewDir

#ifdef OVERRIDE_UnissLighting_PrePass
#define UnissLighting_PrePass __UnissLighting_PrePass
#endif	// OVERRIDE_UnissLighting_PrePass

#ifdef OVERRIDE_UnissLighting_SingleLightmap
#define UnissLighting_SingleLightmap __UnissLighting_SingleLightmap
#endif	// OVERRIDE_UnissLighting_SingleLightmap

#ifdef OVERRIDE_UnissLighting_SingleLightmap_ViewDir
#define UnissLighting_SingleLightmap_ViewDir __UnissLighting_SingleLightmap_ViewDir
#endif	// OVERRIDE_UnissLighting_SingleLightmap_ViewDir

#ifdef OVERRIDE_UnissLighting_DualLightmap
#define UnissLighting_DualLightmap __UnissLighting_DualLightmap
#endif	// OVERRIDE_UnissLighting_DualLightmap

#ifdef OVERRIDE_UnissLighting_DualLightmap_ViewDir
#define UnissLighting_DualLightmap_ViewDir __UnissLighting_DualLightmap_ViewDir
#endif	// OVERRIDE_UnissLighting_DualLightmap_ViewDir

#ifdef OVERRIDE_UnissLighting_DirLightmap
#define UnissLighting_DirLightmap __UnissLighting_DirLightmap
#endif	// OVERRIDE_UnissLighting_DirLightmap

#ifdef OVERRIDE_UnissLighting_DirLightmap_ViewDir
#define UnissLighting_DirLightmap_ViewDir __UnissLighting_DirLightmap_ViewDir
#endif	// OVERRIDE_UnissLighting_DirLightmap_ViewDir

#ifdef OVERRIDE_UnissLighting_GlobalIllumination
#define UnissLighting_GlobalIllumination __UnissLighting_GlobalIllumination
#endif	// OVERRIDE_UnissLighting_GlobalIllumination
