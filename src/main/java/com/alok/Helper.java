package com.alok;

public class Helper {
	
	public static String get10words(String desc) {
		
		String strs[]=desc.split(" ");
		
		if(strs.length>10) {
			String temp="";
			for(int i=0; i<10; i++) {
				temp=temp+strs[i]+" ";
			}
			return temp+". . . ";
		}else {
			return (desc+". . .");
		}
		
	}
}
