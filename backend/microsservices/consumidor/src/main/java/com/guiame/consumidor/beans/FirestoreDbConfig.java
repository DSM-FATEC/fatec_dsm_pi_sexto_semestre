package com.guiame.consumidor.beans;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.FirestoreOptions;

@Configuration
public class FirestoreDbConfig {
    @Value("${firestore.project}")
    private String firestoreProjectId;

    @Bean
    public Firestore defaultFirestore() throws Exception {
        FirestoreOptions options = FirestoreOptions.getDefaultInstance()
            .toBuilder()
            .setProjectId(this.firestoreProjectId)
            .setCredentials(GoogleCredentials.getApplicationDefault())
            .build();

        return options.getService();
    }
}
