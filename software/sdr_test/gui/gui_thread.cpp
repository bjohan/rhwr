#include <GL/glew.h>
#include <GL/glut.h>
#include "gui_thread.hpp"
#include <iostream>
GuiThread* GuiThread::currentInstance=NULL;

GuiThread::GuiThread():MyThread("Gui thread"){
	show_demo_window = true;
	show_another_window = false;
	clear_color = ImVec4(0.45f, 0.55f, 0.60f, 1.00f);
}

void GuiThread::stop(){
	std::cout << "BITTE HALTEN SIE GLUTTEN!"<<std::endl;
	glutLeaveMainLoop();
}

void GuiThread::my_display_code(){
 // 1. Show the big demo window (Most of the sample code is in ImGui::ShowDemoWindow()! You can browse its code to learn more about Dear ImGui!).
    if (show_demo_window)
        ImGui::ShowDemoWindow(&show_demo_window);

    // 2. Show a simple window that we create ourselves. We use a Begin/End pair to create a named window.
    {
        static float f = 0.0f;
        static int counter = 0;

        ImGui::Begin("Hello, world!");                          // Create a window called "Hello, world!" and append into it.

        ImGui::Text("This is some useful text.");               // Display some text (you can use a format strings too)
        ImGui::Checkbox("Demo Window", &show_demo_window);      // Edit bools storing our window open/close state
        ImGui::Checkbox("Another Window", &show_another_window);

        ImGui::SliderFloat("float", &f, 0.0f, 1.0f);            // Edit 1 float using a slider from 0.0f to 1.0f
        ImGui::ColorEdit3("clear color", (float*)&clear_color); // Edit 3 floats representing a color

        if (ImGui::Button("Button"))                            // Buttons return true when clicked (most widgets return true when edited/activated)
            counter++;
        ImGui::SameLine();
        ImGui::Text("counter = %d", counter);

        ImGui::Text("Application average %.3f ms/frame (%.1f FPS)", 1000.0f / ImGui::GetIO().Framerate, ImGui::GetIO().Framerate);
        ImGui::End();
    }

    // 3. Show another simple window.
    if (show_another_window)
    {
        ImGui::Begin("Another Window", &show_another_window);   // Pass a pointer to our bool variable (the window will have a closing button that will clear the bool when clicked)
        ImGui::Text("Hello from another window!");
        if (ImGui::Button("Close Me"))
            show_another_window = false;
        ImGui::End();
    }
	for(shared_ptr<PlotWindow> w: m_windows){
		w->renderImgui();
	}

}

void GuiThread::draw(){

 // Start the Dear ImGui frame
    ImGui_ImplOpenGL2_NewFrame();
    ImGui_ImplGLUT_NewFrame();

    my_display_code();

    // Rendering
    ImGui::Render();
    ImGuiIO& io = ImGui::GetIO();
    glViewport(0, 0, (GLsizei)io.DisplaySize.x, (GLsizei)io.DisplaySize.y);
    glClearColor(clear_color.x * clear_color.w, clear_color.y * clear_color.w, clear_color.z * clear_color.w, clear_color.w);
    glClear(GL_COLOR_BUFFER_BIT);
    //glUseProgram(0); // You may want this if using this code in an OpenGL 3+ context where shaders may be bound, but prefer using the GL3+ code.
    ImGui_ImplOpenGL2_RenderDrawData(ImGui::GetDrawData());

    glutSwapBuffers();
    glutPostRedisplay();


}

void GuiThread::run(){
	char *argv = "";
	int argc=0;
	glutInit(&argc, &argv);
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
	m_windows.push_back(std::make_shared<PlotWindow>("window1"));

	glutMainLoop();

	ImGui_ImplOpenGL2_Shutdown();
	ImGui_ImplGLUT_Shutdown();
	ImGui::DestroyContext();



}
