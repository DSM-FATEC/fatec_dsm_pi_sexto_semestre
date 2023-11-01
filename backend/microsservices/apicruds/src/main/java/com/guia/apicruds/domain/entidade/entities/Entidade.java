package com.guia.apicruds.domain.entidade.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.AllArgsConstructor;

import java.time.Instant;

import com.guia.apicruds.domain.tipo_entidade.entities.TipoEntidade;

@Data
@AllArgsConstructor
@Entity
@Table(name = "entidades")
public class Entidade {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String descricao;

    @Column(length = 9, nullable = false)
    private String cep;

    @Column
    private String complemento;

    @Column(nullable = false)
    private String endereco;

    @Column(nullable = false)
    private String bairro;

    @Column(nullable = false)
    private String cidade;

    @Column(nullable = false)
    private String estado;

    @Column(nullable = false)
    private Instant criadoEm;

    @Column(nullable = false)
    private Instant atualizadoEm;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "tipo")
    private TipoEntidade tipo;
}
