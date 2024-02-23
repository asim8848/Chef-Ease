import 'package:flutter/material.dart';

class CashContainer extends StatefulWidget {
  final IconData icon;
  final String text;

  const CashContainer({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  _CashContainerState createState() => _CashContainerState();
}

class _CashContainerState extends State<CashContainer> {
  Color myColor = Color.fromRGBO(0xDC, 0xDC, 0xDC, 0.3); // Color(0xffDCDCDC) with 50% opacity

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
          height: 65,
          width: 380,
          decoration: BoxDecoration(
            color: myColor,
            border: Border.all(
              color: isSelected ? Colors.deepOrangeAccent : Colors.transparent.withOpacity(0.1),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(
                  widget.icon,
                  size: 35,
                ),
              ),
              SizedBox(width: 20),
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: RoundCheckBox(
                  onTap: () {

                    setState(() {
                      isSelected = !isSelected;
                    });

                  },

                  isChecked: isSelected,

                  checkedColor: Colors.deepOrangeAccent,


                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundCheckBox extends StatelessWidget {
  final bool isChecked;
  final VoidCallback onTap;
  final Color checkedColor;

  const RoundCheckBox({
    Key? key,
    required this.isChecked,
    required this.onTap,
    required this.checkedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black),
          color: isChecked ? checkedColor : Colors.transparent,
        ),
        child: isChecked
            ? Icon(
          Icons.check,
          size: 20,
          color: Colors.white,
        )
            : null,
      ),
    );
  }
}
