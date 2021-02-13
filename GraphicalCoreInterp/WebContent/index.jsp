<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Core Interpreter</title>
</head>
<body>
	<%!
		String prog = "";
		String data = "";
	%>


	<header>
		<h1>Core Interpreter</h1>
		<p>To create a program start with the key word "program" followed by a declaration of all
		integer variables. After your variables are declared start the code with the keyword "begin"
		followed by the code for your program and finally ending with the keyword "end." </p>
		<p>Once variables have been declared they can be initialized by simply assigning a
		integer literal value to it or by requesting input data. Variables will be assign the 
		input data value in the same order that it is enter. For example if the input data 
		sequence of 5 -10 20 is entered, 5 will be assigned to the first variable requesting 
		input, -10 will be assigned to the next request and so on. An input request can be 
		performed with the following syntax "input x;" or "input x, y, z;" may be used for multiple
		input requests.</p>
		<h3>Language Grammar</h3>
		<pre><code>
&lt;prog&gt; ::= program &lt;decl-seq&gt; begin &lt;stmt-seq&gt; end
&lt;decl-seq&gt; ::= &lt;decl&gt; | &lt;decl&gt;&lt;decl-seq&gt;
&lt;stmt-seq&gt; ::= &lt;stmt&gt; | &lt;stmt&gt;&lt;stmt-seq&gt;
&lt;decl&gt; ::= int &lt;id-list&gt; ; 
&lt;id-list&gt; ::= id | id , &lt;id-list&gt; 
&lt;stmt&gt; ::= &lt;assign&gt; | &lt;if&gt; | &lt;loop&gt; | &lt;in&gt; | &lt;out&gt; 
&lt;assign&gt; ::= id := &lt;expr&gt; ;
&lt;in&gt; ::= input id ; 
&lt;out&gt; ::= output &lt;expr&gt; ; 
&lt;if&gt; ::= if &lt;cond&gt; then &lt;stmt-seq&gt; endif ; | if &lt;cond&gt; then &lt;stmt-seq&gt; else &lt;stmt-seq&gt; endif ;
&lt;loop&gt; ::= while &lt;cond&gt; begin &lt;stmt-seq&gt; endwhile ; 
&lt;cond&gt; ::= &lt;cmpr&gt; | ! ( &lt;cond&gt; ) | &lt;cmpr&gt; or &lt;cond&gt;
&lt;cmpr&gt; ::= &lt;expr&gt; = &lt;expr&gt; | &lt;expr&gt; &lt; &lt;expr&gt; | &lt;expr&gt; &lt;= &lt;expr&gt;
&lt;expr&gt; ::= &lt;term&gt; | &lt;term&gt; + &lt;expr&gt; | &lt;term&gt; - &lt;expr&gt;
&lt;term&gt; ::= &lt;factor&gt; | &lt;factor&gt; * &lt;term&gt;
&lt;factor&gt; ::= const | id | ( &lt;expr&gt; )
&lt;id&gt; ::= &lt;letter&gt; | &lt;id&gt;&lt;letter&gt; | &lt;id&gt;&lt;digit&gt;
&lt;letter&gt; ::= A | B |...| Z | a | b | ... | z
    	</code></pre>
		

	</header>
	<main>
	<form method="post" action="ProgramLoaderServlet">
		<section>
			<label for="sampleProg"><b>Sample Programs:</b></label> <br>
			<!-- Add more options -->
			<select name="sampleProg" id="sampleProg">
				<option value="adder">Adder</option>
				<option value="larger">Larger</option>
				<option value="counter">Counter</option>
				<option value="switch">Switch Statement</option>
				<option value="fibo">Fibonacci</option>
			</select> <input type="submit" value="Load"> <br> <br>
		</section>
	</form>
	<form method="post" action="Interpreter">
		<section>
			<label for="prog"><b>Program:</b></label> <br>
			<%
				if (request.getAttribute("formattedCode") != null) {
					prog = (String) request.getAttribute("formattedCode");
				}
			%>
			<textarea rows="10" cols="25" id="prog" name="prog"><%=prog%></textarea>
			<br> <br> <label for="data"><b>Input Data:</b></label> <br>
			<%
				if (request.getAttribute("data") != null) {
					data = (String) request.getAttribute("data");
				}
			%>

			<textarea rows="3" cols="25" id="data" name="data"><%=data%></textarea>
			<br> <br> <input type="submit" value="Run">
		</Section>
	</form>
	<hr>
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
	</main>
	<hr>
	<footer>
		<ul>
			<li><b>Author:</b> Kyle Van Fleet</li>
			<li><b>Email:</b> k.vanfleet.7@gmail.com</li>
		</ul>
	</footer>
</body>
</html>