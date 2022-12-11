package PlantParenthood.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import PlantParenthood.models.Plant;

@Repository
public interface PlantRepository extends CrudRepository <Plant, Long>{
	
	List <Plant> findAll();

}
