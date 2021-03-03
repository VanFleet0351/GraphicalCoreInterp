<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Core Interpreter</title>
</head>
<body>


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
		<jsp:useBean id="sampleProg" class="com.kylevanfleet.data.SampleProgram" scope="request">
			<jsp:setProperty property="prog" name="sampleProg" value=""/>
			<jsp:setProperty property="data" name="sampleProg" value=""/>
		</jsp:useBean>
			<label for="prog"><b>Program:</b></label> <br>
			<textarea rows="15" cols="40" id="prog" name="prog"><jsp:getProperty property="prog" name="sampleProg"/></textarea>
			<br> <br> <label for="data"><b>Input Data:</b></label> <br>
			<textarea rows="5" cols="40" id="data" name="data"><jsp:getProperty property="data" name="sampleProg"/></textarea>
			<br> <br> <input type="submit" value="Run">
		</Section>
	</form>
	<br>
	<br>
	<section>
	<jsp:useBean id="output" class="com.kylevanfleet.data.FormattedOutput" scope="request">
		<jsp:setProperty property="prettyCode" name="output" value=""/>
		<jsp:setProperty property="inData" name="output" value=""/>
		<jsp:setProperty property="outData" name="output" value=""/>
	</jsp:useBean>
		<h2>Output:</h2>
		<hr>
		<h5>Input Code:</h5>
		<pre><code><jsp:getProperty property="prettyCode" name="output"/></code></pre>
		<hr>
		<h5>Input Data:</h5>
		<jsp:getProperty property="inData" name="output"/>
		<hr>
		<h5>Output Data:</h5>
		<jsp:getProperty property="outData" name="output"/>
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