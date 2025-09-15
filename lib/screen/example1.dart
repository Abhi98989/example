import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  void initState() {
    super.initState();
    String apiKey = "e8d9fa85-1b77-4b98-92f0-2c097af03ed7";
    final provider = Provider.of<ServiceProvider>(context, listen: false);
    provider.getServiceTypes(apiKey);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ServiceProvider>(context);
    String apiKey = "e8d9fa85-1b77-4b98-92f0-2c097af03ed7";
    return Scaffold(
      appBar: AppBar(title: const Text("Assigned Service Types")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              provider.getServiceTypes(apiKey);
            },
            child: const Text("Fetch Data"),
          ),
          Expanded(
            child: provider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : provider.error != null
                ? Center(child: Text("Error: ${provider.error}"))
                : provider.example1 == null
                ? const Center(child: Text("No data yet"))
                : ListView.builder(
                    itemCount: provider.example1!.serviceTypes.length,
                    itemBuilder: (context, index) {
                      final item = provider.example1!.serviceTypes[index];
                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: ListTile(
                          title: Text(item.customName),
                          subtitle: Text(
                            "${item.name}\nAssigned: ${item.assignedDate.toLocal()}",
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
