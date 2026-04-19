import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../category/presentation/providers/category_provider.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, provider, _) {

        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.categories.isEmpty) {
          return const Text("No Category Found");
        }

        return SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.categories.length,
            itemBuilder: (context, index) {

              final item = provider.categories[index];

              return Container(
                width: 90,
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    item["name"] ?? "",
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}