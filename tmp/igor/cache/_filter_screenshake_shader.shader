//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, 0.0, 1.0);
    gl_Position = object_space_pos;
        
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~
//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;

uniform vec2 gm_pSurfaceDimensions;
uniform float gm_pTime;

uniform sampler2D g_NoiseTexture;
uniform vec2 g_NoiseTextureDimensions;
uniform float g_Magnitude;
uniform float g_ShakeSpeed;

vec2 noise2D(vec2 _in)
{
	return texture2D( g_NoiseTexture, _in ).xy;
}

void main()
{
	vec2 noiseCoords;
	noiseCoords.x = fract((g_ShakeSpeed * 60.0) / g_NoiseTextureDimensions.x);	
	noiseCoords.y = 0.5 / g_NoiseTextureDimensions.y;		// stick to top line just now	
	
	vec2 offset = noise2D(noiseCoords);
	offset = ((offset - 0.5) * 2.0 * g_Magnitude) / gm_pSurfaceDimensions;	
	
	gl_FragColor = texture2D( gm_BaseTexture, v_vTexcoord + offset);
}

