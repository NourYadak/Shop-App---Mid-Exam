import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    required this.title,
    this.titleAlignment,
    this.actions,
    this.actionsPadding,
    this.leading,
  });
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final EdgeInsetsGeometry? actionsPadding;
  final AlignmentGeometry? titleAlignment;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      // elevation: 2,
      // shadowColor: Colors.red,
      // leadingWidth: 100,
      actionsPadding: actionsPadding,
      actions: actions,
      leading: leading,
      iconTheme: const IconThemeData(
        color: Colors.white, // Change the color of the back button icon
      ),


      title: 
      Align(
        alignment: titleAlignment ?? Alignment.topCenter,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          fontStyle: FontStyle.normal,
          // backgroundColor: Colors.amber
        ),
      ),
      
      )
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
