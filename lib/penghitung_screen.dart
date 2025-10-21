import 'package:flutter/material.dart';
import 'profil_screen.dart';

class PenghitungScreen extends StatefulWidget {
  const PenghitungScreen({super.key});

  @override
  State<PenghitungScreen> createState() => _PenghitungScreenState();
}

class _PenghitungScreenState extends State<PenghitungScreen> {
  int nilai = 0;

  menghitung() {
    setState(() {
      nilai = nilai + 1;
    });
    print("ini nilai = $nilai");
  }

  pindahHalaman() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ProfilScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Penghitung",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 244, 24, 112), 
      ),

      backgroundColor: const Color.fromARGB(255, 240, 79, 133), 
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "$nilai",
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  menghitung();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.pinkAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 6,
                ),
                child: const Text(
                  "Hitung",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      pindahHalaman();
                    },
                    icon: const Icon(Icons.person, color: Colors.white),
                    label: const Text(
                      "Profil",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(width: 30),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.home, color: Colors.white),
                    label: const Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}