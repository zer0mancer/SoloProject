package PlantParenthood.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name="users")
public class User {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="You need to create a USERNAME")
	@Size(min=4, max=22, message="Username must be between 4-22 characters long")
	private String username;
	
	@NotEmpty(message="Sorry, but an EMAIL is required to proceed")
	@Email(message="Please input a valid form of EMAIL")
	private String email;
	
	@NotEmpty(message="Please enter a PASSWORD to continue")
	@Size(min=8, max=22, message="Your password must be in between the values of 8-22")
	private String password;
	
	@Transient
	@NotEmpty(message="You must CONFIRM your password")
	@Size(min=8, max=22, message="Password must be in between the values of 8-22")
	private String confirmPassword;
	
	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
	private List<Plant> plants;

	public User(Long id, String username, String email, String password, String confirmPassword)
			 {
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.confirmPassword = confirmPassword;
	}
	
	public User() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public List<Plant> getPlants() {
		return plants;
	}

	public void setPlants(List<Plant> plants) {
		this.plants = plants;
	}
	
	
	
	
}
