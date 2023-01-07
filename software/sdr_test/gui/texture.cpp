#include "texture.hpp"

Texture::Texture(size_t width, size_t height):m_textureData(width*height*3, 0x1F), m_width(width), m_height(height){
	glGenTextures(1, &m_textureId);
	bind();
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	updateTextureData();
}

void Texture::bind(){
	glBindTexture(GL_TEXTURE_2D, m_textureId);
}


void Texture::updateTextureData(){
	glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, m_width, m_height, 0, GL_RGB, GL_UNSIGNED_BYTE, m_textureData.data());
}
