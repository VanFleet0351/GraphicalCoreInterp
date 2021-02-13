/**
 * 
 */
package com.kylevanfleet.data;

/**
 * @author Kyle Van Fleet
 */

/**
 * This is a data class for holding sample program Strings and sample program data
 * Strings.
 *
 */
public class SampleProgramData {
	public static final String ADDER = "program\n  int x, y, z;\nbegin\n  input"
			+ " x, y;\n  z:= x + y;\n  output z;\nend";
	public static final String ADDER_DATA = "1 2";
	public static final String LARGER = "program\r\n  int a,b,c;\r\nbegin\r\n" + 
			"  input a,b;\r\n  if b<a then\r\n    c:=a;\r\n  else\r\n    c:=b;\r\n" + 
			"  endif;\r\n  output c;\nend";
	public static final String LARGER_DATA = "42 24";
	public static final String COUNTER = "program\n" + 
			"  int X,XY;\n" + 
			"begin\n" + 
			"  input X;\n" + 
			"  XY:=0;\n" + 
			"  while 0<X begin\n" + 
			"    output XY;\n" + 
			"    XY:=XY+1;\n" + 
			"    X:=X-1;\n" + 
			"  endwhile;\n" + 
			"  output XY;\n" + 
			"end";
	public static final String COUNTER_DATA = "15";
	public static final String SWITCH = "program\n" + 
			"	int x,y,z,A14;\n" + 
			"begin\n" + 
			"	input x,y,z;\n" + 
			"	output x;\n" + 
			"	output y;\n" + 
			"	output z;\n" + 
			"	A14:=0;\n" + 
			"	while A14 < 10 begin\n" + 
			"	case A14 of\n" + 
			"	1,2,3 : A14+1\n" + 
			"	| 4,5 : A14+2\n" + 
			"	|6,7,8 : A14+5\n" + 
			"	else 1 end;\n" + 
			"	endwhile;\n" + 
			"	output A14;\n" + 
			"end";
	public static final String SWITCH_DATA = "1\n" + 
			"23\n" + 
			"450\n" + 
			"678\n" + 
			"1234";
	public static final String FIBO = "program\n" + 
			"  int x1,x2,fibNum,temp;\n" + 
			"begin\n" + 
			"  input fibNum;\n" + 
			"  x1:=0;\n" + 
			"  x2:=1;\n" + 
			"  if fibNum<=1 then\n" + 
			"    output x1;\n" + 
			"  else\r\n" + 
			"    if fibNum=2 then\n" + 
			"      output x2;\n" + 
			"    else\n" + 
			"      while 2<fibNum begin\n" + 
			"        temp:=x2;\n" + 
			"        x2:=x1+x2;\n" + 
			"        x1:=temp;\n" + 
			"        fibNum:=fibNum-1;\n" + 
			"      endwhile;\n" + 
			"      output x2;\n" + 
			"    endif;\n" + 
			"  endif;\n" + 
			"end";
	public static final String FIBO_DATA = "5";
	
}
