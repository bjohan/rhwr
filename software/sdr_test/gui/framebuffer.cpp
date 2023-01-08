#include <stdexcept>
#include <GL/glew.h>
#include <iostream>
#include "framebuffer.hpp"

Framebuffer::Framebuffer(size_t width, size_t height):m_width(width), m_height(height){
	glGenFramebuffers(1, &m_framebufferId);
	glGenTextures(1, &m_colorbufferId);
	glGenRenderbuffers(1, &m_depthbufferId);

	GLint prevId;
	glGetIntegerv(GL_FRAMEBUFFER_BINDING, &prevId);		
	bind();

	glBindTexture(GL_TEXTURE_2D, m_colorbufferId);

	glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, m_width, m_height, 0, GL_RGBA, GL_UNSIGNED_BYTE, NULL);

	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glFramebufferTexture2D(GL_DRAW_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, m_colorbufferId, 0);

	glBindRenderbuffer(GL_RENDERBUFFER, m_depthbufferId);
	glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT24, m_width, m_height);
	glFramebufferRenderbuffer(GL_DRAW_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, m_depthbufferId);

	switch(glCheckFramebufferStatus(GL_FRAMEBUFFER)){
		case GL_FRAMEBUFFER_COMPLETE:
			break;
		case GL_FRAMEBUFFER_UNSUPPORTED:	
			throw std::runtime_error("Unsupported framebuffer format"); break;
		default:
			throw std::runtime_error("Unable to create framebuffer"); break;
	}

	glBindFramebuffer(GL_FRAMEBUFFER, prevId);
	std::cout << "Created framebuffer" << std::endl;
}

Framebuffer::~Framebuffer(){
	std::cout << "Deleting framebuffer" << std::endl;
	glDeleteFramebuffers(1, &m_framebufferId);
	glDeleteTextures(1, &m_colorbufferId);
	glDeleteTextures(1, &m_depthbufferId);
}

void Framebuffer::renderTo(){
	glGetIntegerv(GL_FRAMEBUFFER_BINDING, &m_previousFramebuffer);
	glGetIntegerv(GL_TEXTURE_2D, &m_previousTexture);
	glBindTexture(GL_TEXTURE_2D, 0);
	glEnable(GL_TEXTURE_2D);
	glBindFramebuffer(GL_FRAMEBUFFER, m_framebufferId);
	glViewport(0,0, m_width, m_height);
}

void Framebuffer::end(){
	glBindFramebuffer(GL_FRAMEBUFFER, m_previousFramebuffer);
	glBindTexture(GL_TEXTURE_2D, m_previousTexture);
}

void Framebuffer::bind(){
	glBindFramebuffer(GL_FRAMEBUFFER, m_framebufferId);
}
