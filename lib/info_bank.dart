import 'package:flutter/material.dart';


class BilgiBankasiPage extends StatefulWidget {
  @override
  _BilgiBankasiPageState createState() => _BilgiBankasiPageState();
}

class _BilgiBankasiPageState extends State<BilgiBankasiPage> {
  // Simüle edilmiş bilgi bankası verisi
  final List<Map<String, String>> _bilgiBankasi = [
    {
      "baslik": "Flutter Nedir?",
      "icerik":
          "Flutter, Google tarafından geliştirilen açık kaynaklı bir mobil uygulama geliştirme SDK'sıdır. "
              "Bu SDK, Android ve iOS platformlarında aynı kod tabanını kullanarak uygulama geliştirmeyi mümkün kılar."
    },
    {
      "baslik": "State Management Nedir?",
      "icerik":
          "State management, bir uygulamanın durumu ile ilgili verilerin nasıl yönetildiği ve güncellendiğini ifade eder. "
              "Flutter'da BLoC, Provider ve Riverpod gibi popüler state management araçları kullanılabilir."
    },
    {
      "baslik": "Widget Nedir?",
      "icerik":
          "Widget, Flutter'da kullanıcı arayüzü oluşturmak için kullanılan temel yapı taşıdır. "
              "StatelessWidget ve StatefulWidget olmak üzere iki ana türü vardır."
    },
  ];

  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    // Arama sonuçlarına göre filtreleme
    final filteredData = _bilgiBankasi
        .where((item) =>
            item["baslik"]!.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Üst başlık ve arama kutusu
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bilgi Bankası",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Ara...",
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: filteredData.isNotEmpty
                    ? ListView.builder(
                        itemCount: filteredData.length,
                        itemBuilder: (context, index) {
                          final item = filteredData[index];
                          return _buildBilgiCard(context, item["baslik"]!,
                              item["icerik"]!);
                        },
                      )
                    : Center(
                        child: Text(
                          "Sonuç bulunamadı.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Bilgi kartı tasarımı
  Widget _buildBilgiCard(BuildContext context, String baslik, String icerik) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: ListTile(
          title: Text(
            baslik,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            icerik.length > 50 ? "${icerik.substring(0, 50)}..." : icerik,
            style: TextStyle(color: Colors.grey[700]),
          ),
          trailing: Icon(Icons.arrow_forward, color: Colors.grey),
          onTap: () {
            // Detay sayfasına geçiş
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetaySayfasi(baslik: baslik, icerik: icerik),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Detay Sayfası
class DetaySayfasi extends StatelessWidget {
  final String baslik;
  final String icerik;

  const DetaySayfasi({Key? key, required this.baslik, required this.icerik})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(baslik),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purpleAccent, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    baslik,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    icerik,
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
