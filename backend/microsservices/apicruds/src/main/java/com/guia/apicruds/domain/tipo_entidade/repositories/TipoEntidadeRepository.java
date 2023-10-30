package com.guia.apicruds.domain.tipo_entidade.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.guia.apicruds.domain.tipo_entidade.entities.TipoEntidade;

@Repository
public interface TipoEntidadeRepository extends JpaRepository<TipoEntidade, Long> {
}
