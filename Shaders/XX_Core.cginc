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

void finalColor(Input IN, UnissOutput o, inout fixed4 color)
{
  
}
