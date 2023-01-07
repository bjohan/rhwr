#pragma once
#include <string>
#include "imgui/imgui.h"
#include "texture.hpp"
#include "framebuffer.hpp"

class PlotWindow{
	public:
		PlotWindow(std::string name);
		void renderImgui();
	private:
		std::string m_name;
		Texture m_plotImg;
		Framebuffer m_framebuffer;
};

