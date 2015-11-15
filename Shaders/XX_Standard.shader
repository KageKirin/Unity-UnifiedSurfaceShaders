Shader "UnifiedShader/XX_Standard" {
    Properties {
      _Albedo ("Texture", 2D) = "white" {}
      _NormalMap ("Bumpmap", 2D) = "bump" {}
    }
    SubShader {
      Tags { "RenderType" = "Opaque" }
      CGPROGRAM
      #pragma surface surfaceFunction Standard finalcolor:finalColor
      #define UNISS_STANDARD 1
      #include "XX_Core.cginc"
      ENDCG
    }
    Fallback "Diffuse"
  }
