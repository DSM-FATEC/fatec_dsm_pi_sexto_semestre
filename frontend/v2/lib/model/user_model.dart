class User{
  User({
    required this.nome,
    required this.email,
    this.id,
    this.idGoogle,
    this.foto,
    this.criadoEm,
    this.atualizadoEm
  });

  int? id;
  String? idGoogle;
  String nome;
  String email;
  String? foto;
  String? criadoEm;
  String? atualizadoEm;

  factory User.fromJson(Map<String, dynamic> json) => User (
    id: json['id'], 
    idGoogle: json['idGoogle'], 
    nome: json['nome'], 
    email: json['email'], 
    foto: json['foto'], 
    criadoEm: json['criadoEm'], 
    atualizadoEm: json['atualizadoEm']
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "idGoogle": idGoogle,
    "nome": nome,
    "email": email,
    "foto": foto,
    "criadoEm": criadoEm,
    "atualizadoEm": atualizadoEm
  };
}