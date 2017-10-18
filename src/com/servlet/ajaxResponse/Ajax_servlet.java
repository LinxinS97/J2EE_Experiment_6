package com.servlet.ajaxResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Item;
import com.bean.User;
import com.dao.DAOFactory;

/**
 * Servlet implementation class Ajax_servlet
 */
@WebServlet("/Ajax_servlet")
public class Ajax_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Ajax_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String type = request.getParameter("type");
		if("ifUsernameExist".equals(type)){
			String username = request.getParameter("username");
			String flag = "false";
			try{
				if(DAOFactory.getIEmpDaoInstance().findUserByUsername(username) != null){
					flag = "true";
				}else{
					flag = "false";
				}
			}catch(Exception e){
				e.printStackTrace();
			}
	        PrintWriter out = response.getWriter();
	        out.write(flag);
	        out.flush();
	        out.close();
	        return;
		}else if("ifLogin".equals(type)){
			String flag = "false";
			HttpSession session = request.getSession(false);
			if(session.getAttribute("loginUser") != null)
				flag = "true";
			else
				flag = "false";
			PrintWriter out = response.getWriter();
	        out.write(flag);
	        out.flush();
	        out.close();
	        return;
		}else if("logout".equals(type)){
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", null);
			return;
		}else if("addCart".equals(type)){
			String flag = "false";
			HttpSession session = request.getSession();
			List<Item> list = new ArrayList<Item>();
			if(session.getAttribute("loginUser") == null){
				flag = "unLogin";
				PrintWriter out = response.getWriter();
		        out.write(flag);
		        out.flush();
		        out.close();
		        return;
			}else{
				int ItemID = Integer.parseInt(request.getParameter("ItemID"));
				int num = Integer.parseInt(request.getParameter("num"));
				User user = (User) session.getAttribute("loginUser");
				String username = user.getUsername();
				try{
					if(DAOFactory.getIEmpDaoInstance().findCartByPrimaryKey(username, ItemID)){
						flag = "isExist";
						PrintWriter out = response.getWriter();
				        out.write(flag);
				        out.flush();
				        out.close();
				        return;
					}
					if(DAOFactory.getIEmpDaoInstance().addCart(username, ItemID, num)){
						flag = "true";
						list = DAOFactory.getIEmpDaoInstance().findCartByUsername(username);
						//更新购物车
						session.setAttribute("cart", list);
						PrintWriter out = response.getWriter();
				        out.write(flag);
				        out.flush();
				        out.close();
				        return;
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}else if("deleteCart".equals(type)){
			HttpSession session=request.getSession();
			User user = (User)session.getAttribute("loginUser");
			String username = user.getUsername();
			int itemID = Integer.parseInt(request.getParameter("itemID"));
			List<Item> list = new ArrayList<Item>();
			try{
				list = DAOFactory.getIEmpDaoInstance().deleteCartByPrimaryKey(username, itemID);
			}catch(Exception e){
				e.printStackTrace();
			}
			//更新购物车
			session.setAttribute("cart", list);
			return;
		}else if("changePageState".equals(type)){
			String changeType = request.getParameter("changeType");
			HttpSession session=request.getSession();
			List<String> state = new ArrayList<String>();
			List<Item> list = new ArrayList<Item>();
			state = (ArrayList<String>)session.getAttribute("pageState");
			list = (ArrayList<Item>)session.getAttribute("cart");
			int size = list.size();
			//按页码
			if("pageNum".equals(changeType)){
				int num = Integer.parseInt(request.getParameter("pageNum"));
				state.clear();
				state.add(num*4-4+"");
				state.add(num*4-1+"");
				session.setAttribute("pageState", state);
				return;
			//下一页
			}else if("pageNext".equals(changeType)){
				int start = Integer.parseInt(state.get(0));
				int end = Integer.parseInt(state.get(1));
				if(end >= size){
					return;
				}
				state.clear();
				state.add(start+4+"");
				state.add(end+4+"");
				session.setAttribute("pageState", state);
				return;
			//上一页	
			}else if("pagePrevious".equals(changeType)){
				int start = Integer.parseInt(state.get(0));
				int end = Integer.parseInt(state.get(1));
				if(start == 0){
					return;
				}
				state.clear();
				state.add(start-4+"");
				state.add(end-4+"");
				session.setAttribute("pageState", state);
				return;
			}
		}else if("perchaseGo_cart".equals(type)){
			String param1 = request.getParameter("itemList");
			String param2 = request.getParameter("numList");
			String[] itemList = param1.split(",");
			String[] numList = param2.split(",");
			List<String> numList_temp = new ArrayList<String>();
			for(String str:numList){
				if(!"".equals(str)){
					numList_temp.add(str);
				}
			}
			numList = numList_temp.toArray(new String[0]);
			List<Item> list = new ArrayList<Item>();
			HttpSession session = request.getSession();
			for(int i=0; i<itemList.length; i++){
				try{
					Item item = new Item();
					item = DAOFactory.getIEmpDaoInstance().findItemByID(Integer.parseInt(itemList[i]));
					item.setNum(numList[i]);
					list.add(item);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			session.setAttribute("perchaseItems", list);
		}else if("perchaseGo_show".equals(type)){
			String param1 = request.getParameter("itemID");
			String param2 = request.getParameter("num");
			List<Item> list = new ArrayList<Item>();
			HttpSession session = request.getSession();
			try{
				Item item = new Item();
				item = DAOFactory.getIEmpDaoInstance().findItemByID(Integer.parseInt(param1));
				item.setNum(param2);
				list.add(item);
			}catch(Exception e){
				e.printStackTrace();
			}
			session.setAttribute("perchaseItems", list);
		}else if("perchaseConform".equals(type)){
			HttpSession session = request.getSession();
			List<Item> list = (ArrayList<Item>)session.getAttribute("perchaseItems");
			List<Item> cart = new ArrayList<Item>();
			cart = (ArrayList<Item>)session.getAttribute("cart");
			User user = new User();
			user = (User)session.getAttribute("loginUser");
			try{
				for(int i=0; i<list.size(); i++){
					System.out.println("username="+user.getUsername());
					System.out.println("itemID="+list.get(i).getID());
					System.out.println("num="+list.get(i).getNum());
					DAOFactory.getIEmpDaoInstance().deleteCartByPrimaryKey(user.getUsername(), Integer.parseInt(list.get(i).getID()));
					DAOFactory.getIEmpDaoInstance().decreaseItemStock(Integer.parseInt(list.get(i).getID()), Integer.parseInt(list.get(i).getNum()));
					cart = DAOFactory.getIEmpDaoInstance().findCartByUsername(user.getUsername());
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			session.removeAttribute("perchaseItem");
			session.setAttribute("cart", cart);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String type = request.getParameter("type");
		String username = request.getParameter("username");
		String psw = request.getParameter("password");
		if("login".equals(type)){
			User user = new User();
			try{
				user = DAOFactory.getIEmpDaoInstance().findUserByUsername(username);
			}catch(Exception e){
				e.printStackTrace();
			}
			if(user != null){
				if(!psw.equals(user.getPassword())){
					PrintWriter out = response.getWriter();
			        out.write("pswError");
			        out.flush();
			        out.close();
			        return;
				}else{
					HttpSession session = request.getSession(false);
					session.setAttribute("loginUser", user);
					List<String> state = new ArrayList<String>();
					state.add("0");
					state.add("3");
					List<Item> list = new ArrayList<Item>();
					try{
						list = DAOFactory.getIEmpDaoInstance().findCartByUsername(username);
					}catch(Exception e){
						e.printStackTrace();
					}
					session.setAttribute("cart", list);
					session.setAttribute("pageState",state);
					PrintWriter out = response.getWriter();
			        out.write("true");
			        out.flush();
			        out.close();
			        return;
				}
			}else{
				PrintWriter out = response.getWriter();
		        out.write("unknownUsername");
		        out.flush();
		        out.close();
		        return;
			}
		}
	}
}
