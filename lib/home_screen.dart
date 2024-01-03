import 'package:flutter/material.dart';
import 'package:mycourse/colors.dart';
import 'package:mycourse/course_card.dart';
import 'package:mycourse/course_model.dart';
import 'package:mycourse/course_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Course> course = [];

  Future<List<Course>> fetchCourses() async {
    try {
      CourseProvider coursesProvider = Provider.of<CourseProvider>(context);
      List<Course> fetchedCourse = await coursesProvider.showCourse();

      course = fetchedCourse;
      return fetchedCourse;
    } catch (error) {
      print('Error fetching Courses: $error');
      var course = Course();
      List<Course> model = [course];
      return model;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Course>>(
      future: fetchCourses(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a loading indicator while waiting for the future to complete
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Handle any error that occurred during the future execution
          return Text('Error: ${snapshot.error}');
        } else {
          // Future completed successfully, you can access the data using snapshot.data
          List<Course>? course = snapshot.data;

          // Return your widget tree based on the data
          // print(courses![0].idUser);
          return HomePage(
            courseList: course!,
          );
        }
      },
    );
  }
}

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({
    super.key,
    required this.courseList,
  });
  final List<Course> courseList;

  int selectedCategory = 0;

  final category = [
    "React",
    "Flutter",
    "Golang",
    "Laravel",
    "Vue",
    "React Native",
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
    Widget recomendationSection() {
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

    Widget popularSection() {
      return Column(
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
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    courseList.map((course) => CourseCard(course)).toList(),
              ))
        ],
      );
    }

    Widget categorySection() {
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
              onTap: () {},
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

    Widget search() {
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

    Widget topBar() {
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

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topBar(),
              search(),
              categorySection(),
              popularSection(),
              recomendationSection(),
            ],
          ),
        ),
      ),
    );
  }
}
