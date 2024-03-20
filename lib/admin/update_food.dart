import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:restaurant_app/constants.dart';
import 'package:restaurant_app/services/data_base.dart';
import 'package:restaurant_app/widgets/customButton.dart';
import 'package:restaurant_app/widgets/customtextformfeild.dart';

class UpdateFood extends StatefulWidget {
  const UpdateFood({super.key});

  @override
  State<UpdateFood> createState() => _UpdateFoodState();
}

class _UpdateFoodState extends State<UpdateFood> {
  List<String> items = [
    'Burger',
    'Pizza',
    'Shawrama',
    'Salad',
    'Ice-Cream',
    'Drinks',
    'Popular Food',
  ];
  String? value;
  String? itemName;
  String? price;
  String? description;
  final ImagePicker picker = ImagePicker();
  File? selectedImage;
  Future getImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {});
  }

  upLoadItem() async {
    if (selectedImage != null &&
        itemName!.isNotEmpty &&
        price!.isNotEmpty &&
        description!.isNotEmpty) {
      String addId = randomAlphaNumeric(10);
      Reference firebaseStorage =
          FirebaseStorage.instance.ref().child('blogImages').child(addId);
      final UploadTask task = firebaseStorage.putFile(selectedImage!);
      var downloadUrl = await (await task).ref.getDownloadURL();
      Map<String, dynamic> addItem = {
        'Image': downloadUrl,
        'Name': itemName,
        'Price': price,
        'Description': description,
      };
      await DataBaseMethods().updateFoodItem(addItem, value!).then((value) {
        showSnackBar(context, 'Food item has been updated successfully');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: Text(
            'Update Item',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: kPrimaryColor),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                ' Upload the item picture',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              selectedImage == null
                  ? GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Center(
                        child: Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 1.5),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                size: 30,
                              ),
                            )),
                      ),
                    )
                  : Center(
                      child: Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                selectedImage!,
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '   Item Name',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              CustomTextFormFiled(
                onChange: (data) {
                  itemName = data;
                },
                hint: 'Enter item name',
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '   Item Price',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              CustomTextFormFiled(
                onChange: (data) {
                  price = data.toString();
                },
                hint: 'Enter item price',
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '   Item Description',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              CustomTextFormFiled(
                onChange: (data) {
                  description = data;
                },
                maxLines: 5,
                hint: 'Enter item description',
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '    Select Category',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color.fromARGB(255, 241, 240, 240)),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black),
                            )))
                        .toList(),
                    onChanged: (value) => setState(() {
                      this.value = value;
                    }),
                    dropdownColor: Colors.white,
                    hint: const Text('Select Category'),
                    iconSize: 36,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    value: value,
                  )),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  onTap: () {
                    upLoadItem();
                    setState(() {});
                  },
                  text: 'Update'),
            ],
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: kPrimaryColor,
        content: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
