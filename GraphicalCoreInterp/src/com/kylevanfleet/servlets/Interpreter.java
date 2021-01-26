package com.kylevanfleet.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kylevanfleet.interpreter.Parser;
import com.kylevanfleet.interpreter.Scanner;

/**
 * Servlet implementation class Interpreter
 */
@WebServlet(description = "Core Interpreter", urlPatterns = {"/Interpreter"})
public class Interpreter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Interpreter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		String prog = request.getParameter("prog").trim();
		String data = request.getParameter("data").trim();
		out.println(prog);
		out.println(data);
		
		
		try {
			Scanner coreScanner = new Scanner(prog, data);
			Parser coreParser = new Parser(coreScanner);
			String prettyCode = coreParser.printCode();
			String output = coreParser.execute();
			out.println(prettyCode);
			out.println("<br>");
			out.println(output);
		} catch (Exception e) {
			out.println(e.getMessage());
			e.printStackTrace();
		}
	}

}
