#ifndef STRUCTS_HPP
#define STRUCTS_HPP

#include <map>
#include <glbinding/gl/gl.h>
#include <pixel_data.hpp>
// use gl definitions from glbinding
using namespace gl;

// gpu representation of model
struct model_object {
  // vertex array object
  GLuint vertex_AO = 0;
  // vertex buffer object
  GLuint vertex_BO = 0;
  // index buffer object
  GLuint element_BO = 0;
  // primitive type to draw
  GLenum draw_mode = GL_NONE;
  // indices number, if EBO exists
  GLsizei num_elements = 0;
};

struct texture{
  texture(std::string name, pixel_data pixelData)
    :m_name{name}
    ,m_pixelData{pixelData}
    {}

    std::string m_name;
    pixel_data m_pixelData;
};

// gpu representation of texture
struct texture_object {
  // handle of texture object
  GLuint handle = 0;
  // binding point
  GLenum target = GL_NONE;
};

// shader handle and uniform storage
struct shader_program {
  shader_program(std::map<GLenum, std::string> paths)
   :shader_paths{paths}
   ,handle{0}
   {}

  // paths to shader sources
  std::map<GLenum, std::string> shader_paths;
  // object handle
  GLuint handle;
  // uniform locations mapped to name
  std::map<std::string, GLint> u_locs{};
};
#endif
