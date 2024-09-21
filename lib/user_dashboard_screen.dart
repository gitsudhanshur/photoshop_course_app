import 'package:flutter/material.dart';

import 'payment_success_screen.dart';

class UserDashboardScreen extends StatefulWidget {
  @override
  _UserDashboardScreenState createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    UserDashboardBodyScreen(),
    Center(child: Text('Favorites Screen')),
    Center(child: Text('Notifications Screen')),
    Center(child: Text('Profile Screen')),  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/student3.png'),
              radius: 25,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Christiana Amandla',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Lets Learning to smart',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: _screens[_currentIndex],  
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; 
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.grey),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.grey),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey, 
      ),
    );
  }
}

class UserDashboardBodyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildCourseProgressCard(),
            SizedBox(height: 20),
            _buildSectionTitle('Popular Course'),
            SizedBox(height: 20),
            _buildPopularCourseList(),
            SizedBox(height: 20),
            _buildSectionTitle('Popular Course'),
            SizedBox(height: 20),
            _buildVerticalScrollableCourseList(),
          ],
        )
    );
  }

  Widget _buildCourseProgressCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 168, 241, 84), 
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 212, 247, 188), 
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mathematics Course',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 168, 241, 84), 
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today, size: 16, color: Colors.black),
                      SizedBox(width: 8),
                      Text(
                        '19 Nov, 2023',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 212, 247, 188),
                    child: Icon(Icons.check_circle, color: const Color.fromARGB(255, 145, 209, 72)),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Completed',
                        style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '20',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Container(
                height: 55,
                width: 1,
                color: Color.fromARGB(255, 243, 245, 242),
              ),

              const Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 212, 247, 188),
                    child: Icon(Icons.access_time_filled, color: Color.fromARGB(255, 145, 209, 72)),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hours Spent',
                        style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '455',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          'View All',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildPopularCourseList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCourseCard('Photoshop Editing Course', 'assets/images/Ps.png', 4.8, 230, 30),
          _buildCourseCard('Illustrator Editing Course', 'assets/images/Ai.png', 4.8, 230, 30),
          _buildCourseCard('Adobe Xd Editing Course', 'assets/images/Xd.png', 4.8, 230, 30),
        ],
      ),
    );
  }

  Widget _buildVerticalScrollableCourseList() {
    List<String> imagePaths = [
      'assets/images/Xd.png', 
      'assets/images/Ps.png', 
      'assets/images/Ai.png', 
    ];

    List<int> lessons = [
      30, 
      35, 
      40, 
    ];

    List<String> titles = [
      'Adobe Xd Editing Course',
      'Photoshop Editing Course',
      'Illustrator Editing Course',
    ];

    List<double> prices = [
      35.00,  
      50.00,  
      100.00, 
    ];

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true, 
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return _buildLargeCourseCard(
          title: titles[index],
          imagePath: imagePaths[index], 
          rating: 4.8,
          reviews: 230 + index * 20,
          lessons: lessons[index],
          price: prices[index],
          context: context,
        );
      },
    );
  }

  Widget _buildLargeCourseCard({
    required String title, 
    required String imagePath, 
    required double rating, 
    required int reviews, 
    required double price, 
    required int lessons, 
    required BuildContext context
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentSuccessScreen(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        width: double.infinity, 
        height: 120,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, width: 60, height: 100), 
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 14),
                      SizedBox(width: 4),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '$rating',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: ' ($reviews)',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Icon(Icons.play_circle_outline_outlined, color: Colors.grey, size: 15),
                      SizedBox(width: 2),
                      Flexible(
                        child: Text(
                          '$lessons Lessons',
                          style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 130, 128, 128)),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Price
                  Text(
                    '\$$price',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  
  Widget _buildCourseCard(String title, String imagePath, double rating, int reviews, int lessons) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 200, 
      height: 250,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(imagePath, height: 60),
          ),
          SizedBox(height: 10),

          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),

          Container(
            height: 30,
            child: const Stack(
              clipBehavior: Clip.none, 
              children: [
                Positioned(
                  left: 0,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage('assets/images/student1.png'),
                  ),
                ),
                Positioned(
                  left: 15, 
                  child: CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage('assets/images/student2.png'),
                  ),
                ),
                Positioned(
                  left: 30,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage('assets/images/student3.png'),
                  ),
                ),
                Positioned(
                  left: 45, 
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.green,
                    child: Text(
                      '+20',
                      style: TextStyle(
                        fontSize: 10, 
                        color: Colors.white, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 90,
                  child: Text(
                    'Participant',
                    style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(
              color: Colors.grey,
              thickness: 2,
              height: 30,
            ),
          ),

          Row(
            children: [
              Icon(Icons.star, color: Colors.orange, size: 14),
              SizedBox(width: 4),
              
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '$rating', 
                          style: TextStyle(
                            fontSize: 12, 
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' ($reviews)', 
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 15),

              Icon(Icons.play_circle_outline_outlined, color: Colors.grey, size: 14),
              SizedBox(width: 2),
              Flexible( 
                child: Text(
                  '$lessons Lessons',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}