package com.guia.apicruds.domain.tipo_entidade.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.AllArgsConstructor;

import java.time.Instant;
import java.util.Collection;

import com.guia.apicruds.domain.entidade.entities.Entidade;

@Data
@AllArgsConstructor
@Entity
@Table(name = "tipos_entidades")
public class TipoEntidade {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private String descricao;

    @Column(nullable = false)
    private Instant criadoEm;

    @Column(nullable = false)
    private Instant atualizadoEm;

    @OneToMany(mappedBy = "tipo")
    private Collection<Entidade> Entidade;
}