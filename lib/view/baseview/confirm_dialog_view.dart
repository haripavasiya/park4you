import 'package:flutter/material.dart';

import '../../utill/color_resources.dart';
import '../../utill/styles.dart';

class ConfirmDialogView extends StatelessWidget {
  const ConfirmDialogView(
      {Key? key,
        required this.description,
        required this.leftButtonText,
        required this.rightButtonText,
        required this.onAgreeTap})
      : super(key: key);

  final String description, leftButtonText, rightButtonText;
  final Function onAgreeTap;

  @override
  Widget build(BuildContext context) {
    const Widget largeSpacingWidget = SizedBox(height: 20.0,);
    final Widget messageWidget = Text(description, style: montserratRegular.copyWith(color: ColorResources.BLACK));
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 60,
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration:const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                color: ColorResources.COLOR_PRIMERY),
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.help_outline,
                  color: ColorResources.WHITE,
                ),
                Padding(padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    "Confirm",
                    textAlign: TextAlign.center,
                    style: montserratMedium.copyWith(color: ColorResources.WHITE),
                  ),)
              ],
            ),
          ),
          largeSpacingWidget,
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: messageWidget,
          ),
          largeSpacingWidget,
          const Divider(
            color:  ColorResources.BLACK,
            height: 0.4,
          ),
          Row(children: <Widget>[
            Expanded(
                child: MaterialButton(height: 50, minWidth: double.infinity,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(leftButtonText,
                      style: Theme.of(context).textTheme.button),
                )),
            Container(
                height: 50,
                width: 0.4,
                color: ColorResources.BLACK),
            Expanded(
                child: MaterialButton(height: 50, minWidth: double.infinity,
                  onPressed: () {
                    onAgreeTap();
                  },
                  child: Text(rightButtonText, style: Theme.of(context).textTheme.button!.copyWith(color: Colors.black),),
                )),
          ])
        ],
      ),
    );
  }
}