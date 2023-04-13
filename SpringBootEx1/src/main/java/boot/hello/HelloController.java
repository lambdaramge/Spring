package boot.hello;

import java.util.HashMap;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

	@GetMapping("/bts/hello")
	public HashMap<String, String> hello(){
		HashMap<String, String> data=new HashMap<>();
		
		data.put("message", "Hava a nice day!");
		
		return data;
	}
}
