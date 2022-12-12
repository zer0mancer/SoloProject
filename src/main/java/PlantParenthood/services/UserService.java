package PlantParenthood.services;



import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

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
	
//	Grab one user (by id)
	public User findUser(Long id) {
		return userRepo.findById(id).orElse(null);
	}
	
//	Grab user by Email
	public  User findByEmail(String email){
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
	
//	public User register(User newUser, BindingResult results) {
//		
//		Optional <User> potentialUser = userRepo.findByEmail(newUser.getEmail());
//		if(potentialUser.isPresent()) {
//			results.rejectValue("email", "used", "Email is already in use!");
//			results.hasErrors();
//			
//		}
//		if(!newUser.getPassword().equals(newUser.getConfirmPassword())) {
//			results.rejectValue("password", "mismatched", "Passwords don't match!");
//			results.hasErrors();
//			return null;
//		}
//		else {
//			String safePW = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
//			newUser.setPassword(safePW);
//			return this.userRepo.save(newUser);
//		}
//			
//	}

//	Registering user and saving their password with Bcrypt salt.
	public User register(User register) {
		String safePass = BCrypt.hashpw(register.getPassword(), BCrypt.gensalt());
		register.setPassword(safePass);
		userRepo.save(register);
		return null;
	}  
	
//	Checking to see if password and confirm password match. Double Checking if email is in use.
	public void preRegister(User newUser, Errors denied) {
		if (!newUser.getPassword().equals(newUser.getConfirmPassword())) {
			denied.rejectValue("password", "mismatched", "Your passwords don't match");
		}
		if (userRepo.findByEmail(newUser.getEmail())!=null) {
			denied.rejectValue("email", "taken","Email already in use with existing account");
		}
	}
	
//	public User validate(Login newLogin, BindingResult errors) {
//		Optional <User> existingUser = userRepo.findByEmail(newLogin.getEmail());
//		if(existingUser.isEmpty()) {
//			errors.rejectValue("email", "missingEmail", "That Email was not found");
//			
//		}
//		if (!BCrypt.checkpw(newLogin.getPassword(),existingUser.get().getPassword())) {
//				errors.rejectValue("password", "mismatched", "Password is not the same as saved on database!");
//				return null;
//		}
//			return existingUser.get();
//		}
	
//	Checking to see if the typed in email exists. Crosschecking if the password for the email is correct.
	public boolean login(Login newLogin, Errors denied) {
		User existingUser = userRepo.findByEmail(newLogin.getEmail());
		if(existingUser == null) {
			denied.rejectValue("matches","There is no account for that email");
				return false;
		}
		else {
			if (!BCrypt.checkpw(newLogin.getPassword(), existingUser.getPassword())) {
				denied.rejectValue("password", "matches", "Incorrect Password!");
				return false;
			}
		}
			return true;
	}
	
//	Checking to see if email is matched with one on file. Checking that password is correct. 
	public boolean verify(Login login, Errors denied) {
		User findAccount = userRepo.findByEmail(login.getEmail());
		if(findAccount == null) {
			denied.rejectValue("email", "missingAccount", "Account does not exist matching that email");
				return false;
		}
		else {
			if(!BCrypt.checkpw(login.getPassword(), findAccount.getPassword())) {
				denied.rejectValue("password", "matching", "Passwords do not match");
					return false;
			}
		}
			return true;
	}
			
				
	
}
