import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key, this.username});

  final String? username;

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController hobiController = TextEditingController();

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    _loadProfil(); // Ambil data yang tersimpan di awal
  }

  // Ambil data dari SharedPreferences
  Future<void> _loadProfil() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      namaController.text =
          prefs.getString('nama') ?? (widget.username ?? "Pengguna");
      alamatController.text = prefs.getString('alamat') ?? "Arabasta";
      hobiController.text = prefs.getString('hobi') ?? "Makan";
    });
  }


  Future<void> _saveProfil() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nama', namaController.text);
    await prefs.setString('alamat', alamatController.text);
    await prefs.setString('hobi', hobiController.text);
  }


  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn'); 
    if (!mounted) return;

    
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 79, 133),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 24, 112),
        title: const Text(
          "Profil Pengguna",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            ClipOval(
              child: Image.asset(
                "asset/loopy.png", 
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 10),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.favorite, color: Colors.red, size: 30),
                Icon(Icons.favorite, color: Colors.red, size: 30),
                Icon(Icons.favorite, color: Colors.red, size: 30),
              ],
            ),

            const SizedBox(height: 20),

            
            _buildTextField(
              controller: namaController,
              label: "Nama",
              enabled: isEditing,
            ),
            const SizedBox(height: 12),

            
            _buildTextField(
              controller: alamatController,
              label: "Alamat",
              enabled: isEditing,
            ),
            const SizedBox(height: 12),

            
            _buildTextField(
              controller: hobiController,
              label: "Hobi",
              enabled: isEditing,
            ),

            const SizedBox(height: 25),

            
            ElevatedButton.icon(
              icon: Icon(isEditing ? Icons.save : Icons.edit),
              label: Text(isEditing ? "Simpan Perubahan" : "Edit Profil"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                textStyle: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                if (isEditing) {
                  await _saveProfil(); 

                  if (!context.mounted) return;

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Perubahan profil berhasil disimpan!"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
                setState(() => isEditing = !isEditing);
              },
            ),

            const SizedBox(height: 20),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    textStyle: const TextStyle(fontSize: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.exit_to_app, size: 18),
                  label: const Text("Logout"),
                  onPressed: _logout,
                ),

                const SizedBox(width: 12),

                
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    textStyle: const TextStyle(fontSize: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.arrow_back, size: 18),
                  label: const Text("Kembali"),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required bool enabled,
  }) {
    return TextField(
      controller: controller,
      enabled: enabled,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}