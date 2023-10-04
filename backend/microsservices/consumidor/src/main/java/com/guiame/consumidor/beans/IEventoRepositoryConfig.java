package com.guiame.consumidor.beans;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.google.cloud.firestore.Firestore;
import com.guiame.consumidor.domain.evento.repositories.IEventoRepository;
import com.guiame.consumidor.repositories.FirestoreEventoRepository;

@Configuration
public class IEventoRepositoryConfig {
    @Value("${firestore.collection}")
    private String firestoreCollectionName;

    @Autowired
    private Firestore firestoreDb;

    @Bean
    public IEventoRepository defaultIEventoRepository() {
        return new FirestoreEventoRepository(this.firestoreDb, this.firestoreCollectionName);
    }
}
