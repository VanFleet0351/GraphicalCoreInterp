/**
 * 
 */
package com.kylevanfleet.service;

import java.util.HashMap;

import com.kylevanfleet.data.SampleProgram;
import com.kylevanfleet.data.SampleProgramData;

/**
 * @author Kyle Van Fleet
 *
 */
public class SampleProgLoader {
	private HashMap<String, SampleProgram> samples;
	
	
	public SampleProgLoader() {
		this.samples = new HashMap<>();
		this.init();
	}


	private void init() {
		samples.put("adder", 
				new SampleProgram(SampleProgramData.ADDER, SampleProgramData.ADDER_DATA));
		samples.put("larger", 
				new SampleProgram(SampleProgramData.LARGER, SampleProgramData.LARGER_DATA));
		samples.put("counter", 
				new SampleProgram(SampleProgramData.COUNTER, SampleProgramData.COUNTER_DATA));
		samples.put("switch", 
				new SampleProgram(SampleProgramData.SWITCH, SampleProgramData.SWITCH_DATA));
		samples.put("fibo", 
				new SampleProgram(SampleProgramData.FIBO, SampleProgramData.FIBO_DATA));
	}




	public SampleProgram getProg(String progToLoad) {
		return samples.get(progToLoad);
	}

}
