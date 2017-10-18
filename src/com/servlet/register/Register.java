package com.servlet.register;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.lang3.StringUtils;

import com.bean.User;
import com.dao.DAOFactory;


/**
 * Servlet implementation class Register
 */
@MultipartConfig(location="/Users/elpis/FilesForExperiment6/userImg", maxFileSize=1024*1024*500)
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = new User();
		Part part = request.getPart("img");
		String username = request.getParameter("username");
        user.setUsername(username);
        user.setPassword(request.getParameter("psw"));
        user.setTeleNum(request.getParameter("tel"));
        String suffix = getSuffix(part);
        part.write(username+"."+suffix);
        user.setUserImgPath("/userImg/"+username+"."+suffix);
        try{
        	DAOFactory.getIEmpDaoInstance().addUser(user);
        }catch(Exception e){
        	e.printStackTrace();
        }
        request.getRequestDispatcher("rSuccess.jsp").forward(request, response);
	}
	
    private String getSuffix(Part part){
    	if(part == null)
    		return null;
    	String filename = part.getHeader("content-disposition");
    	if(StringUtils.isBlank(filename)){
    		return null;
    	}
    	return StringUtils.substringBetween(filename, "." , "\"");
    }

}
