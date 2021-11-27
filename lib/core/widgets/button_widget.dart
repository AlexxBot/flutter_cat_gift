import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String title;
  final double textSize;
  final GestureTapCallback onPressed;
  final double borderRadius;
  final double vPadding;
  final double hPadding;
  final bool enabled;

  const ButtonWidget(
      {Key? key,
      required this.title,
      this.textSize = 16,
      required this.onPressed,
      this.borderRadius = 10,
      this.vPadding = 5,
      this.hPadding = 5,
      this.enabled = true})
      : super(key: key);

  @override
  State<ButtonWidget> createState() => ButtonWidgetState();
}

class ButtonWidgetState extends State<ButtonWidget> {
  /*  late bool _enabled;
  bool get enabled => _enabled;

  set enabled(bool _value) {
    setState(() {
      _enabled = _value;
    });
  } */

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_enabled = widget.enabled;
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.enabled,
      child: RawMaterialButton(
          splashColor: Theme.of(context).scaffoldBackgroundColor,
          fillColor: widget.enabled
              ? Theme.of(context).primaryColor
              : Theme.of(context).primaryColor.withOpacity(0.1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius)),
          padding: EdgeInsets.symmetric(
            vertical: widget.vPadding,
            horizontal: widget.hPadding,
          ),
          child: Text(widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontSize: widget.textSize,
              )),
          onPressed: () {
            FocusScope.of(context).requestFocus(FocusNode());
            widget.onPressed();
          }),
    );
  }
}
