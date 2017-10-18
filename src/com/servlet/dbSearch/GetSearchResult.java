package com.servlet.dbSearch;

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

/**
 * Servlet implementation class GetSearchResult
 */
@WebServlet("/GetSearchResult")
public class GetSearchResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSearchResult() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		if("searchType".equals(type)){
			String key = request.getParameter("form_type_key");
			List<Item> list = new ArrayList<Item>();
			HttpSession session = request.getSession();
			try{
				list = DAOFactory.getIEmpDaoInstance().findItemByType(key);
			}catch(Exception e){
				e.printStackTrace();
			}

			List<String> state = new ArrayList<String>();
			state.add("0");
			state.add("3");
			request.setAttribute("ItemList", list);
			session.setAttribute("pageState",state);
			RequestDispatcher dispatcher = request.getRequestDispatcher("show_search.jsp");
			dispatcher.include(request, response);
			return;
		}else if("searchItem".equals(type)){
			int ItemID = Integer.parseInt(request.getParameter("itemID"));
			Item item = new Item();
			try{
				item = DAOFactory.getIEmpDaoInstance().findItemByID(ItemID);
			}catch(Exception e){
				e.printStackTrace();
			}
			request.setAttribute("Item", item);
			RequestDispatcher dispatcher = request.getRequestDispatcher("show.jsp");
			dispatcher.include(request, response);
			return;
		}else if("searchKey".equals(type)){
			String key = request.getParameter("key");
			HttpSession session = request.getSession();
			List<Item> list = new ArrayList<Item>();
			try{
				list = DAOFactory.getIEmpDaoInstance().findItemByKey(key);
			}catch(Exception e){
				e.printStackTrace();
			}
			List<String> state = new ArrayList<String>();
			state.add("0");
			state.add("3");
			request.setAttribute("ItemList", list);
			session.setAttribute("pageState",state);
			RequestDispatcher dispatcher = request.getRequestDispatcher("show_search.jsp");
			dispatcher.include(request, response);
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
