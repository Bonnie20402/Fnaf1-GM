// Fragment shader
varying vec2 v_vTexcoord;

uniform float u_time;
uniform float u_scrollSpeed;

void main()
{
    vec2 uv = v_vTexcoord;
    
    // Adjust the scrolling speed and direction
    uv.x += u_time * u_scrollSpeed;
    
    // Wrap the texture to create a seamless scroll
    uv.x = mod(uv.x, 1.0);
    
    // Sample the texture
    vec4 color = texture2D(gm_BaseTexture, uv);
    
    gl_FragColor = color;
}