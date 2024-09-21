import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:barcode/barcode.dart';

class PaymentSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 70),
            _buildPaymentInfoContainer(),
            SizedBox(height: 50),
            _buildDoneButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentInfoContainer() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.all(16),
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildPaymentDetails(),
                  SizedBox(height: 30),
                  _buildCourseDetails(),
                  SizedBox(height: 40),
                  _buildBarcode(),
                ],
              ),
            ),
            Positioned(
              top: -45,
              left: (constraints.maxWidth / 2) - 40,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _buildBackgroundDecorations(),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: const Color.fromARGB(255, 34, 214, 103),
                    child: Icon(Icons.check, size: 50, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPaymentDetails() {
    return Column(
      children: [
        SizedBox(height: 50),
        Text(
          'Payment Success',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          '\$35.00',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 34, 214, 103),
          ),
        ),
      ],
    );
  }

  Widget _buildCourseDetails() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(197, 221, 220, 220),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/student3.png'),
                radius: 12,
              ),
              SizedBox(width: 8),
              Text(
                'Christiana Amandla',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'Adobe Xd Editing Course',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconText('ID Transcription', 'TA11231PW'),
              _buildIconText('Invoice Date', 'Nov 14, 2023'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconText(String label, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }


  Widget _buildBarcode() {
    return BarcodeWidget(
      barcode: Barcode.code128(),
      data: 'TA11231PW',
      width: 340,
      height: 70,
    );
  }

  Widget _buildBackgroundDecorations() {
    return Container(
      height: 100,
      width: 100,
      child: const Stack(
        children: [
          Positioned(
            top: 30,
            right: 88,
            child: Icon(Icons.star, color: Colors.orange, size: 15),
          ),
          Positioned(
            top: 0,
            right: 80,
            child: Icon(Icons.celebration_sharp, color: Colors.blue, size: 15),
          ),
          Positioned(
            bottom: 0,
            left: 80,
            child: Icon(Icons.star, color: Colors.pink, size: 15),
          ),
          Positioned(
            bottom: 25,
            right: 88,
            child: Icon(Icons.circle, color: Colors.green, size: 12),
          ),
          Positioned(
            top: 25,
            left: 88,
            child: Icon(Icons.star, color: Colors.orange, size: 15),
          ),
          Positioned(
            top: 0,
            left: 80,
            child: Icon(Icons.circle, color: Colors.blue, size: 13),
          ),
          Positioned(
            bottom: 0,
            right: 80,
            child: Icon(Icons.star, color: Colors.pink, size: 15),
          ),
          Positioned(
            bottom: 25,
            left: 90,
            child: Icon(Icons.celebration, color: Colors.green, size: 15),
          ),
        ],
      ),
    );
  }

  Widget _buildDoneButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        margin: EdgeInsets.only(bottom: 0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 168, 241, 84),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Done',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
