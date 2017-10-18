package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.bean.Comment;
import com.bean.Item;
import com.bean.User;

public class UserDaoImpl implements IUserDao{
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	
	public UserDaoImpl(Connection conn){
		this.conn=conn;
	}
	
	@Override
	public boolean addUser(User user) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql="insert into user values(?,?,?,?)";
		//插入
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setNString(1, user.getUsername());
		this.pstmt.setString(2, user.getPassword());
		this.pstmt.setString(3, user.getTeleNum());
		this.pstmt.setString(4, user.getUserImgPath());
		if(this.pstmt.executeUpdate() > 0)
			flag = true;
		
		this.pstmt.close();
		return flag;
	}
	
	@Override
	public boolean alterUserPsw(String username, String password) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "update user set password=? where username=?";
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setString(1, password);
		this.pstmt.setNString(2, username);
		
		if(this.pstmt.executeUpdate() > 0)
			flag = true;
		this.pstmt.close();
		return flag;
	}

	@Override
	public boolean alterUserTeleNum(String username, String teleNum) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "update user set teleNum=? where username=?";
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setString(1, teleNum);
		this.pstmt.setNString(2, username);
		
		if(this.pstmt.executeUpdate() > 0)
			flag = true;
		this.pstmt.close();
		return flag;
	}
	
	@Override
	public boolean alterUserImg(String username, String userImg) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "update user set userImg=? where username=?";
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setString(1, userImg);
		this.pstmt.setNString(2, username);
		
		if(this.pstmt.executeUpdate() > 0)
			flag = true;
		this.pstmt.close();
		return flag;
	}
	
	@Override
	public User findUserByUsername(String username) throws Exception {
		// TODO Auto-generated method stub
		String sql = "";
		User user = new User();
		
		sql = "select * from user where username=?";
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setString(1, username);
		
		ResultSet rs = this.pstmt.executeQuery();
		if(rs.next()){
			user.setUsername(username);
			user.setPassword(rs.getString(2));
			user.setTeleNum(rs.getString(3));
			user.setUserImgPath(rs.getString(4));
		}else{
			user = null;
		}
		this.pstmt.close();
		rs.close();
		return user;
	}
	
	@Override
	public List<Item> findItemByKey(String key)throws Exception {
		// TODO Auto-generated method stub
		List<Item> list = new ArrayList<Item>();
		String sql = "";
		if(key != ""){
			sql = "select * from item where name like? or type like?";
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setString(1, "%"+key+"%");
			this.pstmt.setString(2, "%"+key+"%");
		}else{
			sql = "select * from item";
			this.pstmt = conn.prepareStatement(sql);
		}
		ResultSet rs = this.pstmt.executeQuery();
		while(rs.next()){
			Item item = new Item();
			item.setID(rs.getInt(1)+"");
			item.setType(rs.getNString(2));
			item.setName(rs.getNString(3));
			item.setPrice(rs.getString(4));
			item.setStock(rs.getString(5));
			item.setItemImgPath(rs.getString(6));
			list.add(item);
		}
		this.pstmt.close();
		rs.close();
		return list;
	}
	
	@Override
	public Item findItemByID(int ID) throws Exception {
		// TODO Auto-generated method stub
		String sql = "";
		sql = "select * from item where ID=?";
		Item item = new Item();
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setInt(1, ID);
		
		ResultSet rs = this.pstmt.executeQuery();
		while(rs.next()){
			item.setID(rs.getInt(1)+"");
			item.setType(rs.getNString(2));
			item.setName(rs.getNString(3));
			item.setPrice(rs.getString(4));
			item.setStock(rs.getString(5));
			item.setItemImgPath(rs.getString(6));
		}
		this.pstmt.close();
		rs.close();
		return item;
	}

	@Override
	public List<Item> findLatestItem(int num) throws Exception {
		// TODO Auto-generated method stub
		List<Item> list = new ArrayList<Item>();
		String sql = "select * from item order by ID desc limit "+num;
		this.pstmt = conn.prepareStatement(sql);
		ResultSet rs = this.pstmt.executeQuery();
		while(rs.next()){
			Item item = new Item();
			item.setID(rs.getInt(1)+"");
			item.setType(rs.getNString(2));
			item.setName(rs.getNString(3));
			item.setPrice(rs.getString(4));
			item.setStock(rs.getString(5));
			item.setItemImgPath(rs.getString(6));
			list.add(item);
		}
		this.pstmt.close();
		rs.close();
		return list;
	}
	
	@Override
	public List<Item> findCartByUsername(String username) throws Exception {
		// TODO Auto-generated method stub
		List<Item> list = new ArrayList<Item>();
		String sql = "select ID,name,price,itemImg,num,stock from item left join shopping_cart on item.ID=shopping_cart.ItemID where username='"+username+"'";
		this.pstmt = conn.prepareStatement(sql);
		ResultSet rs = this.pstmt.executeQuery();
		while(rs.next()){
			Item item = new Item();
			item.setID(rs.getString(1));
			item.setName(rs.getNString(2));
			item.setPrice(rs.getString(3));
			item.setItemImgPath(rs.getString(4));
			item.setNum(rs.getString(5));
			item.setStock(rs.getString(6));
			list.add(item);
		}
		this.pstmt.close();
		rs.close();
		return list;
	}
	
	@Override
	public List<Item> findItemByType(String type) throws Exception {
		// TODO Auto-generated method stub
		List<Item> list = new ArrayList<Item>();
		String sql = "select * from item where type=?";
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setString(1, type);
		ResultSet rs = this.pstmt.executeQuery();
		while(rs.next()){
			Item item = new Item();
			item.setID(rs.getString(1));
			item.setType(type);
			item.setName(rs.getNString(3));
			item.setPrice(rs.getString(4));
			item.setStock(rs.getString(5));
			item.setItemImgPath(rs.getString(6));
			list.add(item);
		}
		this.pstmt.close();
		rs.close();
		return list;
	}
	
	@Override
	public boolean decreaseItemStock(int ID, int num) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "update item set stock=stock-? where ID="+ID;
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setInt(1, num);
		if(this.pstmt.executeUpdate() > 0){
			flag = true;
		}
		this.pstmt.close();
		return flag;
	}
	
	@Override
	public boolean addComment(Comment comment) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "insert into comment values(?,?,?,?)";
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setNString(1, comment.getUsername());
		this.pstmt.setInt(2, comment.getItemID());
		this.pstmt.setNString(3, comment.getComment());
		this.pstmt.setString(4, comment.getDate());
		
		if(this.pstmt.executeUpdate() > 0){
			flag = true;
		}
		this.pstmt.close();
		return flag;
	}
	
	@Override
	public List<Comment> findCommentByItemID(int ID) throws Exception {
		// TODO Auto-generated method stub
		List<Comment> list = new ArrayList<Comment>();
		String sql = "select * from comment where ItemID="+ID;
		this.pstmt = conn.prepareStatement(sql);
		ResultSet rs = this.pstmt.executeQuery();
		while(rs.next()){
			Comment comm = new Comment();
			comm.setUsername(rs.getNString(1));
			comm.setItemID(ID);
			comm.setComment(rs.getNString(3));
			comm.setDate(rs.getString(4));
			list.add(comm);
		}
		this.pstmt.close();
		rs.close();
		return list;
	}

	@Override
	public List<Comment> findCommentByUsername(String username) throws Exception {
		// TODO Auto-generated method stub
		List<Comment> list = new ArrayList<Comment>();
		String sql = "select * from comment where username="+username;
		this.pstmt = conn.prepareStatement(sql);
		ResultSet rs = this.pstmt.executeQuery();
		while(rs.next()){
			Comment comm = new Comment();
			comm.setUsername(rs.getNString(1));
			comm.setItemID(rs.getInt(2));
			comm.setComment(rs.getNString(3));
			comm.setDate(rs.getString(4));
			list.add(comm);
		}
		this.pstmt.close();
		rs.close();
		return list;
	}

	@Override
	public boolean DeleteComment(String username, int ItemID) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "delete from comment where username=? and ItemID=?";
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setNString(1, username);
		this.pstmt.setInt(2, ItemID);
		if(this.pstmt.executeUpdate() > 0)
			flag = true;
		this.pstmt.close();
		return flag;
	}

	@Override
	public boolean addCart(String username, int ItemID, int num) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql1 = "insert into shopping_cart values(?,?,?)";
		this.pstmt = conn.prepareStatement(sql1);
		this.pstmt.setString(2, username);
		this.pstmt.setInt(1, ItemID);
		this.pstmt.setInt(3, num);
		if(this.pstmt.executeUpdate() > 0){
			flag = true;
		}
		this.pstmt.close();
		return flag;
	}

	@Override
	public boolean findCartByPrimaryKey(String username, int ItemID) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "select * from shopping_cart where username=? and ItemID=?";
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setString(1, username);
		this.pstmt.setInt(2, ItemID);
		ResultSet rs = this.pstmt.executeQuery();
		if(rs.next()){
			flag = true;
		}
		return flag;
	}

	@Override
	public void deleteCartByPrimaryKey(String username, int ItemID) throws Exception {
		// TODO Auto-generated method stub
		String sql = "delete from shopping_cart where username=? and ItemID=?";
		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setString(1, username);
		this.pstmt.setInt(2, ItemID);
		this.pstmt.executeUpdate();
		
	}
}
