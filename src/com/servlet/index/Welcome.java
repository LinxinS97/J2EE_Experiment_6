package com.servlet.index;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Item;
import com.dao.DAOFactory;


@WebServlet("/Welcome")
public class Welcome extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Welcome() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Item> carouselItem = new ArrayList<Item>();
		List<Item> latestItem = new ArrayList<Item>();
		try{
			carouselItem = DAOFactory.getIEmpDaoInstance().findLatestItem(4);
			latestItem = DAOFactory.getIEmpDaoInstance().findLatestItem(8);
		}catch(Exception e){
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		session.setAttribute("carouselItem", carouselItem);
		session.setAttribute("latestItem", latestItem);
		RequestDispatcher dispatcher = request.getRequestDispatcher("main.jsp");
		dispatcher.include(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
