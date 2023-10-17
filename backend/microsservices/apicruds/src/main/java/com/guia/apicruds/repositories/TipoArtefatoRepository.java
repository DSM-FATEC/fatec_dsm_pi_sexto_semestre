package com.guia.apicruds.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.guia.apicruds.models.TipoArtefato;

public interface TipoArtefatoRepository extends JpaRepository<TipoArtefato,Integer> {
    
}
