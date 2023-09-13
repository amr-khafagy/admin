import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropdownlist extends StatefulWidget {
  final String? title;
  final List<SelectedListItem> listdata;
  final TextEditingController dropdownSelectedname;
  final TextEditingController dropdownSelectedid;

  const CustomDropdownlist(
      {Key? key,
      this.title,
      required this.listdata,
      required this.dropdownSelectedname,
      required this.dropdownSelectedid})
      : super(key: key);

  @override
  State<CustomDropdownlist> createState() => _CustomDropdownlistState();
}

class _CustomDropdownlistState extends State<CustomDropdownlist> {
  void showDropdownSearch() {
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle: Text(
          widget.title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listdata,
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          widget.dropdownSelectedname.text = selectedListItem.name;
          print("===============${widget.dropdownSelectedname.text}");
          widget.dropdownSelectedid.text = selectedListItem.value!;
          print("===============${widget.dropdownSelectedid.text}");
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dropdownSelectedname,
      cursorColor: Colors.black,
      onTap: () {
        FocusScope.of(context).unfocus();
        showDropdownSearch();
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black12,
        contentPadding:
            const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
        hintText: widget.dropdownSelectedname.text == ""
            ? widget.title
            : widget.dropdownSelectedname.text,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
