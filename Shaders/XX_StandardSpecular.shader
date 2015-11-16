Shader "UnifiedShader/XX_StandardSpecular"
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
#pragma surface surfaceFunction StandardSpecular finalcolor:finalColor
#define UNISS_STANDARD_SPECULAR 1
#include "XX_Core.cginc"
		ENDCG
	}
	Fallback "Diffuse"
}
