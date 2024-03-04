import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/add_date.dart';
import '../../../../widgets/cache_image.dart';
import '../../../../widgets/customFlatButton.dart';
import '../../../theme/theme.dart';
import '../../profile/local_widgets/circular_image.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  final box = Hive.box<Add_data>('dataDev');
  DateTime date = new DateTime.now();
  String? selctedItem;
  String? selctedItemi;

  FocusNode note_focus = FocusNode();
  FocusNode money_focus = FocusNode();
  FocusNode name_focus = FocusNode();
  final TextEditingController note_text = TextEditingController();
  final TextEditingController money_text = TextEditingController();
  final TextEditingController name_text = TextEditingController();

  File? _image;
  File? _banner;

  final List<String> _item = [
    'food',
    "Transfer",
    "Transportation",
    "Education",
  ];
  final List<String> _itemei = [
    'Income',
    "Expand",
  ];

  bool isExpense = true;

  @override
  void initState() {
    super.initState();
    note_focus.addListener(() {
      setState(() {});
    });
    money_focus.addListener(() {
      setState(() {});
    });
    name_focus.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          background_container(context),
          Positioned(
            top: 120,
            child: main_container(),
          ),
        ],
      ),
    );
  }

  Widget main_container() {
    return Container(
      width: MediaQuery.of(context).size.width * 7 / 8,
      height: MediaQuery.of(context).size.height * 7 / 8 - 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10),
                        time(),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 2),
                    Center(child: name()),
                    SizedBox(height: 15),
                    Center(child: type_of_kind()),
                    SizedBox(height: 15),
                    Center(child: payment()),
                    SizedBox(height: 20),
                    Center(child: money()),
                    SizedBox(height: 20),
                    Center(child: note()),
                    SizedBox(height: 20),
                    Center(child: shoppingImage()),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(child: save()),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget shoppingImage() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        image: DecorationImage(image: customAdvanceNetworkImage('https://pbs.twimg.com/profile_banners/457684585/1510495215/1500x500'), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black45,
        ),
        child: Stack(
          children: [
            _banner != null ? Image.file(_banner!, fit: BoxFit.fill, width: MediaQuery.of(context).size.width) : CacheImage(path: 'https://pbs.twimg.com/profile_banners/457684585/1510495215/1500x500', fit: BoxFit.fill),
            Center(
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black38),
                child: IconButton(
                  onPressed: uploadImage,
                  icon: const Icon(Icons.camera_alt, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void uploadImage() {
    openImagePicker(context, (file) {
      setState(() {
        _image = file;
      });
    });
  }

  openImagePicker(BuildContext context, Function(File) onImageSelected) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 100,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              const Text(
                'Pick an image',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomFlatButton(
                      label: "Use Camera",
                      borderRadius: 5,
                      onPressed: () {
                        getImage(context, ImageSource.camera, onImageSelected);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomFlatButton(
                      label: "Use Gallery",
                      borderRadius: 5,
                      onPressed: () {
                        getImage(context, ImageSource.gallery, onImageSelected);
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  getImage(BuildContext context, ImageSource source, Function(File) onImageSelected) {
    ImagePicker().pickImage(source: source, imageQuality: 50).then((
      XFile? file,
    ) {
      //FIXME
      onImageSelected(File(file!.path));
      Navigator.pop(context);
    });
  }

  Widget save() {
    return GestureDetector(
      onTap: () {
        var add = Add_data(selctedItemi!, money_text.text, date, note_text.text, selctedItem!);
        box.add(add);
        Navigator.of(context).pop();
      },
      child: Container(
        height: 60,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: GreethyColor.kawa_green,
        ),
        // width: 120,
        // height: 50,
        child: Text(
          'Save',
          style: TextStyle(
            fontFamily: 'f',
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );
  }

  Widget time() {
    return Container(
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(2020),
            lastDate: DateTime(2100),
          );
          if (newDate == Null) return;
          setState(() {
            date = newDate!;
          });
        },
        child: Text(
          '${date.day}/${date.month}/${date.year}',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget money() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        keyboardType: TextInputType.number,
        focusNode: money_focus,
        controller: money_text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Số tiền',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(width: 2, color: GreethyColor.kawa_green)),
        ),
      ),
    );
  }

  Widget note() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        maxLines: 3,
        focusNode: note_focus,
        controller: note_text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Ghi chú',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(width: 2, color: GreethyColor.kawa_green)),
        ),
      ),
    );
  }

  Widget name() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        focusNode: name_focus,
        controller: name_text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Tên chi tiêu',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(width: 2, color: GreethyColor.kawa_green)),
        ),
      ),
    );
  }

  Widget payment() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("  Cách thanh toán"),
          SizedBox(
            height: 2,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: Color(0xffC5C5C5),
              ),
            ),
            child: PopupMenuButton<String>(
              initialValue: selctedItem,
              onSelected: ((value) {
                setState(() {
                  selctedItem = value!;
                });
              }),
              itemBuilder: (BuildContext context) {
                return _item.map((e) {
                  return PopupMenuItem<String>(
                    value: e,
                    child: Container(
                      color: GreethyColor.redHoliday,
                      alignment: Alignment.center,
                      child: Container(
                        child: Text(
                          e,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  );
                }).toList();
              },
              child: Row(
                children: [
                  Container(
                    width: 40,
                    child: selctedItem == null ? SizedBox() : Image.asset('assets/images/$selctedItem.png'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      selctedItem ?? "",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
              tooltip: 'Name',
              offset: Offset(0, 50),
            ),
          ),
        ],
      ),
    );
  }

  Widget type_of_kind() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("  Nhóm chi tiêu"),
                SizedBox(
                  height: 2,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                  child: PopupMenuButton<String>(
                    initialValue: selctedItem,
                    onSelected: ((value) {
                      setState(() {
                        selctedItem = value!;
                      });
                    }),
                    itemBuilder: (BuildContext context) {
                      return _item.map((e) {
                        return PopupMenuItem<String>(
                          value: e,
                          child: Container(
                            color: GreethyColor.redHoliday,
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  child: Image.asset('assets/images/${e}.png'),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList();
                    },
                    child: Container(
                      height: 40,
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            child: selctedItem == null ? SizedBox() : Image.asset('assets/images/$selctedItem.png'),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              selctedItem ?? " ",
                              style: TextStyle(fontSize: 18),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                    offset: Offset(0, 50),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("  Loại chi tiêu"),
                SizedBox(
                  height: 2,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                  child: PopupMenuButton<String>(
                    initialValue: selctedItem,
                    onSelected: ((value) {
                      setState(() {
                        selctedItem = value!;
                      });
                    }),
                    itemBuilder: (BuildContext context) {
                      return _item.map((type_of_kind) {
                        return PopupMenuItem<String>(
                          value: type_of_kind,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              type_of_kind,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        );
                      }).toList();
                    },
                    child: Container(
                      height: 40,
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                selctedItem ?? "",
                                style: TextStyle(fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                    offset: Offset(0, 50),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column background_container(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
            color: GreethyColor.kawa_green,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 25),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: toggleExpenseType,
                        child: Text(
                          isExpense ? 'Chi tiêu' : 'Thu nhập',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      isExpense
                          ? Icon(
                              Icons.attach_file_outlined,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.money,
                              color: Colors.white,
                            ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  void toggleExpenseType() {
    setState(() {
      isExpense = !isExpense;
    });
  }
}
