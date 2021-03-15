package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserInfoDao {
	//取得連線
	public static Connection getConnection() {
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/talkroom?useUnicode=true&characterEncoding=utf-8&serverTimezone=CST", "root", "1234");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	//新增會員
	public static boolean addUser(UserInfo user) {
		boolean flag=false;
		Connection con=getConnection();
		String sql="insert into userinfo(account,password,username,birthday,cellphone) values(?,?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, user.getAccount());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getUsername());
			ps.setString(4, user.getBirthday());
			ps.setString(5, user.getCellphone());
			int rows=ps.executeUpdate();
			flag=rows>0? true:false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}	
	//利用帳號密碼取得會員物件
	public static UserInfo getUserInfo(String account,String password){
		UserInfo user=null;
		Connection con=getConnection();
		String sql="select * from userinfo where account=? and password=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, account);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				user=new UserInfo(rs.getString("account"),rs.getString("password"),rs.getString("username"),rs.getString("birthday"),rs.getString("cellphone"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;		
	}
	//利用該帳號取得會員物件
	public static UserInfo getUserInfoByAccount(String account) {
		UserInfo user=null;
		Connection con=getConnection();
		String sql="select * from userinfo where account=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, account);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				user=new UserInfo(rs.getString("account"),rs.getString("password"),rs.getString("username"),rs.getString("birthday"),rs.getString("cellphone"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return user;
	}
	//修改會員資料
	public static boolean update(String account,UserInfo userNew) {
		boolean flag=false;
		UserInfo userOld=getUserInfoByAccount(account);
		if(userNew.getPassword()!=null && !userNew.getPassword().equals("")) userOld.setPassword(userNew.getPassword());
		if(userNew.getUsername()!=null && !userNew.getUsername().equals("")) userOld.setUsername(userNew.getUsername());
		if(userNew.getBirthday()!=null && !userNew.getBirthday().equals("")) userOld.setBirthday(userNew.getBirthday());
		if(userNew.getCellphone()!=null && !userNew.getCellphone().equals("")) userOld.setCellphone(userNew.getCellphone());
		Connection con=getConnection();
		String sql="update userinfo set password=?,username=?,birthday=?,cellphone=? where account=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, userOld.getPassword());
			ps.setString(2, userOld.getUsername());
			ps.setString(3, userOld.getBirthday());
			ps.setString(4, userOld.getCellphone());
			ps.setString(5, userOld.getAccount());
			int rows=ps.executeUpdate();
			flag=rows>0? true:false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return flag;		
	}
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//getConnection();
		//UserInfo user=new UserInfo("Albert","1111","小名","1986-12-27","0987515154");
		//addUser(user);
		System.out.println(getUserInfo("Albert","1111").getBirthday());
		System.out.println(getUserInfo("Albert","1111"));
		System.out.println(getUserInfo("Albert","1111").toString());
		System.out.println(getUserInfoByAccount("Albert"));

	}

}
