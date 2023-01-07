#pragma once
#include <GL/freeglut.h>
#include <memory>
#include "texture.hpp"

class Framebuffer{
	public:
		Framebuffer(size_t width, size_t height);
		void bind();
		GLuint m_framebufferId;
		GLuint m_colorBufferId;
		GLuint m_depthBufferId;
		size_t m_width;
		size_t m_height;

};


