/**
 * 
 */
package com.kylevanfleet.service;

import java.util.HashMap;

import com.kylevanfleet.data.SampleProgramData;

/**
 * @author Kyle Van Fleet
 *
 */
public class SampleProgLoader {
	private HashMap<String, String[]> samples;
	
	
	public SampleProgLoader() {
		this.samples = new HashMap<>();
		this.init();
	}


	private void init() {
		samples.put("adder", 
				new String[] {SampleProgramData.ADDER, SampleProgramData.ADDER_DATA});
		samples.put("larger", 
				new String[] {SampleProgramData.LARGER, SampleProgramData.LARGER_DATA});
		samples.put("counter", 
				new String[] {SampleProgramData.COUNTER, SampleProgramData.COUNTER_DATA});
		samples.put("switch", 
				new String[] {SampleProgramData.SWITCH, SampleProgramData.SWITCH_DATA});
		samples.put("fibo", 
				new String[] {SampleProgramData.FIBO, SampleProgramData.FIBO_DATA});
	}




	public String[] getProg(String progToLoad) {
		return samples.get(progToLoad);
	}

}
