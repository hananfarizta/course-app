import 'package:flutter/material.dart';
import 'package:mycourse/colors.dart';
import 'package:mycourse/course_model.dart';

class DetailCourseScreen extends StatelessWidget {
  final Course course;
  const DetailCourseScreen(this.course, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget hero(BuildContext context) {
      return Container(
        width: double.infinity,
        height: 300,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
            image: const DecorationImage(
              image: AssetImage("assets/pcourse1.png"),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 5),
              )
            ]),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
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
              top: 20,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black.withOpacity(0.3),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: GestureDetector(
                // onTap: () {
                //   setState(() {
                //     isBookmark = !isBookmark;
                //   });
                // },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black.withOpacity(0.3),
                  ),
                  child: Icon(
                    Icons.bookmark_outline,
                    color: Colors.white,
                  ),
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
                    course.namaCourse.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    course.kategori.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.3),
                        ),
                        child: const Icon(
                          Icons.video_library,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        "20 Video",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.3),
                        ),
                        child: const Icon(
                          Icons.quiz,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        "5 Quiz",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget description() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Deskripsi",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Course ini untuk mereka yang benar-benar baru mau belajar tentang react native... Show More",
              style: TextStyle(color: LocalColors.grey),
            )
          ],
        ),
      );
    }

    Widget tutorSection() {
      return Container(
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/person.png"),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Muh Ario Adriansyah Wuleho",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text("Main Tutor"),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: LocalColors.lightBlue,
              ),
              child: const Icon(
                Icons.phone,
                size: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: LocalColors.lightBlue,
              ),
              child: const Icon(
                Icons.chat_bubble,
                size: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    }

    Widget gallerySection() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                "Gallery",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 20),
                itemCount: 4,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Image.asset("assets/gallery${index + 1}.png");
                },
              ),
            )
          ],
        ),
      );
    }

    Widget buySection() {
      return Container(
        margin: const EdgeInsets.only(top: 70),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: TextStyle(
                    color: LocalColors.grey,
                  ),
                ),
                Text(
                  "Rp.250.000/paket",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
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
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CheckoutScreen()),
                  );
                },
                child: const Text(
                  "Ambil",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hero(context),
                description(),
                tutorSection(),
                gallerySection(),
                buySection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// class DetailCourseScreen extends StatefulWidget {
//   const DetailCourseScreen({super.key});

//   @override
//   State<DetailCourseScreen> createState() => _DetailCourseScreenState();
// }

// class _DetailCourseScreenState extends State<DetailCourseScreen> {
//   bool isBookmark = false;

//   @override
//   Widget build(BuildContext context) {
// Widget hero(BuildContext context) {
//   return Container(
//     width: double.infinity,
//     height: 300,
//     margin: const EdgeInsets.all(20),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.red,
//         image: const DecorationImage(
//           image: AssetImage("assets/pcourse1.png"),
//           fit: BoxFit.cover,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.3),
//             blurRadius: 20,
//             offset: const Offset(0, 5),
//           )
//         ]),
//     child: Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           height: 300,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Colors.transparent,
//                 Colors.black.withOpacity(0.7),
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//           top: 20,
//           left: 20,
//           child: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50),
//                 color: Colors.black.withOpacity(0.3),
//               ),
//               child: const Icon(
//                 Icons.arrow_back_ios_new,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 20,
//           right: 20,
//           child: GestureDetector(
//             onTap: () {
//               setState(() {
//                 isBookmark = !isBookmark;
//               });
//             },
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50),
//                 color: Colors.black.withOpacity(0.3),
//               ),
//               child: Icon(
//                 isBookmark ? Icons.bookmark : Icons.bookmark_outline,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: 20,
//           left: 20,
//           right: 20,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 course,
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 overflow: TextOverflow.ellipsis,
//                 textAlign: TextAlign.left,
//               ),
//               const Text(
//                 "Course untuk pemula",
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.white,
//                 ),
//                 overflow: TextOverflow.ellipsis,
//                 textAlign: TextAlign.left,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.black.withOpacity(0.3),
//                     ),
//                     child: const Icon(
//                       Icons.video_library,
//                       size: 18,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   const Text(
//                     "20 Video",
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 60,
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.black.withOpacity(0.3),
//                     ),
//                     child: const Icon(
//                       Icons.quiz,
//                       size: 18,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   const Text(
//                     "5 Quiz",
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         )
//       ],
//     ),
//   );
// }

