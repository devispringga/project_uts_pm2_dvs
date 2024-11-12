import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  final String username;

  const DashboardPage({super.key, required this.username});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  late List<Widget> _pages;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Lists of bands
  final List<String> _rockBands = [
    'Led Zeppelin',
    'The Rolling Stones',
    'Queen',
    'Nirvana',
    'AC/DC',
    'Metallica'
  ];

  final List<Map<String, String>> _popBands = [
    {'name': 'The Beatles', 'imagePath': 'assets/beatles.jpg'},
    {'name': 'Backstreet Boys', 'imagePath': 'assets/backstreetboys.jpg'},
    {'name': 'Maroon 5', 'imagePath': 'assets/maroon_5.png'},
    {'name': 'NSYNC', 'imagePath': 'assets/nsync.jpg'},
    {'name': 'One Direction', 'imagePath': 'assets/onedirection.jpg'},
    {'name': 'The Jackson 5', 'imagePath': 'assets/jackson5.jpg'},
  ];

  final List<Map<String, String>> _messages = [
    {
      'sender': 'Rock Legends',
      'subject': 'Tour Announcement',
      'preview':
          'Catch Led Zeppelin and The Rolling Stones on tour this summer!',
    },
    {
      'sender': 'Pop Universe',
      'subject': 'New Album Release',
      'preview':
          'Backstreet Boys just dropped their latest album. Check it out now!',
    },
    {
      'sender': 'Rock Community',
      'subject': 'Guitar Workshop',
      'preview':
          'Join our exclusive guitar workshop with Metallica\'s lead guitarist.',
    },
    {
      'sender': 'Music Insider',
      'subject': 'Top 10 Rock Hits',
      'preview':
          'Discover the top rock hits of the year in our latest blog post.',
    },
    {
      'sender': 'Pop Fan Club',
      'subject': 'Fan Meet & Greet',
      'preview': 'Meet Maroon 5 in person at our upcoming fan event!',
    },
    {
      'sender': 'Rock Legends',
      'subject': 'Tour Announcement',
      'preview':
          'Catch Led Zeppelin and The Rolling Stones on tour this summer!',
    },
    {
      'sender': 'Pop Universe',
      'subject': 'New Album Release',
      'preview':
          'Backstreet Boys just dropped their latest album. Check it out now!',
    },
  ];

  final List<Map<String, String>> _notifications = [
    {
      'title': 'Concert Alert!',
      'message':
          'Queen will be performing live this weekend. Get your tickets now!',
      'date': '2024-11-15',
    },
    {
      'title': 'Album Release',
      'message': 'Backstreet Boys\' new album drops today. Don\'t miss it!',
      'date': '2024-11-12',
    },
    {
      'title': 'Guitar Workshop Reminder',
      'message': 'The Metallica guitar workshop starts in 2 days. Be ready!',
      'date': '2024-11-14',
    },
    {
      'title': 'Rock Legends Tour',
      'message':
          'Tickets for the Rock Legends Tour are now available for sale!',
      'date': '2024-11-10',
    },
    {
      'title': 'Concert Alert!',
      'message':
          'Queen will be performing live this weekend. Get your tickets now!',
      'date': '2024-11-15',
    },
    {
      'title': 'Album Release',
      'message': 'Backstreet Boys\' new album drops today. Don\'t miss it!',
      'date': '2024-11-12',
    },
  ];

  final List<Map<String, String>> _settingOptions = [
    {
      'title': 'Account Settings',
      'description': 'Manage your account settings'
    },
    {'title': 'Privacy', 'description': 'Set your privacy preferences'},
    {
      'title': 'Notifications',
      'description': 'Manage your notification preferences'
    },
    {'title': 'Language', 'description': 'Select your preferred language'},
    {
      'title': 'Security',
      'description': 'Change your password and security settings'
    },
    {'title': 'Help & Support', 'description': 'Get help and support'},
  ];

  @override
  void initState() {
    super.initState();
    // Initialize the pages list with a custom widget for 'Beranda' containing ListView and GridView
    _pages = <Widget>[
      _buildBerandaPage(), // Custom page with ListView and GridView
      _buildPesanPage(), // Updated Pesan page
      _buildProfilPage(), // Updated Profil page
      _buildNotifikasiPage(), // Notifikasi page
      _buildSettingPage(), // Setting page
    ];
  }

  Widget _buildPesanPage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Judul Inbox
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Inbox',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(),

          // ListView for displaying messages
          ListView.builder(
            shrinkWrap: true, // Prevent ListView from taking full screen height
            physics:
                const NeverScrollableScrollPhysics(), // Disable scroll on the ListView, it will scroll with the page
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              final message = _messages[index];
              return ListTile(
                leading: const Icon(Icons.mail, color: Colors.blue),
                title: Text(message['sender']!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message['subject']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      message['preview']!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                isThreeLine: true,
              );
            },
          ),

          const Divider(),

          // Title for the GridView section (Additional info or messages)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Info Lainnya',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          // GridView for displaying additional info or images (Horizontal scroll)
          SizedBox(
            height: 200, // Adjust the height as needed
            child: GridView.builder(
              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
              shrinkWrap:
                  true, // Prevent GridView from taking full screen height
              physics:
                  const BouncingScrollPhysics(), // Add bouncing effect on scroll
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Number of columns in the GridView
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.5, // Adjust the aspect ratio for the items
              ),
              itemCount: _messages
                  .length, // You can customize the count based on your content
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Card(
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.info, color: Colors.blue),
                        const SizedBox(height: 8),
                        Text(
                          message['sender']!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          message['subject']!,
                          style: TextStyle(color: Colors.grey[700]),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget for the 'Profil' page
  Widget _buildProfilPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/profile.jpg'),
          ),
          const SizedBox(height: 16),
          Text(
            widget.username, // Menampilkan nama pengguna
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '23552012004@sttbandung.ac.id', // Contoh email pengguna
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          const SizedBox(height: 16),
          const Text(
            'Penggemar musik Rock dan Pop. Senang menghadiri konser dan mengoleksi album klasik.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Logika untuk edit profil (misalnya navigasi ke halaman edit profil)
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Edit Profil',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () {
              // Logika untuk logout (misalnya navigasi ke halaman login atau logout user)
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
    });
  }

  // Page containing ListView and GridView with search functionality
  Widget _buildBerandaPage() {
    // Filtered lists based on search query
    final filteredRockBands = _rockBands
        .where((band) => band.toLowerCase().contains(_searchQuery))
        .toList();

    final filteredPopBands = _popBands
        .where((band) => band['name']!.toLowerCase().contains(_searchQuery))
        .toList();

    return Column(
      children: [
        Expanded(
          flex: 2,
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Rock',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              ...filteredRockBands.map((band) {
                return ListTile(
                  leading: const Icon(Icons.music_note),
                  title: Text(band),
                );
              }),
            ],
          ),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Pop',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 3,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.5,
            ),
            itemCount: filteredPopBands.length,
            itemBuilder: (context, index) {
              final band = filteredPopBands[index];
              return Card(
                color: Colors.grey[300],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        band['imagePath']!,
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      band['name']!,
                      style: TextStyle(color: Colors.grey[800], fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: _selectedIndex == 0 || _selectedIndex == 1 || _selectedIndex == 3
            ? TextField(
                controller: _searchController,
                onChanged: _updateSearchQuery,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              )
            : null, // No search bar on Profil and Setting pages
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tampilkan hanya di halaman Beranda
            if (_selectedIndex == 0) ...[
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
              Text(
                'Selamat Datang, ${widget.username}!',
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 20),
            ],
            Expanded(child: _pages[_selectedIndex]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Beranda',
            backgroundColor: Color.fromRGBO(224, 224, 224, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, color: Colors.black),
            label: 'Pesan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.black),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.black),
            label: 'Pengaturan',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildNotifikasiPage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Title for the notifications section
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Notifikasi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(),

          // ListView for displaying notifications (Vertical Scroll)
          ListView.builder(
            shrinkWrap: true, // Prevent ListView from taking full screen height
            physics:
                const NeverScrollableScrollPhysics(), // Disable scroll on the ListView, it will scroll with the page
            itemCount: _notifications.length,
            itemBuilder: (context, index) {
              final notification = _notifications[index];
              return ListTile(
                leading: const Icon(Icons.notifications, color: Colors.blue),
                title: Text(notification['title']!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification['message']!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification['date']!,
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    ),
                  ],
                ),
                isThreeLine: true,
              );
            },
          ),

          const SizedBox(height: 20),

          // Horizontal GridView for extra content
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Featured Items',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(),

          // Horizontal GridView
          Container(
            height: 150, // Set a fixed height for horizontal scroll area
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.5,
              ),
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                return Card(
                  color: Colors.grey[300],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notifications_active,
                        color: Colors.blue,
                        size: 50,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        notification['title']!,
                        style: TextStyle(color: Colors.grey[800], fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingPage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Title for the settings section
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Pengaturan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(),

          // ListView for displaying settings options (Vertical Scroll)
          ListView.builder(
            shrinkWrap: true, // Prevent ListView from taking full screen height
            physics:
                const NeverScrollableScrollPhysics(), // Disable scroll on the ListView, it will scroll with the page
            itemCount: _settingOptions.length,
            itemBuilder: (context, index) {
              final setting = _settingOptions[index];
              return ListTile(
                leading: const Icon(Icons.settings, color: Colors.blue),
                title: Text(setting['title']!),
                subtitle: Text(setting['description']!),
                isThreeLine: true,
                onTap: () {
                  // Handle setting item click (navigate or show details)
                },
              );
            },
          ),

          const SizedBox(height: 20),

          // Horizontal GridView for extra options or categories
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Pengaturan Lainnya',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(),

          // Horizontal GridView for extra settings
          Container(
            height: 150, // Set a fixed height for horizontal scroll area
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.5,
              ),
              itemCount: _settingOptions.length,
              itemBuilder: (context, index) {
                final setting = _settingOptions[index];
                return Card(
                  color: Colors.grey[300],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings_applications,
                        color: Colors.blue,
                        size: 50,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        setting['title']!,
                        style: TextStyle(color: Colors.grey[800], fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
