import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';

class CoveredAreaScreen extends StatefulWidget {
  const CoveredAreaScreen({super.key});
  @override
  State<CoveredAreaScreen> createState() => _CoveredAreaScreenState();
}
class _CoveredAreaScreenState extends State<CoveredAreaScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ServiceProvider>(context, listen: false);
    provider.getCoveredAreas();
  }
  @override
  Widget build(BuildContext context) {
    final coverarea = Provider.of<ServiceProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Covered Areas - Baglung")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              coverarea.getCoveredAreas();
            },
            child: const Text("Fetch Covered Areas"),
          ),
          Expanded(
            child: coverarea.isLoading
                ? const Center(child: CircularProgressIndicator())
                : coverarea.error != null
                    ? Center(child: Text("Data not found"))
                    : coverarea.example2 == null
                        ? const Center(child: Text("No data yet"))
                        : ListView.builder(
                            itemCount: coverarea.example2!.coveredAreas.length,
                            itemBuilder: (context, index) {
                              final item =
                                  coverarea.example2!.coveredAreas[index];
                              return Card(
                                margin: const EdgeInsets.all(8),
                                child: ListTile(
                                  title: Text(item.area),
                                  subtitle: Text(
                                    "Zip: ${item.zipcode}\n"
                                    "City: ${item.city}\n"
                                    "District: ${item.district}\n"
                                    "LatLong: ${item.latLong}\n"
                                    "Remote: ${item.isRemote}",
                                  ),
                                ),
                              );
                            },
                          ),
          ),
        ],
      ),
    );
  }
}
