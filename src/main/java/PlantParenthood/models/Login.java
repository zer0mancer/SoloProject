package PlantParenthood.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class Login {
	
	@NotEmpty(message="Please enter your EMAIL in order to login")
	@Email(message="a valid EMAIL is required")
	private String email;
	
	@NotEmpty(message="Please provide a PASSWORD to login")
	@Size(message="your PASSWORD must be between 8-22 characters")
	private String password;
	
	public Login(String email, String password) {
		this.email = email;
		this.password = password;
		
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public Login() {}

}
