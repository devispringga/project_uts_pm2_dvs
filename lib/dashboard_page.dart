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

  @override
  void initState() {
    super.initState();
    // Initialize the pages list with a custom widget for 'Beranda' containing ListView and GridView
    _pages = <Widget>[
      _buildBerandaPage(), // Custom page with ListView and GridView
      const Center(child: Text('Pesan')),
      const Center(child: Text('Profil')),
      const Center(child: Text('Notifikasi')),
      const Center(child: Text('Setting')),
    ];
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
        title: TextField(
          controller: _searchController,
          onChanged: _updateSearchQuery,
          decoration: const InputDecoration(
            hintText: 'Search musikita...',
            hintStyle: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.grey,
            ),
            border: InputBorder.none,
            icon: Icon(Icons.search),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Datang, ${widget.username}!',
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 20),
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
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
