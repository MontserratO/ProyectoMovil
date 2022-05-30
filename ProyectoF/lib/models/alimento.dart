class Alimento{
  final int id;
  final String name;
  final String image;

  Alimento({required this.id, required this.name, required this.image});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'image' : image
    };
  }

}