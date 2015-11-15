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

 //This is used in forward rendering path for light models that are not view direction dependent (e.g. diffuse).
half4 UnissLighting_Forward(SurfaceOutput s, half3 lightDir, half atten);
{
  return half4(0,1,0,1);
}

 //This is used in forward rendering path for light models that are view direction dependent.
half4 UnissLighting_Forward_ViewDir(SurfaceOutput s, half3 lightDir, half3 viewDir, half atten);
{
  return half4(0,1,0,1);
}

 //This is used in deferred lighting path.
half4 UnissLighting_PrePass(SurfaceOutput s, half4 light);
{
  return half4(0,1,0,1);
}

 //This is used for light models that are not view direction dependent (e.g. diffuse).
half4 UnissLighting_SingleLightmap(SurfaceOutput s, fixed4 color);
{
  return half4(0,1,0,1);
}

 //This is used for light models that are view direction dependent.
half4 UnissLighting_SingleLightmap_ViewDir(SurfaceOutput s, fixed4 color, half3 viewDir);
{
  return half4(0,1,0,1);
}

 //This is used for light models that are not view direction dependent (e.g. diffuse).
half4 UnissLighting_DualLightmap(SurfaceOutput s, fixed4 totalColor, fixed4 indirectOnlyColor, half indirectFade);
{
  return half4(0,1,0,1);
}

 //This is used for light models that are view direction dependent.
half4 UnissLighting_DualLightmap_ViewDir(SurfaceOutput s, fixed4 totalColor, fixed4 indirectOnlyColor, half indirectFade, half3 viewDir);
{
  return half4(0,1,0,1);
}

 //This is used for light models that are not view direction dependent (e.g. diffuse).
half4 UnissLighting_DirLightmap(SurfaceOutput s, fixed4 color, fixed4 scale, bool surfFuncWritesNormal);
{
  return half4(0,1,0,1);
}

 //This is used for light models that are view direction dependent.
half4 UnissLighting_DirLightmap_ViewDir(SurfaceOutput s, fixed4 color, fixed4 scale, half3 viewDir, bool surfFuncWritesNormal, out half3 specColor);
{
  return half4(0,1,0,1);
}

 //Global Illumination version
half4 UnissLighting_GlobalIllumination(SurfaceOutput s, half3 lightDir, UnityGI gi);
{
  return half4(0,1,0,1);
}
