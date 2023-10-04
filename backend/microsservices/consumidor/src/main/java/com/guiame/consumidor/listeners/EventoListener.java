package com.guiame.consumidor.listeners;

import java.util.Optional;
import java.util.concurrent.CountDownLatch;

import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.guiame.consumidor.domain.evento.models.EventoInputModel;
import com.guiame.consumidor.services.EventoService;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class EventoListener {
    @Getter
    private CountDownLatch latch = new CountDownLatch(1);
    private ObjectMapper mapper = new ObjectMapper();

    @Autowired
    private EventoService eventoService;

    @RabbitListener(queues = "eventos", returnExceptions = "true")
    public void handleMessage(String message) {
        Optional<EventoInputModel> eventoInputModel = Optional.empty();

        try {
            eventoInputModel = Optional.of(this.mapper.readValue(message, EventoInputModel.class));
        } catch (JsonProcessingException e) {
            log.error("Error while processing message: {}", e.getMessage());
        }

        eventoInputModel.ifPresent(input -> {
            this.eventoService.salvar(input);
        });

        this.latch.countDown();
    }
}
