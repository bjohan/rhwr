#include <stdexcept>
#include <GL/glew.h>
#include <iostream>
#include "framebuffer.hpp"

Framebuffer::Framebuffer(size_t width, size_t height):m_width(width), m_height(height){
	glGenFramebuffers(1, &m_framebufferId);
	bind();
	if(glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE){
		 std::cout<< "failed to bind fb" << std::endl;
		 std::runtime_error("Unable to create framebuffer");
	}
}

void Framebuffer::bind(){
	glBindFramebuffer(GL_FRAMEBUFFER, m_framebufferId);
}
