<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Core Interpreter</title>
</head>
<body>
	<%
		String prog = "";
		String data = "";
	%>

	
		<Section>
			<h1>Core Interpreter</h1>
			<p>Enter your program in the input text area and data into the data text area and click "Run" to
				run the programs and get its output. A sample program and data may be selected from the drop
				 down tab to run as well.</p>
		</section>
		<form method="post" action="ProgramLoaderSerlet"></form>
		<section>
		<label for="sampleProg"><b>Sample Programs:</b></label>
			<br>
			<select name="sampleProg" id="sampleProg">
				<option value="adder">Adder</option>
				<option value="larger">Larger</option>
			</select> 
			<input type="submit" value="Load">
			<br>
			<br>
		</section>
	<form method="post" action="Interpreter">
	<section>
			<label for="prog"><b>Input:</b></label>
			<br>
			<%
				if (request.getAttribute("formattedCode") != null) {
					prog = (String) request.getAttribute("formattedCode");
				}
			%>
			<textarea rows="10" cols="25" id="prog" name="prog"><%=prog%></textarea>
			<br>
			<br> <label for="data"><b>Data:</b></label> <br>
			<%
				if (request.getAttribute("data") != null) {
					data = (String) request.getAttribute("data");
				}
			%>
			<textarea rows="3" cols="25" id="data" name="data"><%=data%></textarea>
			<br>
			<br> <input type="submit" value="Run">
		</Section>
		<section>
			<p>
				<b>Output:</b>
			</p>
			<%
				if (request.getAttribute("output") != null) {
			%>
			<p><%=request.getAttribute("output")%></p>
			<%
				}
			%>
		</section>
	</form>
</body>
</html>