import 'package:flutter/material.dart';

void main() {
  runApp(const SankalpApp());
}

const Color saffron = Color(0xFFE88A26);
const Color darkBrown = Color(0xFF382719);
const Color cream = Color(0xFFFFFAF1);
const Color softGreen = Color(0xFFE5F0E4);

class SankalpApp extends StatelessWidget {
  const SankalpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sankalp - NaamVriddhi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: cream,
        colorScheme: ColorScheme.fromSeed(seedColor: saffron, surface: cream),
        appBarTheme: const AppBarTheme(
          backgroundColor: cream,
          foregroundColor: darkBrown,
        ),
        fontFamily: 'Roboto',
      ),
      home: const SankalpHomePage(),
    );
  }
}

class SankalpHomePage extends StatefulWidget {
  const SankalpHomePage({super.key});

  @override
  State<SankalpHomePage> createState() => _SankalpHomePageState();
}

class _SankalpHomePageState extends State<SankalpHomePage> {
  int _selectedIndex = 0;
  int _writtenNames = 125;
  final int _dailyGoal = 108;

  void _writeNaam() {
    setState(() {
      _writtenNames++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Your Naam Lekhan progress has been updated!'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            _buildHome(),
            _buildSimplePage(
              Icons.edit_note_rounded,
              'Naam Lekhan',
              'Your spiritual writing journey starts here.',
            ),
            _buildSimplePage(
              Icons.history_rounded,
              'My Progress',
              'Your Naam Lekhan history will appear here.',
            ),
            _buildSimplePage(
              Icons.person_outline_rounded,
              'My Profile',
              'Manage your Sankalp and personal settings.',
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFFFE8C9),
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.edit_note_rounded),
            label: 'Write',
          ),
          NavigationDestination(
            icon: Icon(Icons.insights_rounded),
            label: 'Progress',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildHome() {
    final double progress = (_writtenNames / _dailyGoal)
        .clamp(0.0, 1.0)
        .toDouble();

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // Header
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE8C9),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.spa_rounded,
                      color: saffron,
                      size: 29,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SANKALP',
                          style: TextStyle(
                            color: darkBrown,
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 2,
                          ),
                        ),
                        Text(
                          'NaamVriddhi',
                          style: TextStyle(color: Colors.brown, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none_rounded),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: darkBrown,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Welcome section
              const Text(
                'Namaste 🙏',
                style: TextStyle(
                  color: darkBrown,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'Every sacred name brings you closer to your Sankalp.',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Color(0xFF817365),
                ),
              ),

              const SizedBox(height: 24),

              // Daily progress card
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFE9CA), Color(0xFFFFF5E5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(color: const Color(0xFFF6D7AD)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "TODAY'S SANKALP",
                            style: TextStyle(
                              color: darkBrown,
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                              letterSpacing: 1.4,
                            ),
                          ),
                        ),
                        const Icon(Icons.wb_sunny_outlined, color: saffron),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$_writtenNames',
                                style: const TextStyle(
                                  fontSize: 43,
                                  height: 1.1,
                                  fontWeight: FontWeight.w800,
                                  color: darkBrown,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'of $_dailyGoal names completed',
                                style: const TextStyle(
                                  color: Color(0xFF806A53),
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 17),
                              SizedBox(
                                width: 155,
                                child: FilledButton.icon(
                                  onPressed: _writeNaam,
                                  icon: const Icon(
                                    Icons.edit_note_rounded,
                                    size: 19,
                                  ),
                                  label: const Text('Write Naam'),
                                  style: FilledButton.styleFrom(
                                    backgroundColor: saffron,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          height: 112,
                          width: 112,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox.expand(
                                child: CircularProgressIndicator(
                                  value: progress,
                                  strokeWidth: 9,
                                  backgroundColor: Colors.white,
                                  color: saffron,
                                  strokeCap: StrokeCap.round,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${(progress * 100).round()}%',
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: darkBrown,
                                    ),
                                  ),
                                  const Text(
                                    'COMPLETED',
                                    style: TextStyle(
                                      fontSize: 8,
                                      letterSpacing: 0.7,
                                      color: darkBrown,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 27),

              // Quick actions heading
              const Text(
                'Your Spiritual Journey',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: darkBrown,
                ),
              ),
              const SizedBox(height: 14),

              Row(
                children: [
                  Expanded(
                    child: _actionCard(
                      icon: Icons.menu_book_rounded,
                      title: 'Naam Lekhan',
                      subtitle: 'Write sacred names',
                      color: const Color(0xFFFFE8C9),
                      onTap: () {
                        setState(() => _selectedIndex = 1);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _actionCard(
                      icon: Icons.insights_rounded,
                      title: 'My Progress',
                      subtitle: 'Track your journey',
                      color: softGreen,
                      onTap: () {
                        setState(() => _selectedIndex = 2);
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 26),

              // Daily inspiration
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: darkBrown.withValues(alpha: 0.04),
                      blurRadius: 16,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.auto_awesome_rounded,
                          color: saffron,
                          size: 22,
                        ),
                        SizedBox(width: 9),
                        Text(
                          'A Thought for Today',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: darkBrown,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      '“Small steps taken with devotion create a beautiful journey.”',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.7,
                        color: Color(0xFF756555),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Stay consistent. Stay connected.',
                      style: TextStyle(
                        color: saffron,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Daily reminder
              Container(
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5F0E4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.notifications_active_outlined,
                      size: 28,
                      color: Color(0xFF547653),
                    ),
                    SizedBox(width: 13),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Make time for your Sankalp',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF355335),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'A little devotion every day goes a long way.',
                            style: TextStyle(
                              color: Color(0xFF587158),
                              fontSize: 12,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _actionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(icon, color: darkBrown, size: 25),
              ),
              const SizedBox(height: 15),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: darkBrown,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 11, color: Color(0xFF817365)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSimplePage(IconData icon, String title, String subtitle) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 64, color: saffron),
            const SizedBox(height: 18),
            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: darkBrown,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFF817365), height: 1.6),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                setState(() => _selectedIndex = 0);
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
