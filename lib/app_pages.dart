import 'package:flutter/material.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key});

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  int secondsRemaining = 27;

  @override
  void initState() {
    super.initState();
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return false;
      setState(() {
        secondsRemaining = secondsRemaining > 0 ? secondsRemaining - 1 : 0;
      });
      return secondsRemaining > 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24),
                const Text(
                  'Brokkrs',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.8,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Find your dream property with ease',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF7C7E89),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 42),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: const Color(0xFFD6D7DC)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Text(
                              'Verify OTP',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFFF2F4F8),
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 18,
                              color: Color(0xFF41455C),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Enter the 6-digit code sent to +911234567890',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF7C7E89),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: List.generate(
                          6,
                          (index) => Expanded(
                            child: Container(
                              height: 54,
                              margin: EdgeInsets.only(
                                right: index == 5 ? 0 : 5 ,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF7F8FB),
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: const Color(0xFFD6D7DC),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Didn't receive code? Resend in 00:${secondsRemaining.toString().padLeft(2, '0')} s",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF7C7E89),
                        ),
                      ),
                      const SizedBox(height: 22),
                      SizedBox(
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            elevation: 0,
                            side: const BorderSide(color: Color(0xFF8C909A)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: const Text(
                            'Verify OTP',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: const [
                    Expanded(
                      child: Divider(thickness: 1, color: Color(0xFFD6D7DC)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          color: Color(0xFF8C909A),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(thickness: 1, color: Color(0xFFD6D7DC)),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    _SocialButton(icon: Icons.g_mobiledata),
                    SizedBox(width: 16),
                    _SocialButton(icon: Icons.apple),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int currentIndex = 0;

  static const List<Widget> pages = <Widget>[
    HomeFeedPage(),
    ReelsPage(),
    ChatListPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: const Color(0xFF979AA8),
        selectedItemColor: const Color(0xFF141526),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_outlined),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeFeedPage extends StatelessWidget {
  const HomeFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              Row(
                children: const [
                  Icon(Icons.add, size: 26),
                  Spacer(),
                  Text(
                    'Brokkrs',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Icon(Icons.notifications_none, size: 26),
                  SizedBox(width: 18),
                  Icon(Icons.tune, size: 26),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFD6D7DC),
                            width: 2,
                          ),
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1541447277817-94a484aabd20?auto=format&fit=crop&w=200&q=80',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF141526),
                            width: 1.5,
                          ),
                        ),
                        child: const Icon(Icons.add, size: 16),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: const Color(0xFFD6D7DC)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Color(0xFF8C909A)),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'search',
                              style: TextStyle(
                                color: Color(0xFF8C909A),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.network(
                  'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?auto=format&fit=crop&w=900&q=80',
                  height: 380,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _ActionChip(icon: Icons.favorite_border, label: '2'),
                  _ActionChip(icon: Icons.chat_bubble_outline, label: '3'),
                  _ActionChip(icon: Icons.send, label: '2'),
                  Icon(Icons.bookmark_border, color: Color(0xFF41455C)),
                ],
              ),
              const SizedBox(height: 14),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Shree Avenue',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReelsPage extends StatelessWidget {
  const ReelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                'https://images.unsplash.com/photo-1494526585095-c41746248156?auto=format&fit=crop&w=1000&q=80',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.24),
                    Colors.black.withOpacity(0.04),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.add, color: Colors.white, size: 28),
                      Text(
                        'Brokkrs',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.tune, color: Colors.white, size: 26),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(bottom: 18),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.42),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 18,
                              backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1544723795-3fb6469f5b39?auto=format&fit=crop&w=80&q=80',
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Text(
                                'Ammar Estate & Builders • Follow',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Escape to your dream villa in Lonavala',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Surrounded by lush greenery, fresh air, and peaceful vibes — perfect for weekend getaways or a luxury lifestyle.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const _OverlayAction(
                        icon: Icons.favorite_border,
                        label: 'Like',
                      ),
                      const _OverlayAction(
                        icon: Icons.chat_bubble_outline,
                        label: 'Comment',
                      ),
                      const _OverlayAction(icon: Icons.send, label: 'WhatsApp'),
                      const _OverlayAction(
                        icon: Icons.bookmark_border,
                        label: 'Save',
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
  }
}

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              child: Row(
                children: const [
                  Icon(Icons.add, size: 26),
                  Spacer(),
                  Text(
                    'Brokkrs',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Icon(Icons.notifications_none, size: 26),
                  SizedBox(width: 18),
                  Icon(Icons.tune, size: 26),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _ChatTile(
                    title: 'Ammar Estate & Builders',
                    subtitle: '3 days ago',
                    onTap: () {
                      Navigator.pushNamed(context, '/chat-detail');
                    },
                  ),
                  _ChatTile(
                    title: 'Stage Property',
                    subtitle: 'Yesterday',
                    onTap: () {
                      Navigator.pushNamed(context, '/chat-detail');
                    },
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

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Ammar Estate & Builders',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Online now',
              style: TextStyle(color: Color(0xFF7C7E89), fontSize: 12),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                children: const [
                  _ChatBubble(text: 'hi deva', isSent: false),
                  _ChatBubble(text: 'hi', isSent: true),
                  _ChatBubble(text: 'ok', isSent: true),
                  _ChatBubble(text: 'hmm', isSent: false),
                  _ChatBubble(text: 'yes', isSent: true),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Text(
                        'Type your message...',
                        style: TextStyle(color: Color(0xFF9FA3B0)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    height: 52,
                    width: 52,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF141526),
                    ),
                    child: const Icon(Icons.send, color: Colors.white),
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

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Column(
            children: [
              Row(
                children: const [
                  Icon(Icons.add, size: 26),
                  Spacer(),
                  Text(
                    'Brokkrs',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Icon(Icons.notifications_none, size: 26),
                  SizedBox(width: 18),
                  Icon(Icons.tune, size: 26),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundImage: const NetworkImage(
                      'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?auto=format&fit=crop&w=160&q=80',
                    ),
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Stage Property',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '@+911234567890',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF7C7E89),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Off plan sales | secondary sales | commercial sales',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF7C7E89),
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _ProfileStat(label: 'Posts', value: '9'),
                  _ProfileStat(label: 'Connect', value: '5'),
                  _ProfileStat(label: 'Favourite', value: '5'),
                ],
              ),
              const SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ProfileTab(icon: Icons.grid_view, active: true),
                  _ProfileTab(icon: Icons.play_circle_outline),
                  _ProfileTab(icon: Icons.edit_outlined),
                  _ProfileTab(icon: Icons.bookmark_border),
                ],
              ),
              const SizedBox(height: 18),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: List.generate(
                  6,
                  (index) => ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      color: Colors.grey.shade300,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1494526585095-c41746248156?auto=format&fit=crop&w=400&q=80',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile-edit');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141526),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const SizedBox(width: 18),
                  const Expanded(
                    child: Text(
                      'Stage Property',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Icon(Icons.camera_alt_outlined, color: Colors.white),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF1E2434),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Personal Information',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _DarkTextField(
                        label: 'Full Name',
                        value: 'Stage Property',
                      ),
                      const SizedBox(height: 12),
                      _DarkTextField(
                        label: 'Email',
                        value: 'stageproperties@gmail.com',
                      ),
                      const SizedBox(height: 12),
                      _DarkTextField(
                        label: 'Phone Number',
                        value: '+911234567890',
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Professional Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _DarkTextField(
                        label: 'License Number',
                        value: 'ORN.25174',
                      ),
                      const SizedBox(height: 12),
                      _DarkTextField(label: 'Brokerage', value: '2500'),
                      const SizedBox(height: 12),
                      _DarkDropdown(
                        label: 'Specialization',
                        value: 'Select specialization',
                      ),
                      const SizedBox(height: 30),
                    ],
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

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Notification',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                _FilterChipLabel(label: 'All', active: true),
                SizedBox(width: 12),
                _FilterChipLabel(label: 'Assigned'),
                SizedBox(width: 12),
                _FilterChipLabel(label: 'By Me'),
              ],
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView(
                children: const [
                  _NotificationTile(
                    title: 'Munim mentioned you in a Task comment',
                    subtitle: '@adam hi please give today\'s visit update...',
                    time: '2 hours ago',
                  ),
                  SizedBox(height: 14),
                  _NotificationTile(
                    title: 'Property Visit',
                    subtitle: 'Your Visit start time will start within 1 hour',
                    time: '8 hours ago',
                  ),
                  SizedBox(height: 14),
                  _NotificationImageTile(
                    title: 'Rachel Mananta send a image to you',
                    subtitle: 'Property Visit',
                    time: 'Yesterday at 10:00 AM',
                  ),
                  SizedBox(height: 14),
                  _NotificationTile(
                    title: 'Gabriel Santoso assigned you on Villa',
                    subtitle: 'Yesterday at 07:50 AM',
                    time: 'Yesterday at 07:50 AM',
                  ),
                  SizedBox(height: 14),
                  _NotificationTile(
                    title: 'Shahoto Siam assigned you on Villa',
                    subtitle: 'Yesterday at 07:50 AM',
                    time: 'Yesterday at 07:50 AM',
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

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode
          ? const Color(0xFF141526)
          : const Color(0xFFF5F7FB),
      appBar: AppBar(
        backgroundColor: darkMode ? const Color(0xFF141526) : Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text('Settings', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SettingsTile(
              label: 'Theme',
              trailing: Switch(
                value: darkMode,
                onChanged: (value) => setState(() => darkMode = value),
              ),
              darkMode: darkMode,
            ),
            const SizedBox(height: 14),
            _SettingsTile(label: 'Terms & Conditions', darkMode: darkMode),
            const SizedBox(height: 14),
            _SettingsTile(label: 'Logout', darkMode: darkMode),
          ],
        ),
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final String text;
  final bool isSent;

  const _ChatBubble({required this.text, required this.isSent});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 12,
        left: isSent ? 60 : 0,
        right: isSent ? 0 : 60,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: isSent ? const Color(0xFF141526) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSent ? Colors.white : const Color(0xFF141526),
          fontSize: 15,
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;

  const _SocialButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFD6D7DC)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Icon(icon, size: 32, color: const Color(0xFF2D2F34)),
    );
  }
}

class _ActionChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFF41455C)),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF41455C),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _OverlayAction extends StatelessWidget {
  final IconData icon;
  final String label;

