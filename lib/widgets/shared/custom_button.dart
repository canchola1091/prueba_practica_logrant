
import 'package:flutter/material.dart';
import 'package:test_logrant/utils/my_utils.dart';

class CustomButton extends StatelessWidget {
  
  /// Texto del botón
  final String textButton;
  /// Color del texto del botón
  final Color colorTextButton;
  /// Color del botón
  final Color? colorButton;
  /// Color del borde del botón
  final Color? colorBorderButton;
  /// Alto del botón (Este valor es en porcentaje, no en pixeles)
  final double heightButton;
  /// Ancho del botón (Este valor es en porcentaje, no en pixeles)
  final double widthButton;
  /// Radius del borde del botón
  final double radiusButton;
  /// Función al dar click
  final void Function() onClick;
  
  const CustomButton({
    super.key,
    required this.textButton,
    this.colorTextButton = Colors.white,
    required this.colorButton,
    this.colorBorderButton,
    this.heightButton = 5.0,
    this.widthButton = 25.0,
    this.radiusButton = 10.0,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyUtils.porcientoW(widthButton),
      child: MaterialButton(
        onPressed: () {
          onClick();
        },
        height: MyUtils.porcientoH(heightButton),
        elevation: 0.0,
        color: colorButton,
        hoverColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusButton),
          side: BorderSide(
            width: (colorBorderButton == null) ? 1.0 : 2.0,
            color: (colorBorderButton == null) ? Colors.transparent :  colorBorderButton!
          )
        ),
        child: Text(
          textButton,
          style: TextStyle(
            color: colorTextButton
          )
        )
      )
    );
  }
}