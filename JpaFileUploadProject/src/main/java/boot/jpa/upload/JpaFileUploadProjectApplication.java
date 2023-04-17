package boot.jpa.upload;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan({"board.*"})
@EntityScan("board.*")
@EnableJpaRepositories("board.*")
public class JpaFileUploadProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(JpaFileUploadProjectApplication.class, args);
	}

}
