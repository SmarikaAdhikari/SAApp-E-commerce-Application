class Starwars{
final String name;
final List<String> films;


Starwars({
  required this.name,
  required this.films,
});


factory Starwars.fromJson(Map<String, dynamic> json) {
  return Starwars(
    name: json['name'],
    films: List<String>.from(json['films']),
  );




}

}