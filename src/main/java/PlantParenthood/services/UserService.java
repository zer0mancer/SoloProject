package PlantParenthood.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import PlantParenthood.models.Login;
import PlantParenthood.models.User;
import PlantParenthood.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	UserRepository userRepo;
	
//	This is the same thing but sometimes it doesn't work so I try both.
	public UserService(UserRepository userRepo) {
		this.userRepo = userRepo;
	}
	
//	Grab all users
	public List <User>allUsers(){
		return userRepo.findAll();
	}
//	Grab one user (by id)
	public User findUser(Long id) {
		return this.userRepo.findById(id).get();
	}
	
//	Grab user by Email
	public Optional <User> findByEmail(String email){
		return userRepo.findByEmail(email);
	}
	
//	Grab instance of user and save to date instance with new changes
	public User updateUser(User user) {
		return this.userRepo.save(user);
	}
	
//	Delete this object instance by its unique id
	public void delete(Long id) {
		this.userRepo.deleteById(id);
	}
	
	public User register(User newUser, BindingResult results) {
		
		Optional <User> potentialUser = userRepo.findByEmail(newUser.getEmail());
		if(potentialUser.isPresent()) {
			results.rejectValue("email", "used", "Email is already in use!");
			results.hasErrors();
			
		}
		if(!newUser.getPassword().equals(newUser.getConfirmPassword())) {
			results.rejectValue("password", "mismatched", "Passwords don't match!");
			results.hasErrors();
			return null;
		}
		else {
			String safePW = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
			newUser.setPassword(safePW);
			return this.userRepo.save(newUser);
		}
			
	}
	
	public User validate(Login newLogin, BindingResult errors) {
		Optional <User> existingUser = userRepo.findByEmail(newLogin.getEmail());
		if(existingUser.isEmpty()) {
			errors.rejectValue("email", "missingEmail", "That Email was not found");
			
		}
		if (!BCrypt.checkpw(newLogin.getPassword(),existingUser.get().getPassword())) {
				errors.rejectValue("password", "mismatched", "Password is not the same as saved on database!");
				return null;
		}
			return existingUser.get();
		}
	
}
