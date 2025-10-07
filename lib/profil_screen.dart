import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 92, 182),
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 218, 96, 239),
      title: Text("Profil"),
      ),
      body: Center(
        child: ListView(
          children: [
            Image.asset("asset/loopy.png",height: 200,),
            Text("Nama",style: TextStyle(fontSize: 30,color: Colors.black,),),
            Text("Alamat"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.favorite),
              Icon(Icons.favorite),
              Icon(Icons.favorite),
            ],),
            Card(
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text("alamat"),
                subtitle: Text("arabasta"),
                trailing: Icon(Icons.arrow_circle_right),
                ),
            ),
            Card(
               child: ListTile(
                leading: Icon(Icons.local_pizza),
                title: Text("hobi"),
                subtitle: Text("makan"),
                trailing: Icon(Icons.arrow_circle_right),
                ),
             ),
             Card(
               child: ListTile(
                leading: Icon(Icons.info),
                title: Text("Logout"),
                trailing: Icon(Icons.exit_to_app),
                ),
             ),
          ],
          ),
      ),
    );
  }
}