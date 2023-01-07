#pragma once
#include <vector>
#include <memory>
#include "../my_thread.hpp"
#include "imgui/imgui.h"
#include "imgui/imgui_impl_glut.h"
#include "imgui/imgui_impl_opengl2.h"
#include "plot_window.hpp"

class GuiThread : public MyThread{
	public:
		static GuiThread* currentInstance;
		static void drawCallback(){ currentInstance->draw(); }
		GuiThread();
		~GuiThread(){stop();join();};
		void draw();
		void my_display_code();
		void run();
		void stop();
		std::vector<std::shared_ptr<PlotWindow>> m_windows;

bool show_demo_window;
bool show_another_window ;
ImVec4 clear_color;




};
