package dao;

import java.sql.SQLException;

import com.page.controller.WelcomeController;

public class TestMain {
	public static void main(String[] args) throws SQLException{
		UserDao dao=new UserDao();
		dao.login("1","1");
	}
}
