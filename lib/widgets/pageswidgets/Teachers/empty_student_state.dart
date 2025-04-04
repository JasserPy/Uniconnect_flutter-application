import 'package:flutter/material.dart';

class EmptyStudentState extends StatelessWidget {
  const EmptyStudentState({Key? key}) : super(key: key);

  void _handleViewGuide() {
    // Handle guide navigation
  }

  void _handleContactAdmin() {
    // Handle admin contact
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 240,
              height: 160,
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(bottom: 0),
            ),
            const SizedBox(height: 22),
            const Text(
              'No Students Yet',
              style: TextStyle(
                color: Color.fromARGB(255, 26, 26, 26),
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight: FontWeight.w600,
                height: 1.5, // This gives us the 36px line height
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 22),
            const Text(
              "You currently don't have any students assigned to your classes. New students will appear here once they're enrolled.",
              style: TextStyle(
                color: Color(0xFF666666),
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.5, // This gives us the 24px line height
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _handleViewGuide,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 34, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: const Text(
                  'View Enrollment Guide',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: _handleContactAdmin,
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: const BorderSide(
                    color: Color(0xFF0001FF),
                    width: 1,
                  ),
                ),
                child: const Text(
                  'Contact Administration',
                  style: TextStyle(
                    color: Color(0xFF1700FF),
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
