import 'package:book_store/chitietsanpham/chitietsanpham.dart';
import 'package:book_store/view/profile.dart';
import 'package:flutter/material.dart';
import '../controller/book_controller.dart';
import '../model/book.dart';
import 'details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BookController _controller = BookController();
  late Future<List<Book>> _bookFuture;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchBooks();
  }

  void _fetchBooks() {
    setState(() {
      if (_searchQuery.isEmpty) {
        _bookFuture = _controller.Book_Snapshot(); // Lấy tất cả sách
      } else {
        _bookFuture = _controller.searchBooks(_searchQuery); // Tìm kiếm sách
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            const Icon(Icons.menu),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  onChanged: (value) {
                    _searchQuery = value.trim();
                    _fetchBooks(); // Gọi hàm tìm kiếm
                  },
                  decoration: InputDecoration(
                    hintText: 'Search books...',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserPage()),
                );
              },
              child: const Icon(Icons.person),
            ),

          ],
        ),
      ),
      body: FutureBuilder<List<Book>>(
        future: _bookFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No books found."));
          }
          final books = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.6,
              ),
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        'chitiet',
                        arguments: book
                      );
                    },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              book.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  book.nameBook,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${book.price} VND',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
