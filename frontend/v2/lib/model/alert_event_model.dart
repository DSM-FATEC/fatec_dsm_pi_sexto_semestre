class Evento {
  int? id;
  Artefato? artefato;
  Corpo? corpo;
  String? criadoEm;
  String? atualizadoEm;

  Evento(
      {this.id, this.artefato, this.corpo, this.criadoEm, this.atualizadoEm});

  Evento.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    artefato =
        json['artefato'] != null ? Artefato.fromJson(json['artefato']) : null;
    corpo = json['corpo'] != null ? Corpo.fromJson(json['corpo']) : null;
    criadoEm = json['criado_em'];
    atualizadoEm = json['atualizado_em'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (artefato != null) {
      data['artefato'] = artefato!.toJson();
    }
    if (corpo != null) {
      data['corpo'] = corpo!.toJson();
    }
    data['criado_em'] = criadoEm;
    data['atualizado_em'] = atualizadoEm;
    return data;
  }
}

class Artefato {
  String? id;
  Tipo? tipo;
  Entidade? entidade;
  String? descricao;
  Comportamentos? comportamentos;
  bool? ativo;
  String? criadoEm;
  String? atualizadoEm;

  Artefato(
      {this.id,
      this.tipo,
      this.entidade,
      this.descricao,
      this.comportamentos,
      this.ativo,
      this.criadoEm,
      this.atualizadoEm});

  Artefato.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tipo = json['tipo'] != null ? Tipo.fromJson(json['tipo']) : null;
    entidade =
        json['entidade'] != null ? Entidade.fromJson(json['entidade']) : null;
    descricao = json['descricao'];
    comportamentos = json['comportamentos'] != null
        ? Comportamentos.fromJson(json['comportamentos'])
        : null;
    ativo = json['ativo'];
    criadoEm = json['criado_em'];
    atualizadoEm = json['atualizado_em'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (tipo != null) {
      data['tipo'] = tipo!.toJson();
    }
    if (entidade != null) {
      data['entidade'] = entidade!.toJson();
    }
    data['descricao'] = descricao;
    if (comportamentos != null) {
      data['comportamentos'] = comportamentos!.toJson();
    }
    data['ativo'] = ativo;
    data['criado_em'] = criadoEm;
    data['atualizado_em'] = atualizadoEm;
    return data;
  }
}

class Tipo {
  int? id;
  String? descricao;
  bool? produtor;
  String? criadoEm;
  String? atualizadoEm;

  Tipo(
      {this.id,
      this.descricao,
      this.produtor,
      this.criadoEm,
      this.atualizadoEm});

  Tipo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    produtor = json['produtor'];
    criadoEm = json['criado_em'];
    atualizadoEm = json['atualizado_em'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['descricao'] = descricao;
    data['produtor'] = produtor;
    data['criado_em'] = criadoEm;
    data['atualizado_em'] = atualizadoEm;
    return data;
  }
}

class Entidade {
  int? id;
  Tipo? tipo;
  String? descricao;
  String? cep;
  String? endereco;
  String? bairro;
  String? cidade;
  String? estado;
  String? criadoEm;
  String? atualizadoEm;

  Entidade(
      {this.id,
      this.tipo,
      this.descricao,
      this.cep,
      this.endereco,
      this.bairro,
      this.cidade,
      this.estado,
      this.criadoEm,
      this.atualizadoEm});

  Entidade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tipo = json['tipo'] != null ? Tipo.fromJson(json['tipo']) : null;
    descricao = json['descricao'];
    cep = json['cep'];
    endereco = json['endereco'];
    bairro = json['bairro'];
    cidade = json['cidade'];
    estado = json['estado'];
    criadoEm = json['criado_em'];
    atualizadoEm = json['atualizado_em'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (tipo != null) {
      data['tipo'] = tipo!.toJson();
    }
    data['descricao'] = descricao;
    data['cep'] = cep;
    data['endereco'] = endereco;
    data['bairro'] = bairro;
    data['cidade'] = cidade;
    data['estado'] = estado;
    data['criado_em'] = criadoEm;
    data['atualizado_em'] = atualizadoEm;
    return data;
  }
}

class Comportamentos {
  int? openDuration;
  int? closedDuration;

  Comportamentos({this.openDuration, this.closedDuration});

  Comportamentos.fromJson(Map<String, dynamic> json) {
    openDuration = json['open_duration'];
    closedDuration = json['closed_duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['open_duration'] = openDuration;
    data['closed_duration'] = closedDuration;
    return data;
  }
}

class Corpo {
  String? estado;

  Corpo({this.estado});

  Corpo.fromJson(Map<String, dynamic> json) {
    estado = json['estado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['estado'] = estado;
    return data;
  }
}
