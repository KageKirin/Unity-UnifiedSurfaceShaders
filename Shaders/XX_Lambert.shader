Shader "UnifiedShader/XX_Lambert"
{
	Properties
	{
		_Albedo("Texture", 2D) = "white"
		{
		}
		_NormalMap("Bumpmap", 2D) = "bump"
		{
		}
	}
	SubShader
	{
		Tags
		{
			"RenderType" = "Opaque"
		}
		CGPROGRAM
#pragma surface surfaceFunction Lambert finalcolor:finalColor
#define UNISS_LAMBERT 1
#include "XX_Core.cginc"
		ENDCG
	}
	Fallback "Diffuse"
}
