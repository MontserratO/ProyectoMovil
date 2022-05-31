class AlimentoIngrediente{
  final int id;
  final int idAlimento;
  final int idIngrediente;
  final int amount;

  AlimentoIngrediente({required this.id, required this.idAlimento, required this.idIngrediente, required this.amount});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'idAlimento': idAlimento,
      'idIngrediente': idIngrediente,
      'amount': amount
    };
  }

}