class Filial {
  String endereco;
  String tipo;
  String razaoSocial;

  Filial({
    this.endereco,
    this.tipo,
    this.razaoSocial,
  });

  factory Filial.fromJson(Map<String, dynamic> json) => Filial(
    endereco: json["endereco"],
    tipo: json["tipo"],
    razaoSocial: json["razaoSocial"],
  );

  Map<String, dynamic> toJson() => {
    "endereco": endereco,
    "tipo": tipo,
    "razaoSocial": razaoSocial,
  };
}
