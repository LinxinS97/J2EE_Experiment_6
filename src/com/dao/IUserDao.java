package com.dao;

import java.util.List;

import com.bean.Comment;
import com.bean.Item;
import com.bean.User;

public interface IUserDao {
	/**
	 * 用户注册
	 * @param User 要增加的数据对象
	 * @return 是否增加成功的标记
	 * @throws Exception 如果有异常将直接抛出
	 */
	public boolean addUser(User user)throws Exception;
	
	/**
	 * 根据用户名查询用户
	 * @param username 用户名
	 * @return 返回User对象
	 * @throws Exception 如果有异常，将直接抛出
	 */
	public User findUserByUsername(String username)throws Exception;
	
	
	/**
	 * 修改用户密码
	 * @param username 用户名
	 * @praam password 密码
	 * @return 是否修改成功的标记
	 * @throws Exception 如果有异常，将直接抛出
	 */
	public boolean alterUserPsw(String username, String password)throws Exception;
	
	/**
	 * 修改用户手机号码
	 * @param username 用户名
	 * @praam teleNum 邮箱
	 * @return 是否修改成功的标记
	 * @throws Exception 如果有异常，将直接抛出
	 */
	public boolean alterUserTeleNum(String username, String teleNum)throws Exception;
	
	/**
	 * 修改用户手机头像
	 * @param username 用户名
	 * @praam userImg 用户头像
	 * @return 是否修改成功的标记
	 * @throws Exception 如果有异常，将直接抛出
	 */
	public boolean alterUserImg(String username, String userImg)throws Exception;
	
	/**
	 * 根据商品名或类别查找商品
	 * @param key 关键字
	 * @return 返回保存商品的List对象
	 * @throws Exception 如果有异常，将直接抛出
	 */
	public List<Item> findItemByKey(String key)throws Exception;
	
	/**
	 * 根据类别查找商品
	 * @param type 类别
	 * @return 返回保存商品的List对象
	 * @throws Exception 如果有异常直接抛出
	 */
	public List<Item> findItemByType(String type)throws Exception;
	
	/**
	 * 根据商品ID查找一个商品
	 * @param ID 商品ID
	 * @return 返回Item对象
	 * @throws Exception 如果有异常将直接抛出
	 */
	public Item findItemByID(int ID)throws Exception;
	
	/**
	 * 查找一定数量的最新的物品
	 * @param num 数量
	 * @return 返回保存商品的List对象
	 * @throws Exception 如果有异常直接抛出
	 */
	public List<Item> findLatestItem(int num)throws Exception;
	
	/**
	 * 根据商品ID和用户名添加商品进入购物车
	 * @param username 用户名
	 * @param ItemID 商品ID
	 * @return 返回添加是否成功的标志
	 * @throws Exception 如果有异常直接抛出
	 */
	public boolean addCart(String username, int ItemID, int num)throws Exception;
	
	/**
	 * 根据用户名查找对应的购物车
	 * @param username 用户名
	 * @return 返回保存商品的List对象
	 * @throws Exception 如果有异常直接抛出
	 */
	public List<Item> findCartByUsername(String username)throws Exception;
	
	/**
	 * 根据用户名和商品ID查找购物车中的一件商品
	 * @param username 用户名
	 * @param ItemID 商品ID
	 * @return 返回保存商品的List对象
	 * @throws Exception 如果有异常直接抛出
	 */
	public boolean findCartByPrimaryKey(String username, int ItemID)throws Exception;
	
	/**
	 * 根据用户名和商品ID删除购物车中的一个商品
	 * @param username 用户名
	 * @param ItemID 商品ID
	 * @throws Exception 如果有异常直接抛出
	 */
	public void deleteCartByPrimaryKey(String username, int ItemID)throws Exception;
	
	/**
	 * 商品库存-num
	 * @param ID 商品ID
	 * @param num 购买数量
	 * @return 返回修改是否成功的标记
	 * @throws Exception 如果有异常直接抛出
	 */
	public boolean decreaseItemStock(int ID, int num)throws Exception;
	
	/**
	 * 添加商品评论
	 * @param comment 商品评论
	 * @return 是否添加成功的标记
	 * @throws Exception 如果有异常直接抛出
	 */
	public boolean addComment(Comment comment)throws Exception;
	
	/**
	 * 根据商品ID查找评论
	 * @param ID 商品ID
	 * @return 返回保存评论的list对象
	 * @throws Exception 如果有异常直接抛出
	 */
	public List<Comment> findCommentByItemID(int ID)throws Exception;
	
	/**
	 * 根据用户名查找评论
	 * @param username 用户名
	 * @return 返回保存评论的List对象
	 * @throws Exception 如果有异常直接抛出
	 */
	public List<Comment> findCommentByUsername(String username)throws Exception;
	
	/**
	 * 根据商品ID和用户名删除评论
	 * @param username 用户名
	 * @param itemID 商品ID
	 * @return 是否添加成功的标记
	 * @throws Exception 如果有异常直接抛出
	 */
	public boolean DeleteComment(String username, int ItemID)throws Exception;
}
