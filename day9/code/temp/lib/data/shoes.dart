import '../data/list_shoes.dart';

   List<Shoes> shoesList =    list_shoes.map ((shoeData) {
    return Shoes(
id: shoeData["id"],
      name: shoeData["name"],
      company: shoeData["company"],
      rating: shoeData["rating"],
      description: shoeData["description"],
      size: List<int>.from(shoeData["size"]),
      colors: List<String>.from(shoeData["colors"]),
      price: shoeData["price"],
      date: DateTime.parse(shoeData["date"]),
      url: shoeData["url"],
    );
  }).toList();

  class Shoes {
    int id;
    String name;
    String company;
    double rating;
    String description;
    List<int> size;
    List<String> colors;
    double price;
    DateTime date;
    String url;

    Shoes({
        required this.id,

        required this.name,
        required this.company,
        required this.rating,
        required this.description,
        required this.size,
        required this.colors,
        required this.price,
        required this.date,
        required this.url,
    });

   }

