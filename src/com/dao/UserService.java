package com.dao;

import java.util.ArrayList;
import java.util.List;

import com.bean.Comment;
import com.bean.Item;
import com.bean.User;

public class UserService{
	
	//实例化数据库连接类和接口类（DAO）
	private Dconn dbconn=null;
	private IUserDao dao=null;
	
	//在构造方法中实例化数据库连接，同时实例化DAO对象
	public UserService()throws Exception{
		//实例化数据库连接对象
		this.dbconn=new Dconn();
		//实例化UserDao的实现类
		this.dao=new UserDaoImpl(this.dbconn.getConnection());
	}

	
	public boolean addUser(User user) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		try{
			flag = dao.addUser(user);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbconn.close();
		}
		return flag;
	}

	
	public User findUserByUsername(String username) throws Exception {
		// TODO Auto-generated method stub
		User user = new User();
		try{
			user = dao.findUserByUsername(username);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbconn.close();
		}
		return user;
	}

	
	public List<Item> findItemByKey(String key) throws Exception {
		// TODO Auto-generated method stub
		List<Item> list = new ArrayList<Item>();
		try{
			list = dao.findItemByKey(key);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbconn.close();
		}
		return list;
	}

	
	public boolean alterUserPsw(String username, String password) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		try{
			flag = dao.alterUserPsw(username, password);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbconn.close();
		}
		return flag;
	}

	
	public boolean alterUserTeleNum(String username, String teleNum) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		try{
			flag = dao.alterUserTeleNum(username, teleNum);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbconn.close();
		}
		return flag;
	}

	 
	public boolean alterUserImg(String username, String userImg) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		try{
			flag = dao.alterUserImg(username, userImg);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbconn.close();
		}
		return flag;
	}

	 
	public Item findItemByID(int ID) throws Exception {
		// TODO Auto-generated method stub
		Item item = new Item();
		try{
			item = dao.findItemByID(ID);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbconn.close();
		}
		return item;
	}

	 
	public List<Item> findCartByUsername(String username) throws Exception {
		// TODO Auto-generated method stub
		List<Item> list = new ArrayList<Item>();
		try{
			list = dao.findCartByUsername(username);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbconn.close();
		}
		return list;
	}
	
	 
	public List<Item> findItemByType(String type) throws Exception {
		// TODO Auto-generated method stub
		List<Item> list = new ArrayList<Item>();
		try{
			list = dao.findItemByType(type);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbconn.close();
		}
		return list;
	}

	 
	public List<Item> findLatestItem(int num) throws Exception {
		// TODO Auto-generated method stub
		List<Item> list = new ArrayList<Item>();
		try{
			list = dao.findLatestItem(num);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbconn.close();
		}
		return list;
	}

	 
	public boolean decreaseItemStock(int ID, int num) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		try{
			flag = dao.decreaseItemStock(ID, num);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbconn.close();
		}
		return flag;
	}

	 
	public boolean addComment(Comment comment) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		try{
			flag = dao.addComment(comment);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbconn.close();
		}
		return flag;
	}

	 
	public List<Comment> findCommentByItemID(int ID) throws Exception {
		// TODO Auto-generated method stub
		List<Comment> list = new ArrayList<Comment>();
		try{
			list = dao.findCommentByItemID(ID);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbconn.close();
		}
		return list;
	}

	 
	public List<Comment> findCommentByUsername(String username) throws Exception {
		// TODO Auto-generated method stub
		List<Comment> list = new ArrayList<Comment>();
		try{
			list = dao.findCommentByUsername(username);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbconn.close();
		}
		return list;
	}

	 
	public boolean DeleteComment(String username, int ItemID) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		try{
			flag = dao.DeleteComment(username, ItemID);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbconn.close();
		}
		return flag;
	}

	 
	public boolean addCart(String username, int ItemID, int num) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		try{
			flag = dao.addCart(username, ItemID, num);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.dbconn.close();
		}
		return flag;
	}

	 
	public boolean findCartByPrimaryKey(String username, int ItemID) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		try{
			flag = dao.findCartByPrimaryKey(username, ItemID);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.dbconn.close();
		}
		return flag;
	}

	 
	public List<Item> deleteCartByPrimaryKey(String username, int ItemID) throws Exception {
		// TODO Auto-generated method stub
		List<Item> list = new ArrayList<Item>();
		try{
			dao.deleteCartByPrimaryKey(username, ItemID);
			list = dao.findCartByUsername(username);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.dbconn.close();
		}
		return list;
	}
}