package com.kylevanfleet.servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kylevanfleet.data.FormattedOutput;
import com.kylevanfleet.interpreter.Parser;
import com.kylevanfleet.interpreter.Scanner;

/**
 * Servlet implementation class Interpreter
 */
@WebServlet(description = "Core Interpreter", urlPatterns = {"/Interpreter"})
public class Interpreter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prog = request.getParameter("prog").trim();
		String data = request.getParameter("data").trim();
		String prettyCode = prog;
		String output = "Error";
		
		try {
			Scanner coreScanner = new Scanner(prog, data);
			Parser coreParser = new Parser(coreScanner);
			prettyCode = coreParser.printCode();
			output = coreParser.execute();
		} catch (Exception e) {
			output = e.getMessage();
			e.printStackTrace();
		}
		//System.out.println(prettyCode);
		FormattedOutput formattedOutput = new FormattedOutput(prettyCode, data, output);
		request.setAttribute("output", formattedOutput);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}

}
