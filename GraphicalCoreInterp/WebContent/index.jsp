<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css" type="text/css">
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
		</header>
		<main>
		<h3>Language Grammar</h3>
		<section class="grammar">
		<span>
			<span class="lhs">&lt;prog&gt;</span> ::= 
			<span class="terminal">program</span> 
			<span class="non-terminal">&lt;decl-seq&gt;</span> 
			<span class="terminal">begin</span> 
			<span class="non-terminal">&lt;stmt-seq&gt;</span> 
			<span class="terminal">end</span>
		</span>
		<br>
		<span>
			<span class="lhs">&lt;decl-seq&gt;</span> ::= 
			<span class="non-terminal">&lt;decl&gt;</span> | 
			<span class="non-terminal">&lt;decl&gt;&lt;decl-seq&gt;</span>
		</span>
		<br>
		<span>
			<span class="lhs">&lt;stmt-seq&gt;</span> ::= 
			<span class="non-terminal">&lt;stmt&gt;</span> | 
			<span class="non-terminal">&lt;stmt&gt;&lt;stmt-seq&gt;</span>
		</span>
		<br>
		<span>
			<span class="lhs">&lt;decl&gt;</span> ::= 
			<span class="terminal">int </span>
			<span class="non-terminal">&lt;id-list&gt; </span>
			<span class="terminal">; </span>
		</span>
		<br>
		<span>
			<span class="lhs">&lt;id-list&gt;</span> ::= 
			<span class="terminal">id</span> | 
			<span class="terminal">id</span> , 
			<span class="non-terminal">&lt;id-list&gt;</span>
		</span>
		<br>
 		<span>
 			<span class="lhs">&lt;stmt&gt;</span> ::= 
 			<span class="non-terminal">&lt;assign&gt;</span> | 
 			<span class="non-terminal">&lt;if&gt;</span> | 
 			<span class="non-terminal">&lt;loop&gt;</span> | 
 			<span class="non-terminal">&lt;in&gt;</span> | 
 			<span class="non-terminal">&lt;out&gt;</span> 
 			
 		</span>
 		<br>
 		<span>
 			<span class="lhs">&lt;assign&gt;</span> ::= 
 			<span class="terminal">id</span> 
 			<span class="terminal">:=</span> 
 			<span class="non-terminal">&lt;expr&gt;</span> 
 			<span class="terminal">;</span>
 		</span>
 		<br>
		<span>
			<span class="lhs">&lt;in&gt;</span> ::=  
			<span class="terminal">input </span>
			<span class="terminal">id </span>
			<span class="terminal">; </span>
		</span>
		<br>
		<span>
			<span class="lhs">&lt;out&gt;</span> ::= 
			<span class="terminal">output </span>
			<span class="non-terminal">&lt;expr&gt; </span>
			<span class="terminal">; </span>
		</span>
		<br>
		<span>
			<span class="lhs">&lt;if&gt;</span> ::= 
			<span class="terminal">if </span>
			<span class="non-terminal">&lt;cond&gt; </span>
			<span class="terminal">then </span>
			<span class="non-terminal">&lt;stmt-seq&gt; </span>
			<span class="terminal">endif </span><span class="terminal">; </span> | 
			<span class="terminal">if </span><span class="non-terminal">&lt;cond&gt; </span>
			<span class="terminal">then </span><span class="non-terminal">&lt;stmt-seq&gt; </span>
			<span class="terminal">else </span><span class="non-terminal">&lt;stmt-seq&gt; </span>
			<span class="terminal">endif </span><span class="terminal">; </span>
		</span>
		<br>
		<span>
			<span class="lhs">&lt;loop&gt;</span> ::= 
			<span class="terminal">while</span>
			<span class="non-terminal">&lt;cond&gt; </span>
			<span class="terminal">begin </span>
			<span class="non-terminal">&lt;stmt-seq&gt; </span>
			<span class="terminal">endwhile </span>
			<span class="terminal">; </span> 
		</span>
		<br>
		<span>
			<span class="lhs">&lt;cond&gt;</span> ::= 
			<span class="non-terminal">&lt;cmpr&gt; </span>| 
			<span class="terminal">! 
			</span><span class="terminal">( </span>
			<span class="non-terminal">&lt;cond&gt; </span>
			<span class="terminal">) </span>| 
			<span class="non-terminal">&lt;cmpr&gt; </span>
			<span class="terminal">or </span>
			<span class="non-terminal">&lt;cond&gt; </span>
		</span>
		<br>
		<span>
			<span class="lhs">&lt;cmpr&gt;</span> ::= 
			<span class="non-terminal">&lt;expr&gt; </span>
			<span class="terminal">= </span>
			<span class="non-terminal">&lt;expr&gt; </span>| 
			<span class="non-terminal">&lt;expr&gt; </span>
			<span class="terminal">&lt; </span>
			<span class="non-terminal">&lt;expr&gt; </span>| 
			<span class="non-terminal">&lt;expr&gt; </span>
			<span class="terminal">&lt;= </span>
			<span class="non-terminal">&lt;expr&gt; </span>
		</span>
		<br>
		<span>
			<span class="lhs">&lt;expr&gt;</span> ::= 
			<span class="non-terminal">&lt;term&gt; </span>| 
			<span class="non-terminal">&lt;term&gt; </span>
			<span class="terminal">+ </span>
			<span class="non-terminal">&lt;expr&gt; </span>| 
			<span class="non-terminal">&lt;term&gt; </span>
			<span class="terminal">- </span>
			<span class="non-terminal">&lt;expr&gt; </span>
		</span>
		<br>
		<span>
			<span class="lhs">&lt;term&gt;</span> ::= 
			<span class="non-terminal">&lt;factor&gt; </span>| 
			<span class="non-terminal">&lt;factor&gt; </span>
			<span class="terminal">* </span>
			<span class="non-terminal">&lt;term&gt; </span>
		</span>
		<br>
		<span>
			<span class="lhs">&lt;factor&gt;</span> ::= 
			<span class="terminal">const </span>| 
			<span class="terminal">id </span>| 
			<span class="terminal">( </span>
			<span class="non-terminal">&lt;expr&gt; </span>
			<span class="terminal">) </span>
		</span>
		<br>
		<span>
			<span class="lhs">&lt;id&gt;</span> ::= 
			<span class="non-terminal">&lt;letter&gt; </span>| 
			<span class="non-terminal">&lt;id&gt;&lt;letter&gt; </span>| 
			<span class="non-terminal">&lt;id&gt;&lt;digit&gt; </span>
		</span>
		<br>
		<span>
			<span class="lhs">&lt;letter&gt;</span> ::= 
			<span class="terminal">A </span>| 
			<span class="terminal">B </span>|...|
			<span class="terminal">Z </span>| 
			<span class="terminal">a </span>| 
			<span class="terminal">b </span>|...| 
			<span class="terminal">z </span>
		</span>
    	</section>
		
	<form method="post" action="ProgramLoaderServlet">
		<section>
			<label for="sampleProg"><b>Sample Programs:</b></label> <br>
			<select name="sampleProg" id="sampleProg">
				<option value="adder">Adder</option>
				<option value="larger">Larger</option>
				<option value="counter">Counter</option>
				<option value="switch">Switch Statement</option>
				<option value="fibo">Fibonacci</option>
			</select> <input type="submit" value="Load" class="button"> <br> <br>
		</section>
	</form>
	<form method="post" action="Interpreter">
		<section>
		<jsp:useBean id="sampleProg" class="com.kylevanfleet.data.SampleProgram" scope="request">
			<jsp:setProperty property="prog" name="sampleProg" value=""/>
			<jsp:setProperty property="data" name="sampleProg" value=""/>
		</jsp:useBean>
			<div class="text-inputs">
				<label for="prog"><b>Program:</b></label> <br>
				<textarea rows="15" cols="40" id="prog" name="prog"><jsp:getProperty property="prog" name="sampleProg"/></textarea>
			</div>
			<div class="text-inputs">
				<label for="data"><b>Input Data:</b></label> <br>
				<textarea rows="5" cols="40" id="data" name="data"><jsp:getProperty property="data" name="sampleProg"/></textarea>
			</div>
			<br> <br> 
			<input type="submit" value="Run" class="button">
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