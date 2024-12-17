class Book {
  final int id;
  final String nameBook;
  final DateTime publicationDate;
  final String author;
  final String publisher;
  final String category;
  final double price;
  final String description;
  final int stock_quantity;
  final String image;
  final String language;

  const Book({
    required this.id,
    required this.nameBook,
    required this.publicationDate,
    required this.author,
    required this.publisher,
    required this.category,
    required this.price,
    required this.description,
    required this.stock_quantity,
    required this.image,
    required this.language,
  });

  // Chuyển đối tượng Book thành Map (dùng cho lưu vào cơ sở dữ liệu)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameBook': nameBook,
      'publicationDate': publicationDate.toIso8601String(), // Chuyển DateTime sang String ISO8601
      'author': author,
      'publisher': publisher,
      'category': category,
      'price': price,
      'description': description,
      'stock_quantity': stock_quantity,
      'image': image,
      'language': language,
    };
  }

  // Tạo đối tượng Book từ Map (dùng cho truy vấn cơ sở dữ liệu)
  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] as int,
      nameBook: map['nameBook'] as String,
      publicationDate: DateTime.parse(map['publicationDate']),
      author: map['author'] as String,
      publisher: map['publisher'] as String,
      category: map['category'] as String,
      price: map['price'] is int ? (map['price'] as int).toDouble() : map['price'] as double, // Đảm bảo chuyển từ int sang double nếu cần
      description: map['description'] as String,
      stock_quantity: map['stock_quantity'] as int,
      image: map['image'] as String,
      language: map['language'] as String,
    );
  }
}
