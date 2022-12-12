package PlantParenthood.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import PlantParenthood.models.Plant;
import PlantParenthood.models.User;
import PlantParenthood.services.PlantService;
import PlantParenthood.services.UserService;

@Controller
public class PlantController {

	@Autowired
	PlantService plantService;

	@Autowired
	UserService userService;

	@GetMapping("/homepage")
	public String home(HttpSession inSession, Model model) {
		if (inSession.getAttribute("loggedIn") != null) {
			User newUser = (User) inSession.getAttribute("loggedIn");
			model.addAttribute("plants", plantService.allPlants());
			model.addAttribute("loggedIn", (User) inSession.getAttribute("loggedIn"));
			System.out.println(newUser.getId());
			return "garden.jsp";
		} else {
			return "redirect:/logout";
		}
	}

//	Check to make sure User is in Session and if so bring to Add Plant page
	@GetMapping("/plant/add")
	public String addPlant(@ModelAttribute("newPlant") Plant plant, HttpSession inSession) {

		if (inSession.getAttribute("loggedIn") == null) {
			return "garden.jsp";
		} else {
			return "addPlant.jsp";
		}
	}

//	Backend Page for sending our Plant Object into existence or pushing back errors upon creation.
	@PostMapping("/plant/addPlant")
	public String createPlant(
			@Valid
			@ModelAttribute("newPlant") Plant plant,
			BindingResult results) {
		
			if(results.hasErrors()) {
			System.out.println(results);
				return "addPlant.jsp";
		}
			else {
			plantService.createPlant(plant);
				return "redirect:/homepage";
		}
	}

	
//	Grab one plant by ID if you the user is in Session 

	@GetMapping("/plant/info/{id}")
	public String plantDetails(
			@PathVariable("id") Long Id,
			Model model,
			HttpSession inSession) {
		
		if(inSession.getAttribute("loggedIn")!=null) {
			
			Plant plant = plantService.findPlant(Id);
			model.addAttribute("plant", plant);
			return "laPlant.jsp";
		}
		else {
			return "redirect:/logout";
		}
	}
	
//	Grab page to Edit our Plant object.
	@GetMapping("/plant/repotting/{id}")
	public String resoil(
			@PathVariable("id") Long id,
			Model model,
			HttpSession inSession) {
		
		if(inSession.getAttribute("loggedIn")==null) {
			return "redirect:/logout";
		}
		else {
			Plant resoil = plantService.findPlant(id);
			System.out.println(resoil.getId());
			model.addAttribute("resoil", resoil);
			
				return "resoil.jsp";
		}
	}
	
//	Update out changes to the object model pending no errors with validations
	@PutMapping("/plant/repotted/{id}")
	public String repotted(
			@PathVariable("id") Long id,
			@Valid
			@ModelAttribute ("resoil") Plant plant,
			BindingResult results,
			HttpSession inSession) {
		
		if(inSession.getAttribute("loggedIn")==null) {
			return "homepage.jsp";
		}
		if(results.hasErrors()) {
			System.out.println(results);
			return "resoil.jsp";
		}
		else {
			plantService.updatePlant(plant);
			return "redirect:/homepage";
		}
	} 
	
//	KILL OUR PLANT :(((((
	@PostMapping("/overwater/{id}")
	public String overWater(@PathVariable("id") Long id) {
		
		plantService.deletePlant(id);
		System.err.println(id);
		return "redirect:/homepage";
	}

	
	
	
	
	
}
