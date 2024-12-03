import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Paket Seçimi")),
      body: Center(
        child: SizedBox(
          height: 400,
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadowColor: Colors.black.withOpacity(0.3),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Silver Paket",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[800],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Aylık: \$50",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        "Yıllık: \$500",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  _buildPackageFeature("vCore CPU", "2 CPU", Icons.memory),
                  _buildPackageFeature("RAM", "4 GB RAM", Icons.memory),
                  _buildPackageFeature("Depolama", "100 GB SSD", Icons.storage),
                  _buildPackageFeature("Bant Genişliği", "1 TB", Icons.network_cell),
                  Spacer(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Seçim işlemi burada yapılabilir
                      },
                      child: Text("Seç", style: TextStyle(fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Buton rengi
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadowColor: Colors.black.withOpacity(0.3),
                        elevation: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPackageFeature(String featureName, String featureValue, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 22),
          SizedBox(width: 12),
          Text(
            "$featureName: $featureValue",
            style: TextStyle(fontSize: 16, color: Colors.blueGrey[700]),
          ),
        ],
      ),
    );
  }
}
