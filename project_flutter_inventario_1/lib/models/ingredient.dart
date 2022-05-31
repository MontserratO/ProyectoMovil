class Ingredient{
  final int id;
  final String name;
  final int amount;
  final String image;
  final int amount_min;

  Ingredient({required this.id, required this.name, required this.amount, required this.image, required this.amount_min});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'image': image,
      'amount_min': amount_min
    };
  }

}