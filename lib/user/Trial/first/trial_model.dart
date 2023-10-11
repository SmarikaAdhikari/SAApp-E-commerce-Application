class Trialy {
   final List<String> facts;
  final bool success;

  Trialy({
    required this.facts,
    required this.success,
  });

  factory Trialy.fromJson(Map<String, dynamic> json) {
    return Trialy(
      facts: List<String>.from(json['facts']),
      success: json['success'],
    );
  }
}





