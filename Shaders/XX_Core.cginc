#include "UnifiedShader.cginc"

struct Input
{
  float2 uv_Albedo;
  float2 uv_NormalMap;
  float3 viewDir;
};

sampler2D _Albedo;
sampler2D _NormalMap;

void surfaceFunction(Input IN, inout UnissOutput s)
{
  s.Albedo = tex2D(_Albedo, IN.uv_Albedo).rgb;
  s.Normal = UnpackNormal(tex2D(_NormalMap, IN.uv_NormalMap));
}

void finalColor(Input IN, UnissOutput s, inout fixed4 color)
{
}



/////

#ifdef OVERRIDE_UnissLighting_Forward
 //This is used in forward rendering path for light models that are not view direction dependent (e.g. diffuse).
half4 UnissLighting_Forward(UnissOutput s, half3 lightDir, half atten)
{
  return half4(0,1,0,1);
}
#endif	// OVERRIDE_UnissLighting_Forward

#ifdef OVERRIDE_UnissLighting_Forward_ViewDir
 //This is used in forward rendering path for light models that are view direction dependent.
half4 UnissLighting_Forward_ViewDir(UnissOutput s, half3 lightDir, half3 viewDir, half atten)
{
  return half4(0,1,0,1);
}
#endif	// OVERRIDE_UnissLighting_Forward_ViewDir

#ifdef OVERRIDE_UnissLighting_PrePass
 //This is used in deferred lighting path.
half4 UnissLighting_PrePass(UnissOutput s, half4 light)
{
  return half4(0,1,0,1);
}
#endif	// OVERRIDE_UnissLighting_PrePass

#ifdef OVERRIDE_UnissLighting_SingleLightmap
 //This is used for light models that are not view direction dependent (e.g. diffuse).
half4 UnissLighting_SingleLightmap(UnissOutput s, fixed4 color)
{
  return half4(0,1,0,1);
}
#endif	// OVERRIDE_UnissLighting_SingleLightmap

#ifdef OVERRIDE_UnissLighting_SingleLightmap_ViewDir
 //This is used for light models that are view direction dependent.
half4 UnissLighting_SingleLightmap_ViewDir(UnissOutput s, fixed4 color, half3 viewDir)
{
  return half4(0,1,0,1);
}
#endif	// OVERRIDE_UnissLighting_SingleLightmap_ViewDir

#ifdef OVERRIDE_UnissLighting_DualLightmap
 //This is used for light models that are not view direction dependent (e.g. diffuse).
half4 UnissLighting_DualLightmap(UnissOutput s, fixed4 totalColor, fixed4 indirectOnlyColor, half indirectFade)
{
  return half4(0,1,0,1);
}
#endif	// OVERRIDE_UnissLighting_DualLightmap

#ifdef OVERRIDE_UnissLighting_DualLightmap_ViewDir
 //This is used for light models that are view direction dependent.
half4 UnissLighting_DualLightmap_ViewDir(UnissOutput s, fixed4 totalColor, fixed4 indirectOnlyColor, half indirectFade, half3 viewDir)
{
  return half4(0,1,0,1);
}
#endif	// OVERRIDE_UnissLighting_DualLightmap_ViewDir

#ifdef OVERRIDE_UnissLighting_DirLightmap
 //This is used for light models that are not view direction dependent (e.g. diffuse).
half4 UnissLighting_DirLightmap(UnissOutput s, fixed4 color, fixed4 scale, bool surfFuncWritesNormal)
{
  return half4(0,1,0,1);
}
#endif	// OVERRIDE_UnissLighting_DirLightmap

#ifdef OVERRIDE_UnissLighting_DirLightmap_ViewDir
 //This is used for light models that are view direction dependent.
half4 UnissLighting_DirLightmap_ViewDir(UnissOutput s, fixed4 color, fixed4 scale, half3 viewDir, bool surfFuncWritesNormal, out half3 specColor)
{
  return half4(0,1,0,1);
}
#endif	// OVERRIDE_UnissLighting_DirLightmap_ViewDir

#ifdef OVERRIDE_UnissLighting_GlobalIllumination
 //Global Illumination version
half4 UnissLighting_GlobalIllumination(UnissOutput s, half3 lightDir, UnityGI gi)
{
  return half4(0,1,0,1);
}
#endif	// OVERRIDE_UnissLighting_GlobalIllumination
