// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class CategoryAttributesPage extends StatefulWidget {
//   final int categoryId;

//   const CategoryAttributesPage({required this.categoryId});

//   @override
//   _CategoryAttributesPageState createState() => _CategoryAttributesPageState();
// }

// class _CategoryAttributesPageState extends State<CategoryAttributesPage> {
//   Map<String, dynamic> categoryAttributes = {};

//   @override
//   void initState() {
//     super.initState();
//     fetchCategoryAttributes(widget.categoryId);
//   }

//   Future<void> fetchCategoryAttributes(int categoryId) async {
//     final response = await http.get(
//       Uri.parse(
//           'https://api.mazaddimashq.com/api/category/category-info?category_id=$categoryId'),
//     );

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       setState(() {
//         categoryAttributes = data['data'];
//       });
//     } else {
//       throw Exception('Failed to load category attributes');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Category Attributes'),
//       ),
//       body: categoryAttributes.isEmpty
//           ? const Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ListView.builder(
//                 itemCount: categoryAttributes['attributes']?.length ?? 0,
//                 itemBuilder: (context, index) {
//                   var attribute = categoryAttributes['attributes'][index];
//                   var attributeName = attribute['attribute_name'];
//                   var attributeOptions = attribute['attribute_type_list'] ?? [];

//                   return Card(
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             attributeName,
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                           const SizedBox(height: 10),
//                           Wrap(
//                             spacing: 8,
//                             children: attributeOptions.map<Widget>((option) {
//                               return Chip(
//                                 label: Text(option['option']),
//                               );
//                             }).toList(),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//     );
//   }
// }
