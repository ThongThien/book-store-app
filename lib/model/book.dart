class Book {
  final int id;
  final String nameBook;
  final DateTime publicationDate;
  final String author;
  final String publisher;
  final int categoryID;
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
    required this.categoryID,
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
      'categoryID': categoryID,
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
      id: map['id'] != null ? map['id'] as int : 0,
      nameBook: map['nameBook'] ?? 'Unknown',
      publicationDate: map['publicationDate'] != null
          ? DateTime.tryParse(map['publicationDate']) ?? DateTime.now()
          : DateTime.now(),
      author: map['author'] ?? 'Unknown',
      publisher: map['publisher'] ?? 'Unknown',
      categoryID: map['categoryID'] != null ? map['categoryID'] as int : 0,
      price: map['price'] != null
          ? (map['price'] is int
          ? (map['price'] as int).toDouble()
          : map['price'] as double)
          : 0.0,
      description: map['description'] ?? 'No description',
      stock_quantity: map['stock_quantity'] != null ? map['stock_quantity'] as int : 0,
      image: map['image'] ?? 'https://via.placeholder.com/150', // Ảnh mặc định nếu null
      language: map['language'] ?? 'Unknown',
    );
  }

}
