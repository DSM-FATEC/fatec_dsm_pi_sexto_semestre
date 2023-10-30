package com.guia.apicruds.domain.entidade.models;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.guia.apicruds.domain.entidade.entities.Entidade;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EntidadeInputModel {
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Long id;

    @NotNull
    private Long tipo;

    @NotBlank
    @Size(max = 255)
    private String descricao;

    @NotBlank
    @Pattern(regexp = "[0-9]{5}-[0-9]{3}")
    @Size(max = 9)
    private String cep;

    @Size(max = 255)
    private String complemento;

    @NotBlank
    @Size(max = 255)
    private String endereco;

    @NotBlank
    @Size(max = 255)
    private String bairro;

    @NotBlank
    @Size(max = 255)
    private String cidade;

    @NotBlank
    @Size(max = 255)
    private String estado;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private LocalDate criadoEm;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private LocalDate atualizadoEm;

    public static EntidadeInputModel toObj(Entidade entidade) {
        EntidadeInputModel entidadeInputModel = new EntidadeInputModel();

        entidadeInputModel.setId(entidade.getId());
        entidadeInputModel.setTipo(entidade.getTipo().getId());
        entidadeInputModel.setDescricao(entidade.getDescricao());
        entidadeInputModel.setCep(entidade.getCep());
        entidadeInputModel.setComplemento(entidade.getComplemento());
        entidadeInputModel.setEndereco(entidade.getEndereco());
        entidadeInputModel.setBairro(entidade.getBairro());
        entidadeInputModel.setCidade(entidade.getCidade());
        entidadeInputModel.setEstado(entidade.getEstado());
        entidadeInputModel.setCriadoEm(entidade.getCriadoEm());
        entidadeInputModel.setAtualizadoEm(entidade.getAtualizadoEm());

        return entidadeInputModel;
    }
}
