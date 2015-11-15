# Unified Surface Shaders
for Unity

($count+1)th attempt to avoid writing redundant and hard to maintain shader code
for unity surface shaders.

## Installation

`git clone` then drop into assets folder.  
Rename XX_something.shader to your needs.  
Don't forget change the `#include "XX_Core.cginc"`.

## Why and how

Implementing surface shaders that follow the same rules, just flow through another render path in Unity
usually requires to write a lot of tedious repetitive code.

But since we have a full C-preprocessor to our use, we can unify our different shader versions into a single file
and split out the differences via preprocessor conditionals.

In this code, we have
- XX_Core.cginc which will include the full surface function,
  lighting function and finalColor function implementations,  
- XX_Lambert, XX_BlinnPhong which contain the non-PBR surface shaders
- XX_Standard and XX_StandardSpecular which contain the the PBR surface shaders
- UnifiedShader.cginc which we use to `#define` the specific function and parameter names
  with a unified naming convention, used by XX_Core.cginc to implement,
  and by the shader interfaces to define each shader's entry points.

## Non-unified parts

I haven't found out yet, how to avoid having to re-declare
the shader uniform inputs (textures, mostly)
in each shader interface file (.shader).
