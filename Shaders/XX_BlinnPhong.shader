Shader "UnifiedShader/XX_BlinnPhong"
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
#pragma surface surfaceFunction BlinnPhong finalcolor:finalColor
#define UNISS_BLINNPHONG 1
#include "XX_Core.cginc"
		ENDCG
	}
	Fallback "Diffuse"
}
