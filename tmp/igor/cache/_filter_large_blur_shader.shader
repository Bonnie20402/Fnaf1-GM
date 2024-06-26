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

uniform sampler2D g_NoiseTexture;
uniform vec2 g_NoiseTextureDimensions;
uniform float g_Radius;

// Annoyingly the number of samples has to be fixed to be compatible across platforms
#define NUM_SAMPLES	32.0

vec2 noise2D(vec2 _in)
{
	//vec2 newNoise = fract(_in + texture2D( g_NoiseTexture, _in ).xy);
	//return newNoise;
	return texture2D( g_NoiseTexture, _in ).xy;
}

void main()
{
	vec2 noiseCoords;
	noiseCoords = fract((v_vTexcoord * gm_pSurfaceDimensions) / g_NoiseTextureDimensions);
		
	vec4 accumcol = vec4(0.0,0.0,0.0,0.0);
	
	for(float s = 0.0; s < NUM_SAMPLES; s++)
	{
		noiseCoords = noise2D(noiseCoords);		
		vec2 sampleCoords = v_vTexcoord + (((noiseCoords - 0.5) * 4.0 * g_Radius) / gm_pSurfaceDimensions);		
		accumcol += texture2D( gm_BaseTexture, sampleCoords );
	}
	
	gl_FragColor = accumcol / NUM_SAMPLES;
}

