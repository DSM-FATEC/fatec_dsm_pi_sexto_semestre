package com.guia.apicruds.services;

import com.guia.apicruds.domain.entidade.entities.Entidade;
import com.guia.apicruds.domain.entidade.models.EntidadeInputModel;
import com.guia.apicruds.domain.entidade.repositories.EntidadeRepository;
import com.guia.apicruds.domain.tipo_entidade.entities.TipoEntidade;
import com.guia.apicruds.domain.tipo_entidade.repositories.TipoEntidadeRepository;
import com.guia.apicruds.exceptions.EntidadeNaoEncontradaException;
import com.guia.apicruds.exceptions.TipoEntidadeNaoEncontradaException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.List;
import java.util.Optional;

@Service
public class EntidadeService {
    private EntidadeRepository entidadeRepository;
    private TipoEntidadeRepository tipoEntidadeRepository;

    @Autowired
    public EntidadeService(EntidadeRepository entidadeRepository, TipoEntidadeRepository tipoEntidadeRepository) {
        this.entidadeRepository = entidadeRepository;
        this.tipoEntidadeRepository = tipoEntidadeRepository;
    }

    public List<Entidade> listar() {
        List<Entidade> entidades = entidadeRepository.findAll();

        return entidades;
    }

    public Entidade buscarPorId(Long id) {
        Optional<Entidade> entidadeOptional = entidadeRepository.findById(id);
        if (!entidadeOptional.isPresent()) {
            throw new EntidadeNaoEncontradaException("Entidade com ID " + id + " não encontrada");
        }

        Entidade entidadeEncontrada = entidadeOptional.get();
        return entidadeEncontrada;
    }

    public Entidade criarEntidade(EntidadeInputModel inputModel) {
        Optional<TipoEntidade> tipo = this.tipoEntidadeRepository.findById(inputModel.getTipo());

        if (tipo.isEmpty()) {
            throw new TipoEntidadeNaoEncontradaException(String.format("Tipo Entidade %d não encontrado", inputModel.getTipo()));
        }

        Entidade novaEntidade = new Entidade();
        novaEntidade.setTipo(tipo.get());
        novaEntidade.setDescricao(inputModel.getDescricao());
        novaEntidade.setCep(inputModel.getCep());
        novaEntidade.setComplemento(inputModel.getComplemento());
        novaEntidade.setEndereco(inputModel.getEndereco());
        novaEntidade.setBairro(inputModel.getBairro());
        novaEntidade.setCidade(inputModel.getCidade());
        novaEntidade.setEstado(inputModel.getEstado());
        novaEntidade.setCriadoEm(Instant.now());
        novaEntidade.setAtualizadoEm(Instant.now());

        Entidade entidadeSalva = entidadeRepository.save(novaEntidade);

        return entidadeSalva;
    }

    public Entidade atualizarEntidade(Long id, EntidadeInputModel inputModel) {
        Optional<Entidade> entidadeOptional = entidadeRepository.findById(id);
        if (entidadeOptional.isEmpty()) {
            throw new EntidadeNaoEncontradaException("Entidade com ID " + id + " não encontrada");
        }

        Optional<TipoEntidade> tipo = this.tipoEntidadeRepository.findById(inputModel.getTipo());
        if (tipo.isEmpty()) {
            throw new TipoEntidadeNaoEncontradaException(String.format("Tipo Entidade %d não encontrado", inputModel.getTipo()));
        }

        Entidade entidade = entidadeOptional.get();
        entidade.setTipo(tipo.get());
        entidade.setDescricao(inputModel.getDescricao());
        entidade.setCep(inputModel.getCep());
        entidade.setComplemento(inputModel.getComplemento());
        entidade.setEndereco(inputModel.getEndereco());
        entidade.setBairro(inputModel.getBairro());
        entidade.setCidade(inputModel.getCidade());
        entidade.setEstado(inputModel.getEstado());
        entidade.setAtualizadoEm(Instant.now());

        return entidadeRepository.save(entidade);
    }

    public void excluir(Long id) {
        Optional<Entidade> entidadeOptional = entidadeRepository.findById(id);

        if (entidadeOptional.isEmpty()) {
            throw new EntidadeNaoEncontradaException("Entidade com ID " + id + " não encontrada");
        }

        entidadeRepository.deleteById(id);
    }
}
