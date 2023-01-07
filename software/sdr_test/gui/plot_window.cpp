#include "plot_window.hpp"

PlotWindow::PlotWindow(std::string name): m_name(name), m_plotImg(Texture(512, 256)), m_framebuffer(Framebuffer(512, 256)){
	m_framebuffer.render();
}

void PlotWindow::renderImgui(){
        ImGui::Begin(m_name.c_str());                          // Create a window called "Hello, world!" and append into it.
        ImGui::Text("This is some useful text.");               // Display some text (you can use a format strings too)
	ImGui::Image((void*)(intptr_t) m_plotImg.m_textureId, ImVec2(m_plotImg.m_width, m_plotImg.m_height));
	ImGui::Image((void*)(intptr_t) m_framebuffer.m_colorbufferId, ImVec2(m_framebuffer.m_width, m_framebuffer.m_height), ImVec2(0,1), ImVec2(1,0));
        ImGui::End();
}
