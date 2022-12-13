package PlantParenthood.models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name="plants")
public class Plant {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank(message="Please enter a Plant NAME")
	@Size(min=3, max=40, message="Plant NAME must be between the values of 3-40")
	private String name;
	
	@NotBlank(message="Please enter the COLOR of the plant")
	private String color;
	
	@NotBlank(message="Please enter the Height to keep track of measurements")
	private String height;
	
	@NotBlank(message="Soil cannot be empty, we need to know how much to water it!")
	private String soil;
	
	@NotBlank(message="What, is your plant a Vampire plant?")
	private String sunlight;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getSoil() {
		return soil;
	}

	public void setSoil(String soil) {
		this.soil = soil;
	}

	public String getSunlight() {
		return sunlight;
	}

	public void setSunlight(String sunlight) {
		this.sunlight = sunlight;
	}
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;
	
	public Plant() {}
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
}
