class Category {
  final int? id;
  final String name;
  final String type;

  Category({
    this.id,
    required this.name,
    required this.type,
  });

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json['id'],
        name: json['name'],
        type: json['type'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
    };
  }
}
