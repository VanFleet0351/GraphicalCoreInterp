/**
 * 
 */
package com.kylevanfleet.service;

/**
 * @author Kyle Van Fleet
 *
 */
public class SampleProgLoader {
	
	private static final String ADDER = "program\\n  int x, y, z;\\nbegin\\n  input"
			+ " x, y;\" + \"\\n  z:= x + y;\\n  output z;\\nend";
	private static final String ADDER_DATA = "1 2";
	private static final String LARGER = "program\r\n  int a,b,c;\r\nbegin\r\n" + 
			"  input a,b;\r\n  if b<a then\r\n    c:=a;\r\n  else\r\n    c:=b;\r\n" + 
			"  endif;\r\n  output c;";
	private static final String LARGER_DATA = "42 24";
	
	public String[] getPorg(String progToLoad) {
		String prog;
		String data;
		
		switch (progToLoad) {
		case "adder":
			prog = ADDER;
			data = ADDER_DATA;
			break;
		case "larger":
			prog = LARGER;
			data = LARGER_DATA;
			break;
		default:
			prog = "program\nbegin\nend";
			data = "1 -2 3";
			break;
	}
		String[] sample = {prog, data};
		return sample;
	}

}
