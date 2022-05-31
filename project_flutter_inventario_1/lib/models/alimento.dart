class Alimento{
  final int id;
  final String name;
  final String image;
  final int ventas;

  Alimento({required this.id, required this.name, required this.image ,required this.ventas});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'image' : image,
      'ventas' : ventas
    };
  }

}