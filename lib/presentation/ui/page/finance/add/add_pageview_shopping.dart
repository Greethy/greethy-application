import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../state/finance_state/shopping_monthly_state.dart';
import '../../../../widgets/customFlatButton.dart';
import '../../../theme/theme.dart';
import '../../common/error_indicator.dart';
import '../../common/log_debug.dart';

class AddShoppingScreen extends StatefulWidget {
  const AddShoppingScreen({super.key});

  @override
  State<AddShoppingScreen> createState() => _AddShoppingScreenState();
}

class _AddShoppingScreenState extends State<AddShoppingScreen> {
   final String TAG = "AddShoppingScreen";

  DateTime date = new DateTime.now();
  String? selctedItem;
  String? selctedItemi;

  FocusNode note_focus = FocusNode();
  FocusNode money_focus = FocusNode();
  FocusNode name_focus = FocusNode();
  final TextEditingController note_text = TextEditingController();
  final TextEditingController money_text = TextEditingController();
  final TextEditingController name_text = TextEditingController();

  bool isViewImage = false;
  File? _billImage;
  File? _itemImage;

  List<List<String>> kind_cost = [];

  final List<String> _item = [
    'food',
    "Transfer",
    "Transportation",
    "Education",
  ];

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

  @override
  Widget build(BuildContext context) {
    var shoppingMonthlyState = Provider.of<ShoppingMonthlyState>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Builder(builder: (BuildContext context) {
          return shoppingMonthlyState.dsShoppingMonthlyModel.onState(
            fetched: (value) => _buildView(shoppingMonthlyState),
            failed: (e) => ErrorIndicator(e),
            loading: () => const CircularProgressIndicator(),
          );
        }),
      ),
    );
  }

  Widget _buildView(ShoppingMonthlyState shoppingMonthlyState) {
    kind_cost = shoppingMonthlyState.mapKindCost;
    Greethy_LogDebug(TAG, "buildView " + kind_cost.toString());
    return Column(
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
    );
  }

  Widget shoppingImage() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isViewImage = !isViewImage;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    // color: Colors.black.withOpacity(0.5),
                    child: Row(
                      children: [
                        Text(
                          'Ảnh',
                        ),
                        isViewImage ? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_right)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          isViewImage
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("  Vật phẩm"),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black45,
                      ),
                      child: Stack(
                        children: [
                          _itemImage != null
                              ? Image.file(
                            _itemImage!,
                            fit: BoxFit.fill,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                          )
                              : Container(
                            color: Colors.amber,
                          ),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black38),
                              child: IconButton(
                                onPressed: uploadItemImage,
                                icon: const Icon(Icons.camera_alt, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("  Hóa đơn"),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black45,
                      ),
                      child: Stack(
                        children: [
                          _billImage != null
                              ? Image.file(_billImage!, fit: BoxFit.fill, width: MediaQuery
                              .of(context)
                              .size
                              .width)
                              : Container(
                            color: Colors.grey,
                          ),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black38),
                              child: IconButton(
                                onPressed: uploadBillImage,
                                icon: const Icon(Icons.camera_alt, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
              : SizedBox(),
        ],
      ),
    );
  }

  void uploadBillImage() {
    openImagePicker(context, (file) {
      setState(() {
        _billImage = file;
      });
    });
  }

  void uploadItemImage() {
    openImagePicker(context, (file) {
      setState(() {
        _itemImage = file;
      });
    });
  }

  openImagePicker(BuildContext context, Function(File) onImageSelected) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 120,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              const Text(
                'Tải lên một bức ảnh',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: CustomFlatButton(
                        label: "Máy ảnh",
                        borderRadius: 15,
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
                        label: "Thư viện",
                        borderRadius: 15,
                        onPressed: () {
                          getImage(context, ImageSource.gallery, onImageSelected);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  getImage(BuildContext context, ImageSource source, Function(File) onImageSelected) {
    ImagePicker().pickImage(source: source, imageQuality: 50).then((XFile? file,) {
      //FIXME
      onImageSelected(File(file!.path));
      Navigator.pop(context);
    });
  }

  Widget save() {
    return GestureDetector(
      onTap: () {
        // todo: add info to server
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
}
