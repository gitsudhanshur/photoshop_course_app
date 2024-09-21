import 'package:flutter/material.dart';

import 'user_dashboard_screen.dart';

class CourseDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Details'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              // Notifications action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildCourseInfoSection(),
                  SizedBox(height: 20),
                  _buildVideoSection(),
                ],
              ),
            ),
            SizedBox(height: 16),
            _buildEnrollButton(context), // Button placed outside ListView, fixed at bottom
          ],
        ),
      ),
    );
  }

  // Course information section
  Widget _buildCourseInfoSection() {
    return Container(
      padding: EdgeInsets.all(16.0),
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
          Text('Our Student', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          _buildStudentAvatars(),
          SizedBox(height: 16),
          Text('Photoshop Editing Course', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          Text(
            'A representation that can convey the three-dimensional aspect of a design through a two-dimensional medium.',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconText(Icons.play_circle_outline, '30 Lessons'),
              _buildIconText(Icons.access_time, '13h 30min'),
            ],
          ),
        ],
      ),
    );
  }

  // Helper function to build the icon with text
  Widget _buildIconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.black),
        SizedBox(width: 8),
        Text(text, style: TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

Widget _buildStudentAvatars() {
  List<String> studentImages = [
    'assets/images/student1.png',
    'assets/images/student2.png',
    'assets/images/student3.png',
    'assets/images/student4.png',
    'assets/images/student5.png',
  ];

  // Generate the list of avatars using different images
  return Row(
    children: studentImages.map((imagePath) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 18,
        ),
      );
    }).toList(),
  );
}


  // Video section
  Widget _buildVideoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Video', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('View All', style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
        SizedBox(height: 16),
        _buildVideoListItem('Introduction', '3h 30min'),
        _buildVideoListItem('Install Software', '1h 30min'),
        _buildVideoListItem('Learn Tools', '2h 30min'),
        _buildVideoListItem('Tracing Sketsa', '2h 00min'),
      ],
    );
  }

  // Video list item
  Widget _buildVideoListItem(String title, String duration) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
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
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: Icon(Icons.lock, color: Colors.grey),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.access_time, size: 16, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(duration, style: TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ],
          ),
          Spacer(),
          OutlinedButton(
            onPressed: () {
              // Play video action
            },
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8), 
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              side: BorderSide(color: Colors.grey)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min, 
              children: [
                Icon(Icons.play_circle, size: 18, color: Color.fromARGB(255, 172, 240, 71)),
                SizedBox(width: 8), 
                Text('Play Video', style: TextStyle(fontSize: 14, color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnrollButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center, // Center the row
      children: [
        // Container with the image (icon)
        Container(
          width: 50,  // Adjust the size of the icon box as needed
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 172, 240, 71),  // Light green color (replace as needed)
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
          child: Center(
            child: Image.asset(
              'assets/images/bookmark.png', // Replace with your image asset
              width: 30, // Adjust the size of the image
              height: 30,
            ),
          ),
        ),
        SizedBox(width: 16), // Spacing between the icon and the button

        // "Enroll Now" button
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserDashboardScreen()), // Navigate to the new screen
              );
            },
            child: Container(
              height: 50,  // Make the button's height match the icon
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 172, 240, 71),  // Same light green color
                borderRadius: BorderRadius.circular(8),  // Rounded corners
              ),
              child: Center(
                child: Text(
                  'Enroll Now',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black, // Black text color
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
