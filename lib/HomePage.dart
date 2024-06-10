import 'package:flutter/material.dart';
import 'recommend_page.dart';
import 'recommend_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111111),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width > 600 ? 600 : null,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/Witch_Refrigerator.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '마녀의 냉장고',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.red,
                    fontSize: 55,
                    fontStyle: FontStyle.italic,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 20),
                RecommendButton(
                  text: '촬영하기',
                  onPressed: () {
                    // 촬영하기 버튼을 누르면 RecommendPage로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecommendPage()),
                    );
                  },
                ),
                SizedBox(height: 10),
                RecommendButton(
                  text: '광고보기',
                  onPressed: () {
                    print('광고보기 Button pressed ...');
                  },
                ),
                SizedBox(height: 10),
                RecommendButton(
                  text: '토큰보기',
                  onPressed: () {
                    print('토큰보기 Button pressed ...');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
