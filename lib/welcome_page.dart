import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //! المربع البرتقالي العلوي
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange[700],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),

            //! الصورة الدائرية مع النص تحتها مباشرة
            Column(
              children: [
                Transform.translate(
                  offset: Offset(0, -50),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 55,
                      //! صوره التطبيق
                      backgroundImage: AssetImage('assets/profile.png'),
                      child: Icon(Icons.person, size: 50, color: Colors.grey),
                    ),
                  ),
                ),

                //! نص الترحيب تحت الصورة مباشرة
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Column(
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[700],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Nimah',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //! النص الغريب حقكم
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'sed do eiusmod tempor incididunt ut labore et dolore',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'magna aliqua.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            //! الأزرار في الأسفل
            Padding(
              padding: EdgeInsets.fromLTRB(80, 40, 80, 30),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[700],
                        padding: EdgeInsets.symmetric(vertical: 12),
                        minimumSize: Size(0, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Log In',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.orange[700],
                        padding: EdgeInsets.symmetric(vertical: 12),
                        minimumSize: Size(0, 40),
                        side: BorderSide(
                          color: Colors.orange,
                          width: 1.5,
                        ), // حدود أنحف
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
