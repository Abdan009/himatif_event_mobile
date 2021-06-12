part of '../pages.dart';

class MahasiswaMainPage extends StatefulWidget {
  final int currentIndex;
  MahasiswaMainPage({this.currentIndex = 0});
  @override
  _MahasiswaMainPageState createState() => _MahasiswaMainPageState();
}

class _MahasiswaMainPageState extends State<MahasiswaMainPage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      body: tabs(),
    );
  }

  Widget tabs() {
    final tabs = [HomeMhsPage(), MainEventMhsPage(), ProfilMhsPage()];
    return tabs[currentIndex];
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: mainColor,
      unselectedItemColor: Color(0xFFE5E5E5),
      currentIndex: currentIndex,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      //iconSize: 20,
      onTap: (index) {
        setState(
          () {
            currentIndex = index;
          },
        );
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.date_range), label: 'Event'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
      ],
    );
  }
}
