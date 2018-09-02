package beans;

public class Member {
	
	private String id;
	private String password;
	private String name;
	private String gender;
	
	public Member(String id, String password, String name, String gender) {
		this.id=id;
		this.password=password;
		this.name=name;
		this.gender=gender;
	}
	
	public String getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getPassword() {
		return password;
	}
	public String getGender() {
		return gender;
	}
	public boolean matchPassword(String pw) {
		return password.equals(pw);
	}
}

