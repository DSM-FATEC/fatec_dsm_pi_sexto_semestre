package com.guia.apicruds.domain.entidade.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.AllArgsConstructor;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@Entity
@Table(name = "entidades")
public class Entidade {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Long tipo;

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
    private LocalDate criadoEm;

    @Column(nullable = false)
    private LocalDate atualizadoEm;
}
