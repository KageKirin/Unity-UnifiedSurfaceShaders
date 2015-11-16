#include "UnifiedShader.cginc"
#include "UnityCG.cginc"

struct Input
{
	float2 uv_Albedo;
	float2 uv_NormalMap;
	float3 viewDir;
	INTERNAL_DATA
};

sampler2D _Albedo;
sampler2D _NormalMap;

void surfaceFunction(Input IN, inout UnissOutput s)
{
	//albedo + spec
	fixed4 albedoColor = tex2D(_Albedo, IN.uv_Albedo);
	s.Albedo = albedoColor.rgb;

#if UNISS_LAMBERT || UNISS_BLINNPHONG || UNISS_STANDARD_SPECULAR
	s.Specular = albedoColor.a;
#endif //UNISS_LAMBERT || UNISS_BLINNPHONG || UNISS_STANDARD_SPECULAR

	//normal
	s.Normal = normalize(UnpackNormal(tex2D(_NormalMap, IN.uv_NormalMap)));

	//emission
	s.Emission = fixed3(0);

	//alpha
	s.Alpha = 0;

#if UNISS_LAMBERT || UNISS_BLINNPHONG
	s.Gloss = 1;
#endif //UNISS_LAMBERT || UNISS_BLINNPHONG

#if UNISS_STANDARD
	s.Metallic = 0;
#endif //UNISS_STANDARD

#if UNISS_STANDARD || UNISS_STANDARD_SPECULAR
	s.Smoothness = 0.2;
	s.Occlusion = 1;
#endif //UNISS_STANDARD || UNISS_STANDARD_SPECULAR
}


/// final color modifier
void finalColor(Input IN, UnissOutput s, inout fixed4 color)
{
	//color.rgb *= fixed3(0,1,1);
}



#include "XX_CoreLighting.cginc"