  const _OverlayAction({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white.withOpacity(0.12),
          child: Icon(icon, color: Colors.white, size: 22),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

class _ChatTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ChatTile({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        leading: const CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?auto=format&fit=crop&w=80&q=80',
          ),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Color(0xFF7C7E89)),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(color: Color(0xFF7C7E89))),
        ],
      ),
    );
  }
}

class _ProfileTab extends StatelessWidget {
  final IconData icon;
  final bool active;

  const _ProfileTab({required this.icon, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 56,
      decoration: BoxDecoration(
        color: active ? Colors.white : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFD6D7DC)),
      ),
      child: Icon(icon, color: const Color(0xFF41455C)),
    );
  }
}

class _DarkTextField extends StatelessWidget {
  final String label;
  final String value;

  const _DarkTextField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFF22273C),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ],
    );
  }
}

class _DarkDropdown extends StatelessWidget {
  final String label;
  final String value;

  const _DarkDropdown({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFF22273C),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              const Icon(Icons.keyboard_arrow_down, color: Colors.white70),
            ],
          ),
        ),
      ],
    );
  }
}

class _FilterChipLabel extends StatelessWidget {
  final String label;
  final bool active;

  const _FilterChipLabel({required this.label, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: active ? Colors.white : const Color(0xFFF0F2F8),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: active ? Colors.black : const Color(0xFF7C7E89),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;

  const _NotificationTile({
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: const NetworkImage(
              'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?auto=format&fit=crop&w=80&q=80',
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF7C7E89),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  time,
                  style: const TextStyle(
                    color: Color(0xFFB1B5C0),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationImageTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;

  const _NotificationImageTile({
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _NotificationTile(title: title, subtitle: subtitle, time: time),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Image.network(
            'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&w=800&q=80',
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final String label;
  final Widget? trailing;
  final bool darkMode;

  const _SettingsTile({
    required this.label,
    this.trailing,
    this.darkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: darkMode ? const Color(0xFF1E2434) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: darkMode ? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing ??
              const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        ],
      ),
    );
  }
}
