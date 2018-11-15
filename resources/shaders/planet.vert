#version 150
#extension GL_ARB_explicit_attrib_location : require
// vertex attributes of VAO
layout(location = 0) in vec3 in_Position;
layout(location = 1) in vec3 in_Normal;


//Matrix Uniforms as specified with glUniformMatrix4fv
uniform mat4 ModelMatrix;
uniform mat4 ViewMatrix;
uniform mat4 ProjectionMatrix;
uniform mat4 NormalMatrix;
uniform vec3 Planet_Color;

out vec3 pass_Normal;
out vec3 pass_Color;
out  vec3 pass_light_pos;
out  vec3 pass_frag_pos;
out  vec3 pass_cam_pos;
void main(void)
{
	gl_Position = (ProjectionMatrix  * ViewMatrix * ModelMatrix) * vec4(in_Position, 1.0);
	pass_Normal = (ProjectionMatrix  * ViewMatrix * ModelMatrix* NormalMatrix * vec4(in_Normal, 0.0)).xyz;
	pass_Color = Planet_Color;
	pass_light_pos= ((ProjectionMatrix  * ViewMatrix ) * vec4(0.0,0.0,0.0,1.0)).xyz;
	pass_frag_pos= ((ProjectionMatrix  * ViewMatrix * ModelMatrix) * vec4(in_Position, 1.0)).xyz;
	pass_cam_pos= (ViewMatrix* vec4(0.0,0.0,0.0,0.0)).xyz;
}