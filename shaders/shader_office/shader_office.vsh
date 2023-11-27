// Vertex shader
attribute vec2 in_Position;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;

uniform mat4 modelview_matrix;
uniform mat4 projection_matrix;

void main()
{
    gl_Position = projection_matrix * modelview_matrix * vec4(in_Position.x, in_Position.y, 0.0, 1.0);
    v_vTexcoord = in_TextureCoord;
}