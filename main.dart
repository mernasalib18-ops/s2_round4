import 'package:flutter/material.dart';

void main() => runApp(const FoodApp());

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1.  البروفايل والجرس
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          'assets/images/profile.png',
                        ),
                      ),
                      const Column(
                        children: [
                          Text(
                            'الموقع الحالي 📍',
                            style: TextStyle(
                              color: Color.fromARGB(255, 171, 155, 155),
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '19 الشيخ احمد الصاوي، مدينة نصر',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const Icon(Icons.notifications_none, size: 28),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // 2.  السيرش
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'تبحث عن وجبة معينة؟',
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 14, 13, 13),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),

                  // 3. الأصناف
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      categoryCard(
                        ' وجبات سريعة',
                        'assets/images/burger.png',
                        const Color.fromARGB(255, 234, 7, 7),
                      ),
                      categoryCard(
                        ' ماكؤلات بحرية ',
                        'assets/images/shrimp.png',
                        const Color.fromARGB(255, 109, 216, 195),
                      ),
                      categoryCard(
                        'مشويات',
                        'assets/images/grill.png',
                        const Color(0xFFFFF4E5),
                      ),
                      categoryCard(
                        'لحوم',
                        'assets/images/meat.png',
                        const Color(0xFFE5F0FF),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // 4. البانر
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/banner.png',
                        width: 380,
                        height: 177,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " 🔥الافضل خلال اليوم",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  //5 السلة وتقييم الوجبات
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      foodCard(
                        'بيج بيرجر سبايسي',
                        'assets/images/burger.png',
                        '190 ج.م',
                        '5.0',
                        '100',
                      ),
                      foodCard(
                        ' بيج بيرجر سبايسي',
                        'assets/images/shrimp.png',
                        ' 150 ج.م',
                        '4.8',
                        '85',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryCard(String title, String imgPath, Color bgColor) {
    return Column(
      children: [
        Container(
          width: 90,
          height: 103,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(child: Image.asset(imgPath, width: 75)),
        ),
        const SizedBox(height: 9),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ],
    );
  }

  Widget foodCard(
    String name,
    String imgPath,
    String price,
    String rate,
    String reviews,
  ) {
    return Container(
      width: 170,
      height: 210,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(child: Image.asset(imgPath, fit: BoxFit.contain)),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            maxLines: 1,
          ),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange, size: 14),
              const SizedBox(width: 4),
              Text(
                rate,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' ($reviews+)',
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE57373),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
