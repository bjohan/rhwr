#pragma once
#include <vector>
#include <memory>
#include "../my_thread.hpp"
#include "imgui/imgui.h"
#include "imgui/imgui_impl_glut.h"
#include "imgui/imgui_impl_opengl2.h"
#include "plot_window.hpp"
#include <iostream>

class GuiThread : public MyThread{
	public:
		static GuiThread* currentInstance;
		static void drawCallback(){ currentInstance->draw(); };
		GuiThread();
		~GuiThread(){stop(); join(); std::cout << "Guithread detructor" << std::endl;};
		void draw();
		void displayQueue(std::shared_ptr<ThreadSafeQueue<std::shared_ptr<std::vector<std::complex<int8_t>>>>> q); 
		void my_display_code();
		void start();
		void run();
		void stop();
		std::vector<std::shared_ptr<PlotWindow>> m_windows;
		ThreadSafeQueue<std::shared_ptr<ThreadSafeQueue<std::shared_ptr<std::vector<std::complex<int8_t>>>>>> m_requestQueue;
	private:
		
		bool m_running;

};
