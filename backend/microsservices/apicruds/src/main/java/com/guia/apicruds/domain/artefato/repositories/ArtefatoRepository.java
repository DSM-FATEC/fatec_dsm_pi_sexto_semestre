package com.guia.apicruds.domain.artefato.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.guia.apicruds.domain.artefato.entities.Artefato;

@Repository
public interface ArtefatoRepository extends JpaRepository<Artefato, Integer> {
    List<Artefato> findByWifi(String wifi);
}
