package com.filter;

import java.io.IOException;


import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;


@WebFilter(
		description="字符编码过滤器",
		filterName="encodingFilter",
		urlPatterns={"/*"},
		initParams={
			@WebInitParam(name="ENCODING",value="UTF-8")
		}
	)

public class EncodingFilter implements Filter {
	private static Logger log=Logger.getLogger("EncodingFilter");
	private String encoding="";
	private String filterName="";
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		log.debug("请求销毁");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		request.setCharacterEncoding(encoding);
		response.setCharacterEncoding(encoding);
		
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;

		System.out.println("编码："+request.getCharacterEncoding());
		
		//分别对请求和响应进行编码设置
		log.debug("请求被"+filterName+"过滤");
		req=new RequestEncodingWrapper(req);
		resp.setContentType("text/html;charset=UTF-8");
		
		//传输给过滤链过滤
		chain.doFilter(req, resp);
		log.debug("响应被"+filterName+"过滤");
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//通过filterConfig获得初始化中编码的值
		encoding=filterConfig.getInitParameter("ENCODING");
		filterName=filterConfig.getFilterName();
		if(encoding==null||"".equals(encoding)){
			encoding="UTF-8";
		}
		log.debug("获得编码值");
	}
}
