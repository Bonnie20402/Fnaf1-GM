// Draw Event
shader_set(shader_office); // Assuming "myShader" is the name of the shader resource

// Set shader variables
var u_time = shader_get_uniform(shader_office,"u_time");
var u_scrollSpeed = shader_get_uniform(shader_office,"u_scrollSpeed");
shader_set_uniform_f(u_time, shader_get_time(shader_office)); // Use shader_get_time to get the elapsed time
shader_set_uniform_f(u_scrollSpeed, 0.1); // You can adjust the scroll speed

// Draw your object here

shader_reset(); // Reset the shader
