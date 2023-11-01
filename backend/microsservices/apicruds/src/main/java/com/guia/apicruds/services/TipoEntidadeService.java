package com.guia.apicruds.services;

import com.guia.apicruds.domain.tipo_entidade.entities.TipoEntidade;
import com.guia.apicruds.domain.tipo_entidade.models.TipoEntidadeInputModel;
import com.guia.apicruds.domain.tipo_entidade.repositories.TipoEntidadeRepository;
import com.guia.apicruds.exceptions.TipoEntidadeNaoEncontradaException;

import java.time.Instant;
import java.util.Optional;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class TipoEntidadeService {
    private TipoEntidadeRepository tipoEntidadeRepository;

    @Autowired
    public TipoEntidadeService(TipoEntidadeRepository tipoEntidadeRepository) {
        this.tipoEntidadeRepository = tipoEntidadeRepository;
    }

    public List<TipoEntidade> listar() {
        List<TipoEntidade> tipoEntidades = tipoEntidadeRepository.findAll();

        return tipoEntidades;
    }

    public TipoEntidade buscarPorId(Long id) {
        Optional<TipoEntidade> tipoEntidadeOptional = tipoEntidadeRepository.findById(id);
        if (!tipoEntidadeOptional.isPresent()) {
            throw new TipoEntidadeNaoEncontradaException("Tipo de entidade com ID " + id + " não encontrada");
        }

        TipoEntidade tipoEntidadeEncontrada = tipoEntidadeOptional.get();
        return tipoEntidadeEncontrada;
    }

    public TipoEntidade criarTipoEntidade(TipoEntidadeInputModel inputModel) {
        TipoEntidade tipoEntidade = new TipoEntidade(
            null,
            inputModel.getDescricao(),
            Instant.now(),
            null
        );

        TipoEntidade tipoEntidadeSalva = tipoEntidadeRepository.save(tipoEntidade);

        return tipoEntidadeSalva;
    }

    public TipoEntidade atualizarTipoEntidade(Long id, TipoEntidadeInputModel inputModel) {
        Optional<TipoEntidade> tipoEntidadeOptional = tipoEntidadeRepository.findById(id);

        if (tipoEntidadeOptional.isPresent()) {
            TipoEntidade tipoEntidade = tipoEntidadeOptional.get();

            tipoEntidade.setDescricao(inputModel.getDescricao());
            tipoEntidade.setAtualizadoEm(inputModel.getAtualizadoEm());

            return tipoEntidadeRepository.save(tipoEntidade);
        } else {
            throw new TipoEntidadeNaoEncontradaException("Tipo de entidade com ID " + id + " não encontrada");
        }
    }

    public void excluir(Long id) {
        Optional<TipoEntidade> tipoEntidadeOptional = tipoEntidadeRepository.findById(id);
        if (tipoEntidadeOptional.isPresent()) {
            tipoEntidadeRepository.deleteById(id);
        } else {
            throw new TipoEntidadeNaoEncontradaException("Tipo de entidade com ID " + id + " não encontrada");
        }
    }
}