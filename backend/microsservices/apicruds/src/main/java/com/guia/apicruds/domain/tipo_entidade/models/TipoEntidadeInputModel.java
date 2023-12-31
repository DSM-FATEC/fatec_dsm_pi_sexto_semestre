package com.guia.apicruds.domain.tipo_entidade.models;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import java.time.Instant;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TipoEntidadeInputModel {
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Long id;

    @NotBlank
    @Size(max = 255)
    private String descricao;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Instant criadoEm;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Instant atualizadoEm;
}
