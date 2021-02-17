package com.kylevanfleet.interpreter;

public class Cmpr implements CoreToken {

	private Scanner scanner;
	private Parser parser;
	private Expr lExpr;
	private Expr rExpr;
	private enum Operation{EQUAL, LT, LTE}
	private Operation op;
	
	public Cmpr(Scanner scan, Parser parse){
		scanner = scan;
		parser = parse;
	}
	
	@Override
	public void parse() throws Exception {
		lExpr = new Expr(scanner, parser);
		lExpr.parse();
		if(scanner.currentToken().equals("EQUAL")){
			op = Operation.EQUAL;
			scanner.nextToken();//consume =
		}else if(scanner.currentToken().equals("LT")){
			op = Operation.LT;
			scanner.nextToken();//consume LT
		}else if(scanner.currentToken().equals("LTE")){
			op = Operation.LTE;
			scanner.nextToken();//consume LTE
		}else{
			throw new Exception("ERROR: syntax error: expected =, <, or <= but got \'"
					+scanner.currentToken()+ "\'.");
		}
		rExpr = new Expr(scanner, parser);
		rExpr.parse();
	}

	@Override
	public void printCode(StringBuilder builder, int indentation) {
		lExpr.printCode(builder, indentation);
		switch(op){
		case EQUAL:
			builder.append("=");
			break;
		case LT:
			builder.append("&lt;");
			break;
		case LTE:
			builder.append("<=");
			break;
		default:
			break;
		}
		rExpr.printCode(builder, indentation);
	}

	@Override
	public int execute(StringBuilder outputBuilder) throws Exception {
		int val = -1;
		switch(op){
		case EQUAL:
			if(lExpr.execute(outputBuilder) == rExpr.execute(outputBuilder))
				val = 1;
			break;
		case LT:
			if(lExpr.execute(outputBuilder) < rExpr.execute(outputBuilder))
				val = 1;
			break;
		case LTE:
			if(lExpr.execute(outputBuilder) <= rExpr.execute(outputBuilder))
				val = 1;
			break;
		default:
			throw new Exception("This should never be thrown");
		}
		return val;
	}

}
