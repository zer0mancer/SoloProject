package PlantParenthood.controllers;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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
	
//	Log in existing user. If existing user does not exist from form submission reload page with errors.
//	If the User exists, log them in and set them in session
	@PostMapping("/login")
	public String login(@ModelAttribute("newLogin") Login newLogin, BindingResult form, Model model, @ModelAttribute("newUser")User newUser, HttpSession inSession) {
		
		userService.verify(newLogin, form);
		if (form.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "login.jsp";
			
		}
		User loggedIn = userService.findByEmail(newLogin.getEmail());
		inSession.setAttribute("loggedIn", loggedIn);
		return "redirect:/homepage";
		
	}
	
	@PostMapping("/register")
	public String register (@Valid @ModelAttribute ("newUser") User newUser,
			BindingResult form,
			Model model,
			@ModelAttribute("newLogin") Login newLogin,
			HttpSession inSession) {
		
		userService.preRegister(newUser, form);
		if(form.hasErrors()) {
			model.addAttribute("newLogin", new Login());
			return "login.jsp";
		}
		
		userService.register(newUser);
		inSession.setAttribute("loggedIn", newUser);
			return "redirect:/homepage";
		
	}
	
	@GetMapping("/logout")
		public String logOff(HttpSession inSession) {
			inSession.invalidate();
			return "redirect:/"; 
	}

	
	
	
	
	
	
	
	
}
