import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  final Animation<double> animation;

  const HeroSection({
    super.key,
    required this.animation,
  });

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $urlString';
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, animation.value * 300),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              children: [
                // Left side - Image
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 64.0),
                    child: Container(
                      height: 600,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://i.postimg.cc/HWQT2vmP/profile.jpg'),
                          fit: BoxFit.cover,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 64),
                // Right side - Text content
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "I'm Avik Sinha.",
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "A Flutter Developer",
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "based in Sobabazzaaar,India",
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey,
                                ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "I'm probably the most passionate developer you will ever get to work with. If you have a great project that needs amazing skills, I'm your guy.",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 18,
                              color: Colors.grey[600],
                            ),
                      ),
                      const SizedBox(height: 32),
                      // Social Media Icons
                      Row(
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () async {
                                const url =
                                    'https://www.linkedin.com/in/avik-sinha-a6a336251/';
                                final uri = Uri.parse(url);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri,
                                      mode: LaunchMode.externalApplication);
                                }
                              },
                              child: Image.network(
                                'https://cdn-icons-png.flaticon.com/512/174/174857.png',
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ),
                          const SizedBox(width: 24),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () async {
                                const url = 'https://github.com/avikcodes04';
                                final uri = Uri.parse(url);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri,
                                      mode: LaunchMode.externalApplication);
                                }
                              },
                              child: Image.network(
                                'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png',
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
