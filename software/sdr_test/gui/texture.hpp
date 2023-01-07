#pragma once
#include <GL/freeglut.h>
#include <vector>
class Texture{
	public:
		Texture(size_t width, size_t height);
		void bind();
		void updateTextureData();
		size_t m_width;
		size_t m_height;
		GLuint m_textureId;
		std::vector<char> m_textureData;
};
