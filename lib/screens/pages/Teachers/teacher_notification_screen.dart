import 'package:flutter/material.dart';
import 'package:student_dashboard/widgets/pageswidgets/Teachers/notification/recent_activity_card.dart';
import 'package:student_dashboard/widgets/pageswidgets/Teachers/notification/notification_item.dart';
import 'package:student_dashboard/widgets/pageswidgets/Teachers/notification/quick_stats_card.dart';
import 'package:student_dashboard/widgets/pageswidgets/layout/profile_header.dart';

class TeacherNotificationScreen extends StatefulWidget {
  const TeacherNotificationScreen({Key? key}) : super(key: key);

  @override
  _TeacherNotificationScreenState createState() =>
      _TeacherNotificationScreenState();
}

class _TeacherNotificationScreenState extends State<TeacherNotificationScreen> {
  bool _showUnreadOnly = false;
  List<Map<String, dynamic>> _notifications = [
    {
      'id': 1,
      'icon': Icons.info_outline,
      'title': 'Curriculum Update Required',
      'description': 'Please update your lesson plans',
      'time': '10 minutes ago',
      'isUnread': true,
    },
    {
      'id': 2,
      'icon': Icons.message_outlined,
      'title': 'New Parent Messages',
      'description': 'You have 3 unread messages',
      'time': '30 minutes ago',
      'isUnread': true,
    },
    {
      'id': 3,
      'icon': Icons.calendar_today_outlined,
      'title': 'Staff Development Day',
      'description': 'Mandatory training session',
      'time': '2 hours ago',
      'isUnread': false,
    },
    {
      'id': 4,
      'icon': Icons.calendar_today_outlined,
      'title': 'Staff Development Day',
      'description': 'Mandatory training session',
      'time': '2 hours ago',
      'isUnread': true,
    },
  ];

  void _handleNotificationTap(String notificationType) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Opening $notificationType details')),
    );
  }

  void _markAllAsRead() {
    setState(() {
      _notifications = _notifications
          .map((notification) => {...notification, 'isUnread': false})
          .toList();
    });
  }

  void _toggleUnreadFilter() {
    setState(() {
      _showUnreadOnly = !_showUnreadOnly;
    });
  }

  List<Map<String, dynamic>> get _filteredNotifications {
    return _showUnreadOnly
        ? _notifications.where((n) => n['isUnread']).toList()
        : _notifications;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileHeader(
              userName: 'Teacher Name',
              userInitial: 'T',
              isTeacher: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Notifications',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: _markAllAsRead,
                              child: const Text(
                                'Mark all as read',
                                style: TextStyle(color: Color(0xFF4318D1)),
                              ),
                            ),
                            const SizedBox(width: 10),
                            FilterChip(
                              label: Text(_showUnreadOnly ? 'All' : 'Unread'),
                              selected: _showUnreadOnly,
                              onSelected: (_) => _toggleUnreadFilter(),
                              selectedColor:
                                  const Color(0xFF4318D1).withOpacity(0.2),
                              labelStyle: TextStyle(
                                color: _showUnreadOnly
                                    ? const Color(0xFF4318D1)
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Notifications List
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _showUnreadOnly
                              ? const Color(0xFF4318D1)
                              : Colors.grey.shade300,
                          width: _showUnreadOnly ? 2 : 1,
                        ),
                      ),
                      constraints: const BoxConstraints(maxHeight: 400),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: _filteredNotifications.length,
                        itemBuilder: (context, index) {
                          final notification = _filteredNotifications[index];
                          return NotificationItem(
                            icon: notification['icon'],
                            title: notification['title'],
                            description: notification['description'],
                            time: notification['time'],
                            isUnread: notification['isUnread'],
                            onTap: () =>
                                _handleNotificationTap(notification['title']),
                            onMarkAsRead: () {
                              setState(() {
                                _notifications = _notifications
                                    .map((n) => n['id'] == notification['id']
                                        ? {...n, 'isUnread': false}
                                        : n)
                                    .toList();
                              });
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Recent Activity Section
                    const Text(
                      'Recent Activity',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      height: 200,
                      child: ListView(
                        children: const [
                          SizedBox(height: 10),
                          RecentActivityCard(),
                          SizedBox(height: 10),
                          RecentActivityCard(),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Quick Stats Section
                    const Text(
                      'Quick Stats',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const QuickStatsCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
