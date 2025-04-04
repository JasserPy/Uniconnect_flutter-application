import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_dashboard/data/notifiers.dart';
import 'package:student_dashboard/theme/student/colors.dart';
import 'package:student_dashboard/widgets/pageswidgets/layout/news/news_card.dart';
import '../../../widgets/pageswidgets/layout/profile_header.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageisdark,
      builder: (context, bool isDarkMode, child) {
        final theme = _getThemeColors(isDarkMode);

        return Scaffold(
          backgroundColor: theme['backgroundColor'],
          body: SafeArea(
            child: Column(
              children: [
                const ProfileHeader(
                  isTeacher: true,
                  userName: 'Teacher Name',
                  userInitial: 'T',
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header avec icône de notification
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "School Announcements",
                                style: GoogleFonts.inter(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: theme['highlightColor'],
                                ),
                              ),
                              IconButton(
                                icon: Badge(
                                  label: const Text(''), // Correction ici
                                  child: Icon(
                                    Icons.notifications_outlined,
                                    color: theme['textColor'],
                                  ),
                                ),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Notifications clicked')),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Liste horizontale des News Cards
                        SizedBox(
                          height: 220,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 16),
                            itemBuilder: (context, index) => SizedBox(
                              width: 280,
                              child: NewsCard(
                                imagePath: _getimage(index), // Correction ici
                                title: _getNewsTitle(index),
                                description: _getNewsDescription(index),
                                textColor: theme['textColor']!,
                                secondaryTextColor:
                                    theme['secondaryTextColor']!,
                                onTap: () => _handleNewsTap(context, index),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Section des mises à jour
                        _buildUpdatesSection(context, theme),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Méthode pour récupérer les couleurs du thème
  Map<String, Color> _getThemeColors(bool isDarkMode) {
    return {
      'backgroundColor': isDarkMode ? Colors.grey[900]! : AppColors.background,
      'textColor': isDarkMode ? Colors.white : AppColors.textPrimary,
      'secondaryTextColor':
          isDarkMode ? Colors.grey[400]! : AppColors.textSecondary,
      'cardBackgroundColor':
          isDarkMode ? Colors.grey[800]! : AppColors.cardBackground,
      'borderColor': isDarkMode ? const Color(0xFF616161) : AppColors.border,
      'highlightColor': const Color(0xFF4318D1),
    };
  }

  // Fonction pour récupérer l'image correcte
  String _getimage(int index) {
    List<String> images = [
      'assets/images/emplois.png',
      'assets/images/orientation.png',
      'assets/images/war.png',
      'assets/images/az.png',
    ];
    return images[index % images.length]; // Pour éviter les erreurs d'index
  }

  // Section des mises à jour
  Widget _buildUpdatesSection(BuildContext context, Map<String, Color> theme) {
    final updates = [
      {'title': 'Term Papers Due Next Week', 'time': '2 hours ago'},
      {'title': 'Department Meeting Tomorrow', 'time': '3 hours ago'},
      {'title': 'Curriculum Review Session', 'time': '5 hours ago'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Recent Updates",
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: theme['textColor'],
            ),
          ),
        ),
        const SizedBox(height: 8),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: updates.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) => _buildUpdateCard(
            context,
            updates[index]['title']!,
            updates[index]['time']!,
            theme: theme,
          ),
        ),
      ],
    );
  }

  Widget _buildUpdateCard(BuildContext context, String title, String time,
      {required Map<String, Color> theme}) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme['borderColor']!),
      ),
      color: theme['cardBackgroundColor'],
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _handleUpdateTap(context, title),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: theme['highlightColor']!.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.notifications_none,
                  color: theme['highlightColor'],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        color: theme['textColor'],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      time,
                      style: GoogleFonts.inter(
                        color: theme['secondaryTextColor'],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Méthodes pour gérer les clics
  void _handleNewsTap(BuildContext context, int index) {
    Navigator.pushNamed(context, '/newsDetail', arguments: {
      'title': _getNewsTitle(index),
      'description': _getNewsDescription(index),
    });
  }

  void _handleUpdateTap(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Opening $title details')),
    );
  }

  // Méthodes pour récupérer les titres et descriptions des news
  String _getNewsTitle(int index) {
    return [
      'New Student Council Elections',
      'Science Fair Winners Announced',
      'Library Extended Hours',
      'Sports Day Preparations'
    ][index];
  }

  String _getNewsDescription(int index) {
    return [
      'Cast your vote for the next student leadership team',
      'Congratulations to all participants',
      'Library will remain open until 10 PM during exams',
      'Register your teams for the upcoming sports events'
    ][index];
  }
}
