package com.kylevanfleet.interpreter;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * @author Kyle Van Fleet
 *
 */
public class Scanner {
	private ArrayList<String> tokens = new ArrayList<String>();
	private ArrayList<Integer> data = new ArrayList<Integer>();
	private String currentTok;
	private HashMap<String,String> tokenMap = new HashMap<String,String>();
	
	public Scanner(String code, String data) throws Exception{
		this.initialize();
		StringReader reader = new StringReader(code);
		this.tokenizer(reader);
		reader.close();
		reader = new StringReader(data);
		this.getData(reader);
		reader.close();
	}

	/**
	 * Takes in String data and converts it to integer data.
	 * 
	 * @param reader A StringReader loaded with the String data.
	 * @throws Exception An exception to the formatting of the data.
	 */
	private void getData(StringReader reader) throws Exception {
		StringBuilder dataBuilder = new StringBuilder();
		int nextChar = reader.read();
		while(nextChar != -1){
			if(Character.isDigit(nextChar) || nextChar == '-'){
				dataBuilder.append((char) nextChar);
				int previousChar = nextChar;
				nextChar = reader.read();
				if(previousChar == '-' && !Character.isDigit(nextChar)) {
					throw new Exception("Error: \'-\' should be immediately followed"
							+ "by a number.");
				}
				while(Character.isDigit(nextChar)){
					dataBuilder.append((char) nextChar);
					nextChar = reader.read();
				}
				data.add(Integer.parseInt(dataBuilder.toString()));
				dataBuilder = new StringBuilder();
			}
			if(!Character.isWhitespace(nextChar) && nextChar != -1){
				throw new Exception("ERROR: Numbers should be sepparated with "
						+ "spaces and negative number should begin with a \"-\".");
			}
			//Consume whitespace
			nextChar = reader.read();
		}
	}

	/**
	 * Creates tokens for the provided Core code.
	 * 
	 * @param reader  A StringReader loaded with the Core language code.
	 * @throws Exception An exception to the formatting and syntax of the code.
	 */
	private void tokenizer(StringReader reader) throws Exception {
		StringBuilder builder = new StringBuilder();
		int nextChar =  reader.read();
		int lineCount = 1;
		while(nextChar != -1){
			if(Character.isLetter(nextChar)){
				while(Character.isLetterOrDigit(nextChar)){
					builder.append((char) nextChar);
					nextChar = reader.read();
				}
				tokens.add(getToken(builder.toString()));
				builder = new StringBuilder();
			}else if(Character.isDigit(nextChar)){
				builder.append("CONST[");
				while(Character.isDigit(nextChar)){
					builder.append((char)nextChar);
					nextChar = reader.read();
				}
				builder.append("]");
				tokens.add(getToken(builder.toString()));
				builder = new StringBuilder();
			}else if(":|,;!=+*()<-".indexOf(nextChar) >= 0){
				builder.append((char) nextChar);
				if(nextChar == ':' || nextChar == '<'){
					nextChar = reader.read();
					if(nextChar == '='){
						builder.append((char) nextChar);
						nextChar = reader.read();
					}
				}else{
					nextChar = reader.read();
				}
				tokens.add(getToken(builder.toString()));
				builder = new StringBuilder();
			}else if(Character.isWhitespace(nextChar)){
				if(nextChar == '\n')
					lineCount++;
				nextChar = reader.read();
			}else{
				throw new Exception("ERROR: unsupported character \"" + (char) nextChar + "\" was found on line " + lineCount);
			}
		}
	}

	/**
	 * Retrieves the token matching the provided String.
	 * 
	 * @param progString
	 * @return
	 */
	private String getToken(String progString){
		String token;
		if(tokenMap.containsKey(progString)){
			token = tokenMap.get(progString);
		}else{
			if(!progString.contains("CONST[")){
				token = "ID["+progString+"]";
			}else{
				token = progString;
			}
		}
		return token;
	}
	
	/**
	 * Retrieves the next token.
	 * 
	 * @return a String token.
	 */
	public String nextToken(){
		if(!tokens.isEmpty()){
			currentTok = tokens.remove(0);
		}else{
			currentTok = "EOF";
		}
		
		return currentTok;
	}
	
	
	/**
	 * Retrieves the next data entry.
	 * 
	 * @return integer data.
	 * @throws Exception Throws exception when no data is available.
	 */
	public int nextData() throws Exception{
		if(data.isEmpty()){
			throw new Exception("ERROR: No more data available.");
		}
		return data.remove(0);
	}
	
	/**
	 * Provides the last token Retrieved from nextToken().
	 * @return String token.
	 */
	public String currentToken(){
		return currentTok;
	}
	
	/**
	 * Returns the same token that would be returned from nextToken() without
	 * consuming the current token.
	 * 
	 * @return String token.
	 */
	public String peekNextToken(){
		String peek;
		if(tokens.isEmpty()){
			peek = "EOF";
		}else{
			peek = tokens.get(0);
		}
		return peek;
	}
	
	/**
	 * Initializes all the String-token pairings in the tokenMap.
	 */
	private void initialize() {
		tokenMap.put("program", "PROGRAM");
		tokenMap.put("begin", "BEGIN");
		tokenMap.put("end", "END");
		tokenMap.put("int", "INT");
		tokenMap.put(";", "SEMICOLON");
		tokenMap.put(":=", "ASSIGN");
		tokenMap.put("input", "INPUT");
		tokenMap.put("output", "OUTPUT");
		tokenMap.put("if", "IF");
		tokenMap.put("then", "THEN");
		tokenMap.put("endif", "ENDIF");
		tokenMap.put("else", "ELSE");
		tokenMap.put("while", "WHILE");
		tokenMap.put("endwhile", "ENDWHILE");
		tokenMap.put("!", "NEGATE");
		tokenMap.put("(", "LPAREN");
		tokenMap.put(")", "RPAREN");
		tokenMap.put("or", "OR");
		tokenMap.put("=", "EQUAL");
		tokenMap.put("<", "LT");
		tokenMap.put("<=", "LTE");
		tokenMap.put("+", "PLUS");
		tokenMap.put("-", "MINUS");
		tokenMap.put("*", "MULT");
		tokenMap.put("case", "CASE");
		tokenMap.put(":", "COLON");
		tokenMap.put("|", "BAR");
		tokenMap.put(",", "COMMA");
		tokenMap.put("of", "OF");
	}
}
