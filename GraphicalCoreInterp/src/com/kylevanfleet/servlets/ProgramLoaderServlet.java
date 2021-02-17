package com.kylevanfleet.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.kylevanfleet.service.SampleProgLoader;

/**
 * Servlet implementation class ProgramLoaderServlet
 */
@WebServlet(description = "ProgramLoaderServlet", urlPatterns = {"/ProgramLoaderServlet"})
public class ProgramLoaderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String progToLoad = request.getParameter("sampleProg");
		SampleProgLoader spl = new SampleProgLoader();
		request.setAttribute("sampleProg", spl.getProg(progToLoad));
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}

}
