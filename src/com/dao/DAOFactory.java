package com.dao;

public class DAOFactory {
	public static UserService getIEmpDaoInstance()throws Exception{
		return new UserService();
	}
}
