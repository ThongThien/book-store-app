class Book {
  final int id;
  final String nameBook;
  final DateTime publicationDate;
  final String author;
  final String publisher;
  final int categoryID;
  final double price;
  final String description;
  final int stockQuantity;
  final String image;
  final String language;

  const Book({
    required this.id,
    required this.nameBook,
    required this.publicationDate,
    required this.author,
    required this.publisher,
    required this.categoryID,
    required this.price,
    required this.description,
    required this.stockQuantity,
    required this.image,
    required this.language,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameBook': nameBook,
      'publicationDate': publicationDate.toIso8601String(),
      'author': author,
      'publisher': publisher,
      'categoryID': categoryID,
      'price': price,
      'description': description,
      'stock_quantity': stockQuantity,
      'image': image,
      'language': language,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] != null ? map['id'] as int : 0,
      nameBook: map['nameBook'] ?? '',
      publicationDate: map['publicationDate'] != null
          ? DateTime.tryParse(map['publicationDate']) ?? DateTime.now()
          : DateTime.now(),
      author: map['author'] ?? '',
      publisher: map['publisher'] ?? '',
      categoryID: map['categoryID'] != null ? map['categoryID'] as int : 0,
      price: map['price'] != null
          ? (map['price'] is int
              ? (map['price'] as int).toDouble()
              : map['price'] as double)
          : 0.0,
      description: map['description'] ?? '',
      stockQuantity:
          map['stock_quantity'] != null ? map['stock_quantity'] as int : 0,
      image: map['image'],
      language: map['language'] ?? '',
    );
  }
}
