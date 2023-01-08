#include "plot_window.hpp"
#include <iostream>
#include "../aux_util.hpp"
#include <thread>

PlotWindow::PlotWindow(std::string name, std::shared_ptr<ThreadSafeQueue<std::shared_ptr<std::vector<std::complex<int8_t>>>>> q): m_name(name){
	m_q = q;
	m_rendered = 0;
	m_framebuffer = std::make_shared<Framebuffer>(512*2, 512*2);
	float const light_dir[]={1,1,1,0};
	float const light_color[]={1,0.95,0.9,1};
	//m_framebuffer.render();
	m_framebuffer->renderTo();

	glClearColor(1,1,1,0);
	glClear( GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT );

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluPerspective(45, 1, 1, 10);

	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();

	//glEnable(GL_LIGHT0);
	//glEnable(GL_LIGHTING);

	glEnable(GL_DEPTH_TEST);
	glDisable(GL_CULL_FACE);

	//glLightfv(GL_LIGHT0, GL_POSITION, light_dir);
	//glLightfv(GL_LIGHT0, GL_DIFFUSE, light_color);

	glTranslatef(0,0,-5);

	glutSolidTeapot(0.75);




	m_framebuffer->end();
}

PlotWindow::~PlotWindow(){
	std::cout << "Plotwindow dtor" << std::endl;
}

void PlotWindow::drawReal(complex_vector<float> &b){
	float delta = 2.0/b.size();
	float x=-1;
	float max = std::abs(complexVectorAbsMax(b));
	for(size_t i=0 ; i < b.size() ; i++){
		glVertex2f(x, b[i].real()/max);
		x+=delta;
	}
}

void PlotWindow::drawImag(complex_vector<float> &b){
	float delta = 2.0/b.size();
	float x=-1;
	float max = std::abs(complexVectorAbsMax(b));
	for(size_t i=0 ; i < b.size() ; i++){
		glVertex2f(x, b[i].imag()/max);
		x+=delta;
	}
}




void PlotWindow::updatePlot(std::shared_ptr<std::vector<std::complex<int8_t>>> v){
	//LifeTimer d("Draw graph");
	//std::this_thread::sleep_for(std::chrono::milliseconds(1));
	std::complex<float> max;
	complex_vector<float> fv = complexVectorConvert<float, int8_t>(*v);
	//std::cout << "signal max: " << std::abs(max) << std::endl;
	m_framebuffer->renderTo();

	glClearColor(1,1,1,1);
	glClear( GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT );

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	//gluPerspective(45, 1, 1, 10);
	gluOrtho2D(-1, 1, -1, 1);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();

	//glEnable(GL_LIGHT0);
	//glEnable(GL_LIGHTING);

	glEnable(GL_DEPTH_TEST);
	glDisable(GL_CULL_FACE);

	glColor4f(1,0,0,1);
	//glLightfv(GL_LIGHT0, GL_POSITION, light_dir);
	//glLightfv(GL_LIGHT0, GL_DIFFUSE, light_color);

	glLineWidth(1);
	glColor4f(0,1,0,1);
	glTranslatef(0,0,-5*0);
	
	/*glBegin(GL_LINES);
	drawReal(fv);
	glEnd();*/
	glColor4f(1,0,0,1);
	glBegin(GL_LINES);
	drawImag(fv);
	glEnd();

	m_framebuffer->end();
}

void PlotWindow::setSize(size_t w, size_t h){
	if(m_framebuffer->m_width != w || m_framebuffer->m_height !=h) m_framebuffer=std::make_shared<Framebuffer>(w, h);
}

void PlotWindow::renderImgui(){
	if(!m_q->empty()){
		updatePlot(m_q->get(std::chrono::nanoseconds(0)));
		m_rendered++;
	}
        ImGui::Begin(m_name.c_str());                          // Create a window called "Hello, world!" and append into it.
        ImGui::Text("FPS: %.2f rendered: %ld skipped:  %d in queue :%ld",ImGui::GetIO().Framerate, m_rendered, m_q->getRejected(), m_q->size());               // Display some text (you can use a format strings too)
	ImVec2 sz= ImGui::GetWindowSize();
	//setSize(sz.x, sz.y-20);
	ImGui::Image((void*)(intptr_t) m_framebuffer->m_colorbufferId, ImVec2(sz.x, sz.y), ImVec2(0,1), ImVec2(1,0));
        ImGui::End();
}
