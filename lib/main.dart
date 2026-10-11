import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page = 0;
  var code = TextEditingController(text: "واحد IDE - iq.wahed.ide");

  void openGame(int n) {
    if (n == 1) code.text = "لعبة محيبس";
    if (n == 2) code.text = "لعبة دومنة";
    if (n == 3) code.text = "لعبة طاولي";
    setState(() {
      page = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0A0A),
      body: page == 0 ? editor() : page == 1 ? games() : settings(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF111111),
        selectedItemColor: Color(0xFFD4AF37),
        unselectedItemColor: Colors.white38,
        currentIndex: page,
        onTap: (i) {
          setState(() {
            page = i;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.code), label: "المحرر"),
          BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: "العاب"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "الاعدادات"),
        ],
      ),
    );
  }

  Widget editor() {
    return Scaffold(
      backgroundColor: Color(0xFF0A0A0A),
      appBar: AppBar(
        backgroundColor: Color(0xFF111111),
        title: Text("iq.wahed.ide", style: TextStyle(fontSize: 12)),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("تم البناء - مجاني 100%")),
              );
            },
            icon: Icon(Icons.play_arrow, color: Colors.green, size: 35),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: TextField(
          controller: code,
          maxLines: null,
          expands: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFF1C1C1C),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }

  Widget games() {
    return Scaffold(
      backgroundColor: Color(0xFF0A0A0A),
      appBar: AppBar(backgroundColor: Color(0xFF111111), title: Text("العاب عراقية")),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Card(child: ListTile(title: Text("محيبس"), trailing: ElevatedButton(onPressed: () => openGame(1), child: Text("فتح")))),
          Card(child: ListTile(title: Text("دومنة"), trailing: ElevatedButton(onPressed: () => openGame(2), child: Text("فتح")))),
          Card(child: ListTile(title: Text("طاولي"), trailing: ElevatedButton(onPressed: () => openGame(3), child: Text("فتح")))),
        ],
      ),
    );
  }

  Widget settings() {
    return Scaffold(
      backgroundColor: Color(0xFF0A0A0A),
      appBar: AppBar(backgroundColor: Color(0xFF111111), title: Text("الاعدادات")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Center(child: Text("1", style: TextStyle(fontSize: 60, color: Color(0xFFD4AF37)))),
          Center(child: Text("واحد IDE", style: TextStyle(color: Colors.white))),
          Center(child: Text("iq.wahed.ide - مجاني", style: TextStyle(color: Colors.white38, fontSize: 12))),
          SizedBox(height: 20),
          ListTile(leading: Icon(Icons.telegram, color: Colors.blue), title: Text("تيليجرام"), subtitle: Text("@wahed_ide")),
          ListTile(leading: Icon(Icons.email, color: Colors.orange), title: Text("الايميل"), subtitle: Text("support@wahed.iq")),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFD4AF37)),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تم البناء - واحد IDE جاهز")) );
            },
            child: Text("بناء APK", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}