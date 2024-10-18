class User {
  // Attributes
  final String id;
  final String? name;
  final String? email;
  final String? phone;
  final int? age;

  // Constructor
  User({
    required this.id,
     this.name,
     this.email,
     this.phone,
     this.age,
  });

  // Factory constructor for creating a new User instance from a map (JSON)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      age: json['age'],
    );
  }

  // Method to convert User object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'age': age,
    };
  }
}
