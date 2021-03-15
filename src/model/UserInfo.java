package model;

public class UserInfo {
	private String account;
	private String password;
	private String username;
	private String birthday;
	private String cellphone;
	
	public UserInfo() {
		super();
	}
	
	public UserInfo(String account, String password, String username, String birthday, String cellphone) {
		super();
		this.account = account;
		this.password = password;
		this.username = username;
		this.birthday = birthday;
		this.cellphone = cellphone;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}
	
	public String toString() {
		String msg="帳號: "+account+
						"\n密碼: "+password+
						"\n姓名: "+username+
						"\n生日: "+birthday+
						"\n手機: "+cellphone;
		return msg;
		
	}
	
	

	
	
	
	
	
	
	



}
