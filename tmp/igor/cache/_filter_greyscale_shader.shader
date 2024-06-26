//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, 0.0, 1.0);
    gl_Position = object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~
//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float g_Intensity;

float YUVval(vec4 _rgb)
{
	return dot(vec3(0.299, 0.587, 0.114), _rgb.rgb);
}

void main()
{
	vec4 texcol = texture2D( gm_BaseTexture, v_vTexcoord );
	float greyval = YUVval(texcol);	
	vec3 greyCol = vec3(greyval,greyval,greyval);
	vec3 finalCol = mix(texcol.rgb,greyCol, g_Intensity);
    gl_FragColor = vec4(finalCol, texcol.a);
}

