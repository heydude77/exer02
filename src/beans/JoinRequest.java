package beans;

import java.util.Map;

public class JoinRequest {
	
	private String id;
	private String password;
	private String name;
	private String gender;
	private String confirmPassword;
	
	public void setId(String id) {
		this.id=id;
	}
	public String getId() {
		return id;
	}
	
	public void setName(String name) {
		this.name=name;
	}
	public String getName() {
		return name;
	}
	
	public void setPw(String pw) {
		this.password=pw;
	}
	public String getPassword() {
		return password;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword=confirmPassword;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	
	public void setGender(String gender) {
		this.gender=gender;
	}
	public String getGender() {
		return gender;
	}
	
	public boolean isPasswordEqualToConfirm() {
		return password !=null && password.equals(confirmPassword);
	}
	
	public void validate(Map<String, Boolean> errors) {
		checkEmpty(errors, id, "id");
		checkEmpty(errors, name, "name");
		checkEmpty(errors, password, "password");
		checkEmpty(errors, confirmPassword, "confirmPassword");
		checkEmpty(errors, gender, "gender");
		if (!errors.containsKey("confirmPassword")) {
			if(!isPasswordEqualToConfirm()) {
				errors.put("notMatch", Boolean.TRUE);
			}
		}
	}
	private void checkEmpty(Map<String, Boolean> errors, String value, String fieldName) {
		if(value==null || value.isEmpty()) {
			errors.put(fieldName, Boolean.TRUE);
		}
	}
		
	
	
}
