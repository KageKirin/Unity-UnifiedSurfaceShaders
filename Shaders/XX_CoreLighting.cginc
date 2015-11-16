//! XX_CoreLighting.cginc
//!
//! lighting function overrides

///-----------------------------------------------------------------------------
/// Forward lighting

#ifdef OVERRIDE_UnissLighting_Forward
 //This is used in forward rendering path for light models that are not view direction dependent (e.g. diffuse).
half4 UnissLighting_Forward(UnissOutput s, half3 lightDir, half atten)
{
	return max(0, dot(s.Normal, lightDir)) * atten;
}
#endif	// OVERRIDE_UnissLighting_Forward

#ifdef OVERRIDE_UnissLighting_Forward_ViewDir
 //This is used in forward rendering path for light models that are view direction dependent.
half4 UnissLighting_Forward_ViewDir(UnissOutput s, half3 lightDir, half3 viewDir, half atten)
{
	return max(0, dot(s.Normal, lightDir)) * atten;
}
#endif	// OVERRIDE_UnissLighting_Forward_ViewDir


///-----------------------------------------------------------------------------
/// Deferred (prepass) lighting

#ifdef OVERRIDE_UnissLighting_PrePass
 //This is used in deferred lighting path.
half4 UnissLighting_PrePass(UnissOutput s, half4 light)
{
	return return dot(s.Normal, light.xyz);
}
#endif	// OVERRIDE_UnissLighting_PrePass


///-----------------------------------------------------------------------------
/// Single lightmap

#ifdef OVERRIDE_UnissLighting_SingleLightmap
 //This is used for light models that are not view direction dependent (e.g. diffuse).
half4 UnissLighting_SingleLightmap(UnissOutput s, fixed4 color)
{
	half3 lm = DecodeLightmap(color);
	return half4(lm, 0);
}
#endif	// OVERRIDE_UnissLighting_SingleLightmap

#ifdef OVERRIDE_UnissLighting_SingleLightmap_ViewDir
 //This is used for light models that are view direction dependent.
half4 UnissLighting_SingleLightmap_ViewDir(UnissOutput s, fixed4 color, half3 viewDir)
{
	half3 lm = DecodeLightmap(color);
	return half4(lm, 0);
}
#endif	// OVERRIDE_UnissLighting_SingleLightmap_ViewDir


///-----------------------------------------------------------------------------
/// Dual lightmap

#ifdef OVERRIDE_UnissLighting_DualLightmap
 //This is used for light models that are not view direction dependent (e.g. diffuse).
half4 UnissLighting_DualLightmap(UnissOutput s, fixed4 totalColor, fixed4 indirectOnlyColor, half indirectFade)
{
	half3 lm = lerp(DecodeLightmap(indirectOnlyColor), DecodeLightmap(totalColor), indirectFade);
	return half4(lm, 0);
}
#endif	// OVERRIDE_UnissLighting_DualLightmap

#ifdef OVERRIDE_UnissLighting_DualLightmap_ViewDir
 //This is used for light models that are view direction dependent.
half4 UnissLighting_DualLightmap_ViewDir(UnissOutput s, fixed4 totalColor, fixed4 indirectOnlyColor, half indirectFade, half3 viewDir)
{
	half3 lm = lerp(DecodeLightmap(indirectOnlyColor), DecodeLightmap(totalColor), indirectFade);
	return half4(lm, 0);
}
#endif	// OVERRIDE_UnissLighting_DualLightmap_ViewDir


/// Directional lightmaps

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

///-----------------------------------------------------------------------------
