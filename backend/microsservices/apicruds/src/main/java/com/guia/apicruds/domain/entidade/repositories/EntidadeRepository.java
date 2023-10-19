package com.guia.apicruds.domain.entidade.repositories;

import com.guia.apicruds.domain.entidade.entities.Entidade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EntidadeRepository extends JpaRepository<Entidade, Long> {}
