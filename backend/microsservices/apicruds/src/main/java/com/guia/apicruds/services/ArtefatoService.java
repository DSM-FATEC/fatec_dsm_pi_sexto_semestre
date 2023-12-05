package com.guia.apicruds.services;

import java.time.Instant;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guia.apicruds.domain.artefato.entities.Artefato;
import com.guia.apicruds.domain.artefato.models.ArtefatoInputModel;
import com.guia.apicruds.domain.artefato.repositories.ArtefatoRepository;
import com.guia.apicruds.domain.tipo_artefato.entities.TipoArtefato;
import com.guia.apicruds.domain.tipo_artefato.repositories.TipoArtefatoRepository;
import com.guia.apicruds.exceptions.ArtefatoNaoEncontradoException;
import com.guia.apicruds.exceptions.TipoArtefatoNaoEncontradoException;

@Service
public class ArtefatoService {
    @Autowired
    private ArtefatoRepository artefatoRepository;

    @Autowired
    private TipoArtefatoRepository tipoArtefatoRepository;

    public Artefato criaArtefato(ArtefatoInputModel inputModel) throws TipoArtefatoNaoEncontradoException {
        Artefato artefato = new Artefato();
        artefato.setAtivo(inputModel.getAtivo());
        artefato.setDescricao(inputModel.getDescricao());
        artefato.setCriadoEm(Instant.now());
        artefato.setAtualizadoEm(Instant.now());
        artefato.setComportamentos(inputModel.getComportamentos());
        artefato.setWifi(inputModel.getWifi());

        Optional<TipoArtefato> tipoArtefato = this.tipoArtefatoRepository.findById(inputModel.getTipoId());

        if (tipoArtefato.isEmpty()) {
            throw new TipoArtefatoNaoEncontradoException(inputModel.getTipoId());
        }

        artefato.setTipo(tipoArtefato.get());

        return this.artefatoRepository.save(artefato);
    }

    public Artefato atualizaArtefato(ArtefatoInputModel inputModel, Integer id)
            throws ArtefatoNaoEncontradoException, TipoArtefatoNaoEncontradoException {
        Optional<Artefato> artefato = this.artefatoRepository.findById(id);
        if (artefato.isEmpty()) {
            throw new ArtefatoNaoEncontradoException(id);
        }

        Optional<TipoArtefato> tipoArtefato = this.tipoArtefatoRepository.findById(inputModel.getTipoId());
        if (tipoArtefato.isEmpty()) {
            throw new TipoArtefatoNaoEncontradoException(inputModel.getTipoId());
        }

        artefato.get().setAtivo(inputModel.getAtivo());
        artefato.get().setDescricao(inputModel.getDescricao());
        artefato.get().setTipo(tipoArtefato.get());
        artefato.get().setAtualizadoEm(Instant.now());
        artefato.get().setComportamentos(inputModel.getComportamentos());
        artefato.get().setWifi(inputModel.getWifi());

        return this.artefatoRepository.save(artefato.get());
    }

    public Artefato obtemPorId(Integer id) throws ArtefatoNaoEncontradoException {
        Optional<Artefato> artefato = this.artefatoRepository.findById(id);
        if (artefato.isEmpty()) {
            throw new ArtefatoNaoEncontradoException(id);
        }

        return artefato.get();
    }

    public List<Artefato> obtemArtefatoPeloWifi(String wifi)  {
        return artefatoRepository.findByWifi(wifi);
    }

    public List<Artefato> obtemTodos() {
        return this.artefatoRepository.findAll();
    }

    public void deletaPorId(Integer id) throws ArtefatoNaoEncontradoException {
        Boolean exists = this.artefatoRepository.existsById(id);

        if (!exists) {
            throw new ArtefatoNaoEncontradoException(id);
        }

        this.artefatoRepository.deleteById(id);
    }
}
