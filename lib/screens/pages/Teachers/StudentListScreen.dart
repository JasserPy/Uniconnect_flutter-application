import 'package:flutter/material.dart';
import 'package:student_dashboard/screens/pages/Teachers/ChatScreen.dart';
import 'empty_students_screen.dart'; 

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({Key? key}) : super(key: key);

  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  // A list of class names (you can replace these with actual data)
  final List<String> classNames = ['Math 101', 'Science 202', 'History 303'];

  // A map to hold students for each class
  final Map<String, List<String>> classStudents = {
    'Math 101': [
      'John Doe',
      'Jane Smith',
      'Tom Lee',
      'Alice Brown',
      'Bob Green',
      'Charlie Black',
      'David White',
      'Eva Blue',
      'George Red',
      'Harry Yellow',
      'Isla Orange',
      'Jack Pink',
      'Kim Purple',
      'Liam Teal',
      'Mia Violet',
      'Noah Indigo',
      'Olivia Brown',
      'Paul Grey',
      'Quinn Tan',
      'Ryan Copper',
    ],
    'Science 202': [
      'Alice Brown',
      'Bob Green',
      'Charlie Black',
      'David White',
      'Eva Blue',
      'George Red',
      'Harry Yellow',
      'Isla Orange',
      'Jack Pink',
      'Kim Purple',
      'Liam Teal',
      'Mia Violet',
      'Noah Indigo',
      'Olivia Brown',
      'Paul Grey',
      'Quinn Tan',
      'Ryan Copper',
      'Sophie Emerald',
      'Thomas Scarlet',
      'Ursula Amethyst',
    ],
    'History 303': [
      'David White',
      'Eva Blue',
      'George Red',
      'Harry Yellow',
      'Isla Orange',
      'Jack Pink',
      'Kim Purple',
      'Liam Teal',
      'Mia Violet',
      'Noah Indigo',
      'Olivia Brown',
      'Paul Grey',
      'Quinn Tan',
      'Ryan Copper',
      'Sophie Emerald',
      'Thomas Scarlet',
      'Ursula Amethyst',
      'Victor Sapphire',
      'Wendy Rose',
      'Xander Jade',
    ],
  };

  // Initially selected class
  String selectedClass = 'Math 101';

  // A list to hold the students of the selected class
  List<String> currentStudents = [];

  // Text editing controller for search functionality
  TextEditingController searchController = TextEditingController();

  // Filtered list of students based on search query
  List<String> filteredStudents = [];

  @override
  void initState() {
    super.initState();
    // Set initial students for the first class
    currentStudents = classStudents[selectedClass]!;
    filteredStudents = currentStudents;
  }

  void filterStudents(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredStudents = currentStudents;
      } else {
        filteredStudents = currentStudents
            .where((student) =>
                student.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void sendMessageToAllStudents() {
    // Show a dialog to compose the message
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Send Message to All Students'),
          content: TextField(
            controller: TextEditingController(),
            decoration: const InputDecoration(hintText: 'Enter your message'),
            maxLines: 4,
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Get the message from the text controller
                String message = (TextEditingController().text).trim();

                // You can now send the message to all students
                if (message.isNotEmpty) {
                  print('Message sent to all students: $message');
                  // Close the dialog
                  Navigator.pop(context);
                }
              },
              child: const Text('Send'),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog without sending the message
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
        actions: [
          // Dropdown for class selection
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: DropdownButton<String>(
              value: selectedClass,
              onChanged: (String? newClass) {
                setState(() {
                  selectedClass = newClass!;
                  currentStudents = classStudents[selectedClass]!;
                  filteredStudents = currentStudents; // Reset filtered students
                  if (selectedClass == 'History 303') {
                    // Navigate to the empty list screen when History 303 is selected
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const EmptyStudentsScreen()),
                    );
                  }
                });
              },
              items: classNames.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              controller: searchController,
              onChanged: filterStudents,
              decoration: InputDecoration(
                labelText: 'Search Students',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 10),
            // Displaying selected class name and list of students
            Text(
              'Students in $selectedClass:',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredStudents.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(filteredStudents[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.message),
                        onPressed: () {
                          // Navigate to the chat screen when the message icon is clicked
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ChatScreen(student: filteredStudents[index]),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add new student action (for example, open a dialog)
              },
              child: const Text('Add Student'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendMessageToAllStudents,
        tooltip: 'Send Message to All Students',
        child: const Icon(Icons.send),
      ),
    );
  }
}

class ChatWithStudentScreen extends StatelessWidget {
  final String student;

  const ChatWithStudentScreen({Key? key, required this.student})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat with $student')),
      body: const Center(
        child: Text('Chat functionality goes here'),
      ),
    );
  }
}
