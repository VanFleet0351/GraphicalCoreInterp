package com.kylevanfleet.data;

public class FormattedOutput {
	private String prettyCode;
	private String inData;
	private String outData;
	
	public FormattedOutput() {
	}

	public FormattedOutput(String prettyCode, String inData, String output) {
		this.prettyCode = prettyCode;
		this.inData = inData;
		this.outData = output;
	}

	public String getPrettyCode() {
		return prettyCode;
	}
	public void setPrettyCode(String prettyCode) {
		this.prettyCode = prettyCode;
	}
	public String getInData() {
		return inData;
	}
	public void setInData(String inData) {
		this.inData = inData;
	}

	public String getOutData() {
		return outData;
	}

	public void setOutData(String outData) {
		this.outData = outData;
	}
}
