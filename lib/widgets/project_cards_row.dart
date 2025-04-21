import 'package:flutter/material.dart';
import 'project_card.dart';

class ProjectCardsRow extends StatelessWidget {
  final Animation<double> animation;
  final double maxWidth;

  const ProjectCardsRow({
    super.key,
    required this.animation,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate smaller card width based on screen size
    final cardWidth = maxWidth > 600
        ? (maxWidth - 32 * 2 - 16 * 4) /
            3 // 32px padding on each side, 16px gap between cards
        : maxWidth - 32 * 2; // 32px padding on each side for mobile

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(animation.value * 500, 0),
          child: Container(
            width: maxWidth,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 16), // Left padding
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProjectCard(
                      title: 'Desi Recipe Note Book',
                      description:
                          'This is a description of my first project. It showcases my skills in Flutter development.',
                      width: cardWidth,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProjectCard(
                      title: 'Expense Tracker',
                      description:
                          'Just built a minimal Flutter Expense Tracker App!\n\n'
                          '• Clean, structured code\n'
                          '• Material 3 theming\n'
                          '• Auto dark mode\n'
                          '• Landscape-friendly\n'
                          '• Swipe-to-delete with Dismissible',
                      width: cardWidth,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProjectCard(
                      title: 'favourite place app',
                      description:
                          'This is a description of my third project. It highlights my ability to create beautiful user interfaces.',
                      width: cardWidth,
                    ),
                  ),
                  const SizedBox(width: 16), // Right padding
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
