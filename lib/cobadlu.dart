import 'package:flutter/material.dart';
import 'package:mycourse/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;
  final category = [
    "React",
    "Flutter",
    "Golang",
    "Laravel",
    "Vue",
    "React Native",
  ];

  final popularCourse = [
    {
      "title": "React Native untuk pemula",
      "description": "Course untuk pemula",
      "image": "assets/pcourse1.png",
    },
    {
      "title": "React Native Lanjut",
      "description": "Course untuk yang sudah jago",
      "image": "assets/pcourse2.png",
    },
  ];

  final recomendationCourse = [
    {
      "title": "Laravel dalam 20 hari",
      "price": "Free",
      "video": 60,
      "quiz": 4,
      "image": "assets/pcourse3.png",
    },
    {
      "title": "React Native Lanjut",
      "price": "Rp. 200.000 / paket",
      "video": 20,
      "quiz": 1,
      "image": "assets/pcourse4.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBar(),
              const SearchSection(),
              categorySection(),
              popularSection(),
              recomendationSection(),
            ],
          ),
        ),
      ),
    );
  }

  Container recomendationSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  "Rekomendasi",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Text("See more"),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: recomendationCourse.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const DetailCourseScreen(),
                  //   ),
                  // );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(
                          recomendationCourse[index]["image"].toString(),
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recomendationCourse[index]["title"].toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              recomendationCourse[index]["price"].toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.video_library,
                                  size: 18,
                                  color: LocalColors.grey,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "${recomendationCourse[index]["video"].toString()} Video",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: LocalColors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  width: 60,
                                ),
                                const Icon(
                                  Icons.quiz,
                                  size: 18,
                                  color: LocalColors.grey,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "${recomendationCourse[index]["quiz"].toString()} Quiz",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: LocalColors.grey,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Container popularSection() {
    return Container(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  "Populer",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Text("See more"),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 300,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: popularCourse.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const DetailCourseScreen(),
                    //   ),
                    // );
                  },
                  child: Container(
                    width: 240,
                    height: 300,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                      image: DecorationImage(
                        image: AssetImage(popularCourse[index]["image"] ?? ""),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: 240,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          right: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                popularCourse[index]["title"] ?? "",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                popularCourse[index]["description"] ?? "",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Container categorySection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      height: 40,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        shrinkWrap: true,
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = index;
                popularCourse.shuffle();
                recomendationCourse.shuffle();
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 17.0,
                vertical: 10,
              ),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: index == selectedCategory
                    ? const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFA0DAFB),
                          Color(0xFF0A8ED9),
                        ],
                      )
                    : null,
              ),
              child: Text(
                category[index],
                style: TextStyle(
                  color: index == selectedCategory
                      ? Colors.white
                      : LocalColors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari course",
                hintStyle: const TextStyle(
                  color: LocalColors.grey,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: LocalColors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: LocalColors.lightWhite,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: LocalColors.grey,
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFA0DAFB),
                  Color(0xFF0A8ED9),
                ],
              ),
            ),
            child: const Icon(
              Icons.tune,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kategori",
                style: TextStyle(
                  fontSize: 12,
                  color: LocalColors.grey,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Programming",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: LocalColors.grey,
                  )
                ],
              ),
            ],
          ),
          const Spacer(),
          Stack(
            children: [
              const Icon(Icons.notifications_outlined),
              Positioned(
                top: 0,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 8,
                    minHeight: 8,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
