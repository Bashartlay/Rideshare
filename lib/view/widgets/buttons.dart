import 'package:flutter/material.dart';

abstract class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class PrimaryButton extends CustomButton {
  final Color color;

  PrimaryButton(
      {required String text,
      required VoidCallback onPressed,
      required this.color})
      : super(text: text, onPressed: onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(340, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class SecondaryButton extends CustomButton {
  SecondaryButton({required String text, required VoidCallback onPressed})
      : super(text: text, onPressed: onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff008955),
        minimumSize: Size(172, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class SecButton extends CustomButton {
  SecButton({required String text, required VoidCallback onPressed})
      : super(text: text, onPressed: onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff008955),
        minimumSize: Size(168, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class SuccessButton extends CustomButton {
  SuccessButton({required String text, required VoidCallback onPressed})
      : super(text: text, onPressed: onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: Size(340, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: Color(0xffB8B8B8),
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

class DangerButton extends CustomButton {
  DangerButton({required String text, required VoidCallback onPressed})
      : super(text: text, onPressed: onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: Size(340, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Color(0xff008955), width: 1),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: Color(0xff008955),
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

class DanButton extends CustomButton {
  final String imageUrl;

  DanButton(
      {required String text,
      required VoidCallback onPressed,
      required this.imageUrl})
      : super(text: text, onPressed: onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: Size(360, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Color(0xffD0D0D0), width: 1.5),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(imageUrl),
            radius: 12,
          ),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: Color(0xff5A5A5A),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class SecondaryBut extends CustomButton {
  SecondaryBut({required String text, required VoidCallback onPressed})
      : super(text: text, onPressed: onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: Size(165, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Color(0xff008955), width: 1),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: Color(0xff008955),
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

class SecondaryButt extends CustomButton {
  SecondaryButt({required String text, required VoidCallback onPressed})
      : super(text: text, onPressed: onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff008955),
        minimumSize: Size(165, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
