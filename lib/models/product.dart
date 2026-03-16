class Product {
  final int id;
  final String title;
  final String description;
  final String price;
  final String image;
  final String? tagline;
  final Map<String, dynamic>? specs;
  final List<String>? samples; 

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    this.tagline,
    this.specs,
    this.samples,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      tagline: json['tagline'],
      specs: json['specs'],
      samples: json['samples'] != null
          ? List<String>.from(json['samples'])
          : null, 
    );
  }
}