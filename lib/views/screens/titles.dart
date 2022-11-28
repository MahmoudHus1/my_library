import 'package:flutter/material.dart';
import 'package:my_library/db/dbhelper.dart';
import 'package:my_library/providers/controller_provider.dart';
import 'package:my_library/views/widgets/title_widget.dart';
import 'package:provider/provider.dart';

import '../widgets/drawer/drawer_widget.dart';
import 'add_book.dart';

class Titles extends StatelessWidget {
  const Titles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async  {
         Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const AddNewBook();
            },
          )); 
        },
        backgroundColor: const Color.fromARGB(255, 243, 16, 0),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Titles'),
        backgroundColor: const Color.fromARGB(255, 243, 16, 0),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Consumer<NewBookProvider>(
        builder: (context, provider, child) {
          provider.getAllBooks();


          return ListView.builder(itemCount:provider.allBooks.length , itemBuilder: (context, index) => BookButton(index : index,title: (provider.allBooks[index]['detials']as  Map<String, dynamic>)['bookTitle'].toString(),
           author:provider.allBooks[index]['authors'] as List,
           details: provider.allBooks[index]['detials'] as Map<String, dynamic>,),);
        }
      ),
    );
  }
}
