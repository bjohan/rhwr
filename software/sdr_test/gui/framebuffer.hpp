#pragma once
#include <GL/freeglut.h>
#include <memory>
#include "texture.hpp"

class Framebuffer{
	public:
		Framebuffer(size_t width, size_t height);
		~Framebuffer();
		void renderTo();
		void end();
		void bind();
		GLuint m_framebufferId;
		GLuint m_colorbufferId;
		GLuint m_depthbufferId;
		size_t m_width;
		size_t m_height;

	private:
		GLint m_previousFramebuffer;
		GLint m_previousTexture;

};


