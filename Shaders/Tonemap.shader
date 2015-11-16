Shader "Example/Tonemapped Lightmap Decoding" {
				Properties {
						_MainTex ("Texture", 2D) = "white" {}
						_Gain ("Lightmap tone-mapping Gain", Float) = 1
						_Knee ("Lightmap tone-mapping Knee", Float) = 0.5
						_Compress ("Lightmap tone-mapping Compress", Float) = 0.33
				}
				SubShader {
						Tags { "RenderType" = "Opaque" }
						CGPROGRAM

						#pragma surface surf Tonemapped

						half4 LightingTonemapped (SurfaceOutput s, half3 lightDir, half atten) {
								half NdotL = dot (s.Normal, lightDir);
								half4 c; c.rgb = s.Albedo * _LightColor0.rgb * (NdotL * atten); c.a = s.Alpha;
								return c;
						}

						half _Gain;
						half _Knee;
						half _Compress;

						inline half3 TonemapLight (half3 i) {
								i *= _Gain;
								return (i > _Knee)? (((i - _Knee)*_Compress)+_Knee): i;
						}

						inline fixed4 LightingTonemapped_SingleLightmap (SurfaceOutput s, fixed4 color) {
								half3 lm = TonemapLight(DecodeLightmap (color));
								return fixed4(lm, 0);
						}

						inline fixed4 LightingTonemapped_DualLightmap (SurfaceOutput s, fixed4 totalColor, fixed4 indirectOnlyColor, half indirectFade) {
								half3 lm = TonemapLight(lerp (DecodeLightmap (indirectOnlyColor), DecodeLightmap (totalColor), indirectFade));
								return fixed4(lm, 0);
						}

						inline fixed4 LightingTonemapped_StandardLightmap (SurfaceOutput s, fixed4 color, fixed4 scale, bool surfFuncWritesNormal) {
								UNITY_DIRBASIS

								half3 lm = TonemapLight(DecodeLightmap (color));
								half3 scalePerBasisVector = DecodeLightmap (scale);

								if (surfFuncWritesNormal)
								{
										half3 normalInRnmBasis = saturate (mul (unity_DirBasis, s.Normal));
										lm *= dot (normalInRnmBasis, scalePerBasisVector);
								}

								return fixed4(lm, 0);
						}

						struct Input {
								float2 uv_MainTex;
						};

						sampler2D _MainTex;

						void surf (Input IN, inout SurfaceOutput o) {
								o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb;
						}
						ENDCG
				}
				Fallback "Diffuse"
		}
