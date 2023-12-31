package com.guia.apicruds.domain.tipo_entidade.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.time.Instant;
import java.util.Collection;

import com.guia.apicruds.domain.entidade.entities.Entidade;

@Data
@NoArgsConstructor
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

    @JsonIgnore
    @OneToMany(mappedBy = "tipo")
    private Collection<Entidade> Entidade;
}