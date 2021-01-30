package com.kylevanfleet.interpreter;
public class CoreOutput implements CoreToken {

	private Scanner scanner;
	private Parser parser;
	private Expr expr;
	
	public CoreOutput(Scanner scan, Parser parse){
		scanner = scan;
		parser = parse;
	}
	
	@Override
	public void parse() throws Exception {
		scanner.nextToken();//Consume OUTPUT
		expr = new Expr(scanner, parser);
		expr.parse();
		if(!scanner.currentToken().equals("SEMICOLON")){
			throw new Exception("ERROR: syntax error: expected \';\' but got \'"
					+ scanner.currentToken() + "\'.");
		}
		scanner.nextToken();//Consume SEMICOLON
	}

	@Override
	public void printCode(StringBuilder builder, int indentation) {
		String spacing = parser.getSpaces(indentation);
		builder.append(spacing);
		builder.append("output ");
		expr.printCode(builder, indentation);
		builder.append(";\n");
	}

	
	public int execute(StringBuilder outputBuilder) throws Exception {
		int val = expr.execute(outputBuilder);
		outputBuilder.append(val);
		outputBuilder.append("\n");
		return val;
	}
}