// Widget description() {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 20),
//     child: const Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Deskripsi",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(
//           height: 16,
//         ),
//         Text(
//           "Course ini untuk mereka yang benar-benar baru mau belajar tentang react native... Show More",
//           style: TextStyle(color: LocalColors.grey),
//         )
//       ],
//     ),
//   );
// }

// Widget tutorSection() {
//   return Container(
//     margin: const EdgeInsets.all(20),
//     width: double.infinity,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Image.asset("assets/person.png"),
//         const SizedBox(
//           width: 20,
//         ),
//         const Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Muh Ario Adriansyah Wuleho",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 14,
//               ),
//             ),
//             Text("Main Tutor"),
//           ],
//         ),
//         const Spacer(),
//         Container(
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: LocalColors.lightBlue,
//           ),
//           child: const Icon(
//             Icons.phone,
//             size: 18,
//             color: Colors.white,
//           ),
//         ),
//         const SizedBox(
//           width: 20,
//         ),
//         Container(
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: LocalColors.lightBlue,
//           ),
//           child: const Icon(
//             Icons.chat_bubble,
//             size: 18,
//             color: Colors.white,
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget gallerySection() {
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.only(
//             left: 20,
//           ),
//           child: Text(
//             "Gallery",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//         ),
//         const SizedBox(
//           height: 16,
//         ),
//         SizedBox(
//           height: 100,
//           child: ListView.builder(
//             padding: const EdgeInsets.only(left: 20),
//             itemCount: 4,
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               return Image.asset("assets/gallery${index + 1}.png");
//             },
//           ),
//         )
//       ],
//     ),
//   );
// }

// Widget buySection() {
//   return Container(
//     margin: const EdgeInsets.only(top: 70),
//     padding: const EdgeInsets.all(20),
//     child: Row(
//       children: [
//         const Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Price",
//               style: TextStyle(
//                 color: LocalColors.grey,
//               ),
//             ),
//             Text(
//               "Rp.250.000/paket",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             )
//           ],
//         ),
//         const Spacer(),
//         Container(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 40,
//             vertical: 10,
//           ),
//           margin: const EdgeInsets.only(right: 8),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             gradient: const LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color(0xFFA0DAFB),
//                 Color(0xFF0A8ED9),
//               ],
//             ),
//           ),
//           child: TextButton(
//             onPressed: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) => CheckoutScreen()),
//               );
//             },
//             child: const Text(
//               "Ambil",
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// return Scaffold(
//   body: SafeArea(
//     child: SingleChildScrollView(
//       child: ConstrainedBox(
//         constraints: BoxConstraints(
//           minHeight: MediaQuery.of(context).size.height,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             hero(context),
//             description(),
//             tutorSection(),
//             gallerySection(),
//             buySection(),
//           ],
//         ),
//       ),
//     ),
//   ),
// );
//   }
// }

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int packageQuantity = 1;
  String voucherCode = 'MUHARIOADRIAN';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Checkout Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Total Price: Rp.250.000',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 32),
            Text(
              'Jumlah Paket',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            TextField(
              onChanged: (value) {
                setState(() {
                  packageQuantity = int.tryParse(value) ?? 0;
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Quantity',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Voucher Kode',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            TextField(
              onChanged: (value) {
                setState(() {
                  voucherCode = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Voucher Code',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Total Jumlah Paket: $packageQuantity',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Kode Voucher: $voucherCode',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Total Harga: Rp.${250000 * packageQuantity}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
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
                    child: TextButton(
                      onPressed: () {
                        print('Package Quantity: $packageQuantity');
                        print('Voucher Code: $voucherCode');
                      },
                      child: const Text(
                        'Hitung',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
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
                    child: TextButton(
                      onPressed: () {
                        print('Proceeding with checkout');
                      },
                      child: const Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
