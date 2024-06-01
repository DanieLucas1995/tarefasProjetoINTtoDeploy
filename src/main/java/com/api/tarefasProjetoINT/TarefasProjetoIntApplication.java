package com.api.tarefasProjetoINT;

import java.io.IOException;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class TarefasProjetoIntApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(TarefasProjetoIntApplication.class, args);

        // Abre a página index.html no navegador padrão
        try {
            String url = "http://localhost:8080/index.html";
            //Runtime.getRuntime().exec("xdg-open " + url); // Para sistemas Linux
            //Runtime.getRuntime().exec("open " + url); // Para MacOS
            Runtime.getRuntime().exec("cmd /c start " + url); // Para Windows
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(TarefasProjetoIntApplication.class);
    }
}
