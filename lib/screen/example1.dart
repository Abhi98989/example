import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ServiceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Assigned Service Types")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              provider.getServiceTypes();
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
                              final item =
                                  provider.example1!.serviceTypes[index];
                              return Card(
                                margin: const EdgeInsets.all(8),
                                child: ListTile(
                                  title: Text(item.customName),
                                  subtitle: Text(
                                      "${item.name}\nAssigned: ${item.assignedDate.toLocal()}"),
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
