package com.kylevanfleet.interpreter;
public interface CoreToken {
	public void parse() throws Exception;
	public void printCode(StringBuilder builder, int indentation);
	public int execute(StringBuilder outputBuilder) throws Exception;
}
