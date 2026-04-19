import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../category/presentation/providers/category_provider.dart';
import '../../../product/presentation/providers/product_provider.dart';
import '../widgets/product_list_widget.dart';
import '../widgets/category_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController searchCtrl = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<ProductProvider>().getProducts(refresh: true);
      context.read<CategoryProvider>().getCategories();
    });

    /// 🔥 pagination trigger
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<ProductProvider>().loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("CraftyBay")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// 🔍 SEARCH
            TextField(
              controller: searchCtrl,
              onChanged: (value) {
                context.read<ProductProvider>()
                    .getProducts(refresh: true, search: value);
              },
              decoration: const InputDecoration(
                hintText: "Search product...",
                prefixIcon: Icon(Icons.search),
              ),
            ),

            const SizedBox(height: 16),

            const CategoryListWidget(),

            const SizedBox(height: 16),

            /// PRODUCT LIST + LOAD MORE
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [

                    const ProductListWidget(),

                    if (provider.isLoadMore)
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}