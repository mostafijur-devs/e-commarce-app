import 'dart:io';

import 'package:e_commarce_app/models/categoty_model.dart';
import 'package:e_commarce_app/providers/product_provider.dart';
import 'package:e_commarce_app/utils/widgets_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';

class NewProductPage extends StatefulWidget {
  static const String routeName = '/product';

  const NewProductPage({super.key});

  @override
  State<NewProductPage> createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  final _discountController = TextEditingController();
  final _fromKey = GlobalKey<FormState>();
  CategoryModel? categoryModel;
  String? localTmagePath;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Product'),
        actions: [IconButton(onPressed: _saveProduct,
            icon: const Icon(Icons.save)
        )
        ],
      ),
      body: Form(
        key: _fromKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Center(
              child: Stack(
                children: [
                  Card(
                    elevation: 10,
                    child: localTmagePath == null ? const Icon(
                      Icons.person, size: 100,
                    ) : Image.file(File(localTmagePath!), height: 100,
                      width: 100,
                      fit: BoxFit.fill,),
                  ),
                  Positioned(
                      right: -10,
                      top: -10,
                      child: IconButton(onPressed: () {
                        setState(() {
                          localTmagePath = null;
                        });
                      },
                          icon: localTmagePath == null ? const Icon(
                            Icons.cancel, size: 15,) : const Icon(
                            Icons.cancel, size: 15, color: Colors.white,))
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                    icon: const Icon(Icons.camera_alt),
                    onPressed: () {
                      _getImage(ImageSource.camera);
                    }, label: const Text('Capture')),
                OutlinedButton.icon(
                    icon: const Icon(Icons.photo),
                    onPressed: () {
                      _getImage(ImageSource.gallery);
                    }, label: const Text('Gallary')),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: 'Product Name',
                    hintText: 'Product Name',
                    prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your product name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: _descriptionController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: 'Discription Name ',
                    hintText: 'Discription Name',
                    prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your discription';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: 'Product price',
                    hintText: 'Product price',
                    prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your product price';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: _discountController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: 'Product Discount value',
                    hintText: 'Product Discount value',
                    prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: _stockController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: 'Product Stock',
                    hintText: 'Product Stock',
                    prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your product stock';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Consumer<ProductProvider>(
                builder: (context, productProvider, child) =>
                    DropdownButtonFormField<CategoryModel>(
                        hint: const Text('Select Category'),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20))
                          ),
                        ),
                        items: productProvider.categoryList
                            .map(
                              (model) =>
                              DropdownMenuItem<CategoryModel>(
                                value: model,
                                child: Text(model.name),
                              ),
                        )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            categoryModel = value;
                          });
                        }),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _getImage(ImageSource source) async {
    final xFile = await ImagePicker().pickImage(
        source: source, imageQuality: 60);
    if (xFile != null) {
      setState(() {
        localTmagePath = xFile.path;
      });
    }
  }

  void _saveProduct() async {
    if (localTmagePath == null) {
      showMassage(context: context, message: 'Image not selected');
      return;
    }
    if (_fromKey.currentState!.validate()) {
      EasyLoading.show(status: 'Please wait....');
      try{
        final url = await context.read<ProductProvider>().uploadImageToStroge(
            localTmagePath!);
        final productModel = ProductModel(
          productName: _nameController.text,
          categoryModel: categoryModel!,
          price: num.parse(_priceController.text),
          stock: num.parse(_stockController.text),
          description: _descriptionController.text,
          imageUrl: url,);
        await context.read<ProductProvider>().addProduct(productModel);
        showMassage(context: context, message: 'Add new product success');
        _reset();
        EasyLoading.dismiss();

        // await Future.delayed(const Duration(seconds: 1)).then((value) => Navigator.pushReplacementNamed(context, NewProductPage.routeName,));
      }catch(error){
        EasyLoading.dismiss();
        showMassage(context: context, message: error.toString());
      }
    }
    }

  void _reset() {
    setState(() {
      _nameController.clear();
      _priceController.clear();
      _stockController.clear();
      _descriptionController.clear();
      _discountController.clear();
      localTmagePath = null;
      categoryModel = null;
    });
  }
  }
