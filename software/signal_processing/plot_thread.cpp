#include <iostream>
#include "plot_thread.hpp"
#include "messages.hpp"
#include "subscriber_queue.hpp"
#include <GL/glut.h>
#include <GL/gl.h>
#include <GL/freeglut_ext.h>
PlotThread* PlotThread::m_currentInstance=NULL;

PlotThread::PlotThread(int *argc, char **argv) : MyThread("Plotting thread"){
	m_argc=argc;
	m_argv=argv;
	m_stop = false;
	m_queue = std::make_shared<SubscriberQueue<std::shared_ptr<StringMessage>>>();
	//initGlut();

}

PlotThread::PlotThread(int *argc, char **argv, std::shared_ptr<Publisher<std::shared_ptr<StringMessage>>> pub) : MyThread("Plotting thread"){
	m_argc=argc;
	m_argv=argv;
	m_stop = false;
	m_queue = std::make_shared<SubscriberQueue<std::shared_ptr<StringMessage>>>();
	pub->addSubscriber(m_queue);
}

PlotThread::~PlotThread()
{
	std::cout << "Destroying plot thread" << std::endl;
	stop();
	if(this->joinable()) this->join();
}

void PlotThread::initGlut(){
	cout << "init glut" << endl;
	glutInit(m_argc, m_argv);
	glutInitDisplayMode(GLUT_SINGLE);
	glutInitWindowSize(300, 300);
	glutInitWindowPosition(100, 100);
	glutCreateWindow("Plot");
	glutSetOption(GLUT_ACTION_ON_WINDOW_CLOSE, GLUT_ACTION_GLUTMAINLOOP_RETURNS);
	//glutDisplayFunc(displayMe);
}

void PlotThread::draw(){
	cout << "draw" << endl;
	glClear(GL_COLOR_BUFFER_BIT);
	glBegin(GL_POLYGON);
	glVertex3f(0.0, 0.0, 0.0);
	glVertex3f(0.5, 0.0, 0.0);
	glVertex3f(0.5, 0.5, 0.0);
	glVertex3f(0.0, 0.5, 0.0);
	glEnd();
	glFlush();
	glutSwapBuffers();

}

void PlotThread::idle(){
	loopIteration();
}

void PlotThread::close(){
	cout << "glut close callback called" << endl;
	m_stop=true;
}

void PlotThread::drawCallback(){
	if(m_currentInstance) m_currentInstance->draw();
}

void PlotThread::idleCallback(){
	if(m_currentInstance) m_currentInstance->idle();
}

void PlotThread::closeCallback(){
	if(m_currentInstance) m_currentInstance->close();
}

void PlotThread::setupCallbacks(){
	cout << "Setting up callbacks" << endl;
	m_currentInstance=this;
	glutDisplayFunc(PlotThread::drawCallback);
	glutIdleFunc(PlotThread::idleCallback);
	glutCloseFunc(PlotThread::closeCallback);
	cout << "callbacks in place" << endl;

}

void PlotThread::loopIteration(){
	//std::shared_ptr<StringMessage> msg;
	//msg = m_queue->getMessage();
	//cout << "in consumer thread " << msg->m_string.get() << endl;
	if(m_stop){
		cout << "Leaving glut main loop" << endl;
		glutLeaveMainLoop();
	}
}

void PlotThread::run(){
	initGlut();
	if(m_currentInstance == NULL) setupCallbacks();
	cout << "Plot thread running" << endl;
	glutMainLoop();
	cout << "Plot thread exit" << endl;
}

void PlotThread::stop(){
	m_stop = true;
}
