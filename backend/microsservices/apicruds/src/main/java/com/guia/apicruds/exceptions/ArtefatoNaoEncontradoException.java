package com.guia.apicruds.exceptions;

public class ArtefatoNaoEncontradoException extends Exception {
    public ArtefatoNaoEncontradoException(Integer id) {
        super(String.format("Artefato %d não existe", id));
    }
}
