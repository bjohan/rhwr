#include <GL/glew.h>
#include <GL/glut.h>
#include "gui_thread.hpp"
#include <iostream>

GuiThread* GuiThread::currentInstance=NULL;

GuiThread::GuiThread():MyThread("Gui thread"), m_requestQueue(std::string("display request queue"), 0, std::chrono::milliseconds(100)){
}

void GuiThread::stop(){
	if(m_running){
		m_running=false;
		glutLeaveMainLoop();
	} else {
	}
}

void GuiThread::my_display_code(){
	for(shared_ptr<PlotWindow> w: m_windows){
		w->renderImgui();
	}

}

void GuiThread::draw(){

	if(!m_requestQueue.empty()){
		std::shared_ptr<ThreadSafeQueue<std::shared_ptr<std::vector<std::complex<int8_t>>>>> q= m_requestQueue.get(std::chrono::nanoseconds(0));
		m_windows.push_back(std::make_shared<PlotWindow>(q->getName(), q));
	}
 // Start the Dear ImGui frame
    ImGui_ImplOpenGL2_NewFrame();
    ImGui_ImplGLUT_NewFrame();

    my_display_code();

    // Rendering
    ImGui::Render();
    ImGuiIO& io = ImGui::GetIO();
    glViewport(0, 0, (GLsizei)io.DisplaySize.x, (GLsizei)io.DisplaySize.y);
    glClearColor(0.5, 0.6, 0.7, 0.5);
    glClear(GL_COLOR_BUFFER_BIT);
    //glUseProgram(0); // You may want this if using this code in an OpenGL 3+ context where shaders may be bound, but prefer using the GL3+ code.
    ImGui_ImplOpenGL2_RenderDrawData(ImGui::GetDrawData());

    glutSwapBuffers();
    glutPostRedisplay();


}

void GuiThread::displayQueue(std::shared_ptr<ThreadSafeQueue<std::shared_ptr<std::vector<std::complex<int8_t>>>>> q){
	m_requestQueue.put(q, std::chrono::nanoseconds(0));
} 

void GuiThread::start(){
	((MyThread*)this)->start();
	m_running=true;
}

void GuiThread::run(){
	//const char *argv;
	//argv=std::string("").c_str();
	int argc=0;
	glutInit(&argc, NULL);
	glutSetOption(GLUT_ACTION_ON_WINDOW_CLOSE, GLUT_ACTION_GLUTMAINLOOP_RETURNS);
	glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE | GLUT_MULTISAMPLE);
	glutInitWindowSize(1280, 720);
	glutCreateWindow("sdr test");

	GuiThread::currentInstance = this;
	glutDisplayFunc(drawCallback);
	
	glewInit();

	// Setup Dear ImGui context
	IMGUI_CHECKVERSION();
	ImGui::CreateContext();
	ImGuiIO& io = ImGui::GetIO(); (void)io;
	io.ConfigFlags |= ImGuiConfigFlags_DockingEnable;           // Enable Docking

	ImGui::StyleColorsDark();

	ImGui_ImplGLUT_Init();
	ImGui_ImplGLUT_InstallFuncs();
	ImGui_ImplOpenGL2_Init();
	//m_windows.push_back(std::make_shared<PlotWindow>("window1"));
	//m_windows.push_back(std::make_shared<PlotWindow>("window2"));
	//m_windows.push_back(std::make_shared<PlotWindow>("window3"));

	glutMainLoop();
	std::cout << "Exited glutmainloop" << std::endl;
	ImGui_ImplOpenGL2_Shutdown();
	ImGui_ImplGLUT_Shutdown();
	ImGui::DestroyContext();
	m_windows.clear();
	m_running=false;



}
