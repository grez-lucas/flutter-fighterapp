import 'package:category_app2/models/category_model.dart';
import 'package:category_app2/models/figher_model.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: Column(
          children: [
            _searchBar(),
            _categorySection(),
            Column(
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
                Container(
                  height: 320,
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
                        child: Container(
                          color: {
                            'Light': Colors.yellow[100],
                            'Dark': Color.fromARGB(255, 103, 77, 134),
                            'Fire': Colors.orange[100],
                            'Water': Colors.blue[100],
                            'Earth': Colors.brown[100],
                          }[fighters[index].category],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  fighters[index].image,
                                  width: 50,
                                  height: 5,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                fighters[index].name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: fighters[index]
                                    .toJson()
                                    .entries
                                    .map<Widget>((entry) {
                                  // Exclude non-stat properties
                                  if (entry.key == 'name' ||
                                      entry.key == 'category' ||
                                      entry.key == 'image') {
                                    return Container();
                                  }

                                  return _statDisplay(index, entry.key);
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Column _statDisplay(int index, String stat) {
    Map<String, dynamic> fighterMap = fighters[index].toJson();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          fighterMap[stat].toString(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        const Text(
          // ignore: unnecessary_string_interpolations
          '$stat',
          style: TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
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
          'Fighters'),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          print('Back button clicked');
        },
      ),
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
