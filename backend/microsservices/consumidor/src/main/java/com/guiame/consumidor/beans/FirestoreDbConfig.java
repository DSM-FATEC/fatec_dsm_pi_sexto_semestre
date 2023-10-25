package com.guiame.consumidor.beans;

import java.util.Objects;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.google.auth.Credentials;
import com.google.auth.oauth2.ServiceAccountCredentials;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.FirestoreOptions;

@Configuration
public class FirestoreDbConfig {
    @Value("${firestore.project}")
    private String firestoreProjectId;

    @Bean
    public Firestore defaultFirestore() throws Exception {
        // Lê o arquivo firestore-sa.json dentro da pasta src/main/resources/config
        try (InputStream serviceAccount = this.getClass().getClassLoader()
                .getResourceAsStream("config/firestore-sa.json")) {
            if (Objects.isNull(serviceAccount)) {
                throw new IllegalArgumentException("Arquivo config/firestore.json não encontrado!");
            }

            // Cria uma credencial a partir da leitura da service account aberta
            // anteriormente
            Credentials serviceAccountCredentials = ServiceAccountCredentials.fromStream(serviceAccount);

            FirestoreOptions options = FirestoreOptions.getDefaultInstance()
                    .toBuilder()
                    .setProjectId(this.firestoreProjectId)
                    .setCredentials(serviceAccountCredentials)
                    .build();

            return options.getService();
        }
    }
}
