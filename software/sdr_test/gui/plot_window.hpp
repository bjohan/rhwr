#pragma once
#include <string>
#include <vector>
#include <complex>
#include <memory>
#include "imgui/imgui.h"
#include "texture.hpp"
#include "framebuffer.hpp"
#include "../thread_safe_queue.hpp"
#include "../vector_operations.hpp"

class PlotWindow{
	public:
		PlotWindow(std::string name, std::shared_ptr<ThreadSafeQueue<std::shared_ptr<std::vector<std::complex<int8_t>>>>> q);
		~PlotWindow();
		void updatePlot(std::shared_ptr<std::vector<std::complex<int8_t>>> q);
		void setSize(size_t w, size_t h);
		void renderImgui();
		void drawReal(complex_vector<float> &v);
		void drawImag(complex_vector<float> &v);
	private:
		std::string m_name;
		std::shared_ptr<Framebuffer> m_framebuffer;
		std::shared_ptr<ThreadSafeQueue<std::shared_ptr<std::vector<std::complex<int8_t>>>>> m_q;
		size_t m_rendered;
};

