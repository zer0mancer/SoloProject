package PlantParenthood.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PlantParenthood.models.Plant;
import PlantParenthood.repositories.PlantRepository;

@Service
public class PlantService {
	
	@Autowired
	PlantRepository plantRepo;
	
//	Directory of all the plants
	public List <Plant> allPlants(){
		return this.plantRepo.findAll();
	}
	
//	Creates new instance of Plant object
	public Plant createPlant(Plant plant) {
		return plantRepo.save(plant);
	}
	
//	Grab the Plant by ID if it exists otherwise return null
	public Plant findPlant(Long id) {
		return plantRepo.findById(id).orElse(null);
	}
	
//	Grab Plant by the Object and update the new instances and save to object data
	public Plant updatePlant(Plant plant) {
		return this.plantRepo.save(plant);
	}
	
	public void deletePlant(Long id) {
		this.plantRepo.deleteById(id);
	}

}
