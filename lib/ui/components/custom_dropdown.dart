import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String hintText;
  final List<String> itensList;
  final onChangeItem;

  final String? selectedValue;

  const CustomDropdown(
      this.hintText,
      this.itensList,
      this.onChangeItem,
      this.selectedValue,
      {super.key}
      );

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {

  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.hintText, style: const TextStyle(fontFamily: 'Inter', fontSize: 18,),),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
              isExpanded: true,
              hint: Text(
                  'Select ${widget.hintText}',
                  style: TextStyle(
                      fontFamily: 'Inter', fontSize: 18,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.normal)
              ),
              items: widget.itensList
                  .map((item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontFamily: 'Inter', fontSize: 18,
                  ),
                ),
              ),
              )
                  .toList(),
              value: widget.selectedValue,
              onChanged: widget.onChangeItem,
              buttonStyleData: ButtonStyleData(
                padding: const EdgeInsets.only(right: 16, left: 12),
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                maxHeight: 200,
              ),
            ),
          ),
        ],
      ),
    );

  }
}