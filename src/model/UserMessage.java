package model;

public class UserMessage {
	private String username;
	private String message;
	private String guestNames;
	private Integer guestNumbers;
	
	public UserMessage() {
		super();
	}

	public UserMessage(String username, String message, String guestNames, Integer guestNumbers) {
		super();
		this.username = username;
		this.message = message;
		this.guestNames = guestNames;
		this.guestNumbers = guestNumbers;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getGuestNames() {
		return guestNames;
	}

	public void setGuestNames(String guestNames) {
		this.guestNames = guestNames;
	}

	public Integer getGuestNumbers() {
		return guestNumbers;
	}

	public void setGuestNumbers(Integer guestNumbers) {
		this.guestNumbers = guestNumbers;
	}
	
	
}
