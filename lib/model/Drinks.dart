class DrinkModel {
  final String cover, drink_name, description, place_name, preparation;
  int place_id, id_drink;

  DrinkModel(
      {required this.cover,
      required this.id_drink,
      required this.drink_name,
      required this.place_name,
      required this.description,
      required this.preparation,
      required this.place_id});

  factory DrinkModel.fromJSON(Map parsedJson) {
    return DrinkModel(
        cover: parsedJson['cover'],
        drink_name: parsedJson['drink_name'],
        place_name: parsedJson['place_name'],
        id_drink: parsedJson['id_drink'],
        description: parsedJson['description'],
        preparation: parsedJson['preparation'],
        place_id: parsedJson['place_id']);
  }
}
