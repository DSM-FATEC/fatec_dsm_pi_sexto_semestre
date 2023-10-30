package com.guia.apicruds.domain.tipo_entidade.repositories;

import com.guia.apicruds.domain.entidade.entities.TipoEntidade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TipoEntidadeRepository extends JpaRepository<TipoEntidade, Long> {}
