package com.guia.apicruds.domain.tipo_artefato.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.guia.apicruds.domain.tipo_artefato.entities.TipoArtefato;

@Repository
public interface TipoArtefatoRepository extends JpaRepository<TipoArtefato, Integer> {

}
