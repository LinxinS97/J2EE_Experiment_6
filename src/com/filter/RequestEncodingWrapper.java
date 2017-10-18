package com.filter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class RequestEncodingWrapper extends HttpServletRequestWrapper {
	
	public RequestEncodingWrapper(HttpServletRequest request) {
		//必须调用父类构造方法，因为父类的构造方法含有参数，所以必须要显式调用
		super(request);
	}
	//重新定义getParameter方法
	
	/* 将URL编码转换为utf-8编码，执行后中文字符可以在控制台和网页中正常显示
	 * 将转义字符重新编码使得转义后的中文可以在控制台正常显示，可以正常被敏感字符过滤器过滤
	 * 课本上使用的方法是
	 * if(value!=null&&!"".equals(value)){
	 * 		value=new String(value.trim().getBytes("ISO-8859-1"),encoding);
	 * }
	 * 使用GET方法提交，执行了request封装器后在两个pageEncoding为UTF-8的网页中显示出来的结果都为"??"
	 * 用post方法则显示效果正常
	 **/
	
	public String getParameter(String name){
		String value=getRequest().getParameter(name);
		//System.out.println("中国="+(char)20013+(char)25991);
		System.out.println("value="+value);
		if(value.indexOf("&#")!=-1){
			if(getNumber(value)!=""){
				String[] str=value.split(";");
				value="";
				for(String s:str){
					s=getNumber(s);
					System.out.println("s="+s);
					int unicode=Integer.parseInt(s);
					System.out.println("单个字符打印："+(char)unicode);
					value+=(char)unicode;
				}
			}
		}
		System.out.println("value0="+value);
		return value;
	}
	
	public String getNumber(String str){
		String str1="";
		if(str!=null&&!"".equals(str)){
			for(int i=0;i<str.length();i++){
				if(str.charAt(i)>=48&&str.charAt(i)<=57){
					str1+=str.charAt(i);
				}
			}
		}
		return str1;
	}
}
