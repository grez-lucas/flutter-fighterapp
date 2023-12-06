import 'package:flutter/material.dart';

import '../models/models.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<FighterModel> fighters = [];

  void _getFighters() {
    fighters = FighterModel.getFighters();
  }

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  void initState() {
    super.initState();
    _getCategories();
    _getFighters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          print('Bottom navigation bar tapped: $index');

          final routes = [
            '/home',
            '/fight',
            '/heroroster',
          ];

          Navigator.pushNamed(context, routes[index]);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_mma),
            label: 'Fight',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Fighters'),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            _searchBar(),
            _categorySection(),
            _popularFighters(),
          ],
        ),
      ),
    );
  }

  Column _popularFighters() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 20, bottom: 10, top: 20),
          child: const Text(
            'Popular Fighters',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        SizedBox(
          height: 164,
          child: ListView.separated(
            itemCount: fighters.length,
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 5,
              );
            },
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                color: fighters[index].category.bgColor.withOpacity(0.75),
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/herodetail',
                        arguments: fighters[index]);
                  },
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      fighters[index].image,
                      width: 50,
                      height: 5,
                    ),
                  ),
                  title: Text(
                    fighters[index].name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Column _categorySection() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 20, bottom: 10),
          child: const Text(
            'Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 5,
                );
              },
              itemBuilder: (context, index) {
                return _categoryBox(index);
              }),
        ),
      ],
    );
  }

  Container _categoryBox(int index) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: categories[index].bgColor.withOpacity(0.75),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(
              categories[index].image,
              width: 50,
              height: 5,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            categories[index].name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  Container _searchBar() {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.11),
          spreadRadius: 0,
          blurRadius: 40,
          offset: const Offset(0, 3),
        ),
      ]),
      child: const TextField(
        showCursor: false,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          suffixIcon: SizedBox(
            width: 60,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Colors.black,
                    thickness: 0.1,
                    indent: 8,
                    endIndent: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.sort),
                  ),
                ],
              ),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar MyAppBar() {
    return AppBar(
      title: const Text(
          style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins'),
          'Menu'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            print('Search button clicked');
          },
        ),
      ],
    );
  }
}
