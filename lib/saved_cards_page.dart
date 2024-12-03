import 'package:flutter/material.dart';

class SavedCardsScreen extends StatelessWidget {
  const SavedCardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kayıtlı Kartlarım"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Kart ekleme sayfasına yönlendirme
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddCardScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 5, // Burada kaydedilmiş kart sayısı yer almalı
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(Icons.credit_card, color: Colors.blue),
              title: Text("**** 1234"), // Kartın son dört hanesi
              subtitle: Text("VISA"), // Kart tipi (VISA, MasterCard vb.)
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // Kart silme işlemi
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Kartı Sil"),
                      content: const Text("Bu kartı silmek istediğinizden emin misiniz?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("İptal"),
                        ),
                        TextButton(
                          onPressed: () {
                            // Kart silme işlemi burada yapılabilir
                            Navigator.of(context).pop();
                          },
                          child: const Text("Sil"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kart Ekle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Kart Numarası",
                prefixIcon: Icon(Icons.credit_card),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Ad Soyad",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Son Kullanma Tarihi",
                prefixIcon: Icon(Icons.calendar_today),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "CVV",
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true, // Güvenlik için CVV gizlenir
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Kart ekleme işlemi burada yapılabilir
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  "Kartı Ekle",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
