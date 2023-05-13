import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.backIcon = false,
    this.onTapBack,
    this.text = '',
    this.textColor = Colors.black,
  });

  final bool backIcon;
  final Function()? onTapBack;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: backIcon,
              child: GestureDetector(
                onTap: () {
                  onTapBack;
                },
                child: Container(
                  color: Colors.transparent,
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 20,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Visibility(
              visible: text != '' ? true : false,
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
