import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Profil Sayfası
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Image with Edit Icon
            Stack(
              children: [
                SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(64),
                      child: Image.network("https://www.technopat.net/sosyal/blog/yeni-ueyeler-icin-avatar.3277/cover-image"))),
                
              ],
            ),
            const SizedBox(height: 10),
            const Text("John Doe",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text("johndoe@example.com",
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),

            // Edit Profile Button
            SizedBox(
              width: 200,
              child: ElevatedButton(
                
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdateProfileScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                
                  shape: const StadiumBorder(),
                ),
                child: const Text("Profili Düzenle",
                )
              ),
            ),
            const SizedBox(height: 30),
            shadowDivider(),
            const SizedBox(height: 10),

            // Menu Widgets
            ProfileMenuWidget(
              title: "Paketlerim",
              icon: FontAwesomeIcons.cubes, // Paketler için en uygun ikon
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Faturalarım",
              icon: Icons.receipt_long, // Faturalar için fatura fişi ikonu
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Kayıtlı Kartlarım",
              icon: Icons.credit_card, // Kayıtlı kartlar için kart ikonu
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Güvenlik ve Gizlilik",
              icon: Icons.lock, // Güvenlik için kilit ikonu
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Uygulama Ayarları",
              icon: Icons.settings, // Ayarlar için standart ayar ikonu
              onPress: () {},
            ),
             shadowDivider(),
            const SizedBox(height: 10),
            ProfileMenuWidget(
                title: "Destek Talepleri", icon: Icons.info, onPress: () {}),
            ProfileMenuWidget(
              title: "Çıkış Yap",
              icon: Icons.logout,
              textColor: Colors.red,
              endIcon: false,
              onPress: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Çıkış Yap"),
                    content:
                        const Text("Çıkış yapmak istediğinize emin misiniz ?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("İptal"),
                      ),
                      TextButton(
                        onPressed: () {
                          // logout function here
                        },
                        child: const Text("Çıkış"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class shadowDivider extends StatelessWidget {
  const shadowDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
       
    return Container(
      height: 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: Colors.grey,
       
      ),
    );
  }
}

// Profil Menüsü Widget'ı
class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          icon,
          
        ),
      ),
      title: Text(
        title,
      ),
      trailing: endIcon
          ? Icon(
              Icons.arrow_forward_ios,
              size: 18.0,
             
            )
          : null,
    );
  }
}

// Profil Güncelleme Sayfası
class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Profili Düzenle", style: TextStyle(fontSize: 20)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Image with Camera Icon
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: SizedBox(
                        width: 120,
                        height: 120,
                        child: SvgPicture.asset("assets/avatar.svg")),
                  ),
                  
                ],
              ),
              const SizedBox(height: 50),

              // Form Fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "İsim Soyisim",
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Telefon",
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Save Changes Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text("Değişiklikleri Kaydet",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Joined Date and Delete Account Button
                 const   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text.rich(
                          TextSpan(
                            text: "Üye olma tarihi: ",
                            style: TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                text: "Ocak 1, 2022",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}