Shader "UnifiedShader/XX_StandardSpecular"
{
	Properties
	{
		_Albedo("Texture", 2D) = "white" {}
		_NormalMap("Bumpmap", 2D) = "bump" {}
	}
	SubShader
	{
		Tags
		{
			"RenderType" = "Opaque"
		}
		CGPROGRAM
#pragma surface surfaceFunction StandardSpecular finalcolor:finalColor
#pragma debug
#define UNISS_STANDARD_SPECULAR 1
#define OVERRIDE_UnissLighting_Forward 1
#define OVERRIDE_UnissLighting_Forward_ViewDir 1
//#define OVERRIDE_UnissLighting_PrePass 1
#define OVERRIDE_UnissLighting_SingleLightmap 1
#define OVERRIDE_UnissLighting_SingleLightmap_ViewDir 1
#define OVERRIDE_UnissLighting_DualLightmap 1
#define OVERRIDE_UnissLighting_DualLightmap_ViewDir 1
#define OVERRIDE_UnissLighting_DirLightmap 1
#define OVERRIDE_UnissLighting_DirLightmap_ViewDir 1
//#define OVERRIDE_UnissLighting_GlobalIllumination 1
#include "XX_Core.cginc"
		ENDCG
	}
	Fallback "Diffuse"
}
