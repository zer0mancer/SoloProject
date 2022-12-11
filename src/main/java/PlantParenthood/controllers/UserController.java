package PlantParenthood.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import PlantParenthood.models.Login;
import PlantParenthood.models.User;
import PlantParenthood.repositories.UserRepository;
import PlantParenthood.services.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	UserRepository userRepo;
	
	@GetMapping("/")
	public String index(@ModelAttribute("newUser") User user, @ModelAttribute ("newLogin")Login newLogin, Model model) {
		
		
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin",new Login());
		
		return "login.jsp";
		
	}

}
