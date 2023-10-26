package com.guia.apicruds.exceptions;

public class TipoArtefatoNaoEncontradoException extends Exception {
    public TipoArtefatoNaoEncontradoException(Integer id) {
        super(String.format("Tipo Artefato %d não encontrado", id));
    }
}
