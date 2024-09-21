import 'package:flutter/material.dart';

import 'payment_success_screen.dart';

class UserDashboardScreen extends StatefulWidget {
  @override
  _UserDashboardScreenState createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  int _currentIndex = 0;

  // List of widgets representing different screens for each tab
  final List<Widget> _screens = [
    UserDashboardBodyScreen(),  // Main dashboard screen
    Center(child: Text('Favorites Screen')),
    Center(child: Text('Notifications Screen')),  // Placeholder for favorites
    Center(child: Text('Profile Screen')),    // Placeholder for profile
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
              backgroundImage: AssetImage('assets/images/student3.png'), // Replace with actual user image
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
              // Search functionality
            },
          ),
        ],
      ),
      body: _screens[_currentIndex],  // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,  // The index of the current tab
        onTap: (index) {
          setState(() {
            _currentIndex = index;  // Update the index on tap
          });
        },
        items: [
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
        selectedItemColor: Colors.green,  // Color for the selected tab
        unselectedItemColor: Colors.grey,  // Color for unselected tabs
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

  // Course Progress Card
  Widget _buildCourseProgressCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 168, 241, 84), // Light green color from the screenshot
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
          // Container holding both course title and date section
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 212, 247, 188), // Slightly different green shade for the background
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Course title "Mathematics Course"
                Text(
                  'Mathematics Course',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                
                // Date section with calendar icon
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 168, 241, 84), // Slightly lighter green for the date section
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
          SizedBox(height: 20), // Space between sections

          // Bottom section with Completed and Hours Spent
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Completed Section
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 212, 247, 188),
                    child: Icon(Icons.check_circle, color: const Color.fromARGB(255, 145, 209, 72)),
                  ),
                  SizedBox(width: 8), // Space between icon and text
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

              // Divider between sections
              Container(
                height: 55,
                width: 1,
                color: Color.fromARGB(255, 243, 245, 242),
              ),

              // Hours Spent Section
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 212, 247, 188),
                    child: Icon(Icons.access_time_filled, color: Color.fromARGB(255, 145, 209, 72)),
                  ),
                  SizedBox(width: 8), // Space between icon and text
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

  // Section Title
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

  // Popular Course List
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

  // Second Popular Course List (Vertical Scroll with Larger Cards)
  Widget _buildVerticalScrollableCourseList() {
    // List of different image paths for each course card
    List<String> imagePaths = [
      'assets/images/Xd.png',  // First course image
      'assets/images/Ps.png',  // Second course image
      'assets/images/Ai.png',  // Third course image
    ];

    // List of lessons for each course
    List<int> lessons = [
      30,  // First course lessons
      35,  // Second course lessons
      40,  // Third course lessons
    ];

    // List of different titles for each course
    List<String> titles = [
      'Adobe Xd Editing Course',
      'Photoshop Editing Course',
      'Illustrator Editing Course',
    ];

    // List of prices for each course
    List<double> prices = [
      35.00,  // Price for first course
      50.00,  // Price for second course
      100.00,  // Price for third course
    ];

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(), // To prevent it from conflicting with the parent scroll
      shrinkWrap: true, // Allow ListView to fit within another scrollable widget
      itemCount: imagePaths.length, // Number of cards you want to display
      itemBuilder: (context, index) {
        // Use different image paths and prices for each card
        return _buildLargeCourseCard(
          title: titles[index],
          imagePath: imagePaths[index], // Use a different image for each card
          rating: 4.8,
          reviews: 230 + index * 20,
          lessons: lessons[index],
          price: prices[index], // Pass the price for each course
          context: context,
        );
      },
    );
  }

  // Larger Course Card (Vertically Scrollable) with Price instead of Lessons
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
        // Navigate to CourseDetailScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentSuccessScreen(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        width: double.infinity, // Full width for larger cards
        height: 120, // Larger height
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
            // Course image (large)
            Image.asset(imagePath, width: 60, height: 100), // Different course image for each card
            SizedBox(width: 15),
            // Course details
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
                  // Rating and other details
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


  
  // Single Course Card
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
          // Course image
          Center(
            child: Image.asset(imagePath, height: 60),
          ), // Replace with actual course image
          SizedBox(height: 10),

          // Course title
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),

          // Participant avatars
          Container(
            height: 30, // Set a fixed height for the container
            child: Stack(
              clipBehavior: Clip.none, // Allow the avatars to overflow outside the Stack
              children: [
                Positioned(
                  left: 0, // First avatar
                  child: CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage('assets/images/student1.png'), // Replace with actual avatar
                  ),
                ),
                Positioned(
                  left: 15, // Slightly overlap the second avatar
                  child: CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage('assets/images/student2.png'), // Replace with actual avatar
                  ),
                ),
                Positioned(
                  left: 30, // Slightly overlap the third avatar
                  child: CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage('assets/images/student3.png'), // Replace with actual avatar
                  ),
                ),
                Positioned(
                  left: 45, // Slightly overlap the "+20" avatar
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
              color: Colors.grey, // Divider color
              thickness: 2,
              height: 30, // Thickness of the divider
            ),
          ),

          // Rating and lessons info
          Row(
            children: [
              // Rating Section
              Icon(Icons.star, color: Colors.orange, size: 14),
              SizedBox(width: 4),
              
              // Text.rich allows you to display text with different styles
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '$rating', // Larger font size for the rating
                          style: TextStyle(
                            fontSize: 12, // Larger font size for rating
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' ($reviews)', // Smaller font size for reviews
                          style: TextStyle(
                            fontSize: 8, // Smaller font size for the reviews count
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 15),

              // Lessons Section
              Icon(Icons.play_circle_outline_outlined, color: Colors.grey, size: 14),
              SizedBox(width: 2),
              Flexible( // Wrap the text in Flexible to prevent overflow
                child: Text(
                  '$lessons Lessons',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  overflow: TextOverflow.ellipsis, // Prevent overflow of text
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}