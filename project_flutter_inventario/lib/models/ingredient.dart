class Ingredient{
  final int id;
  final String name;
  final int amount;
  final String image;
  final int limit;

  Ingredient({required this.id, required this.name, required this.amount, required this.image, required this.limit});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'image': image,
      'limit': limit
    };
  }

}