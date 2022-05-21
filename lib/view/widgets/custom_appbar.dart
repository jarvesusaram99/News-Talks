// import 'package:flutter/material.dart';

// class WidgetAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final Color? backgroundColor;
//   final Color? textIconColor;
//   final String? icon;
//   final String? title;
//   final double? height;
//   final List<Widget>? menuItem;
//   final bool hideBack;
//   final bool? iscenter;
//   final double? textSize;

//   WidgetAppBar(
//       {this.backgroundColor,
//       this.textIconColor,
//       this.icon,
//       this.title = '',
//       this.menuItem,
//       this.textSize,
//       this.height: kToolbarHeight,
//       this.hideBack = false,
//       this.iscenter = false});

//   @override
//   Size get preferredSize => Size.fromHeight(height!);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       leading: Container(
//         width: 120,
//         height: 120,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           image: DecorationImage(
//               image: NetworkImage('https://via.placeholder.com/150'),
//               fit: BoxFit.fill),
//         ),
//       ),

//       //  CircleAvatar(
//       //   radius: 200.0,
//       //   // backgroundImage: NetworkImage('https://via.placeholder.com/150'),
//       //   backgroundColor: Colors.transparent,
//       //   child: ClipOval(
//       //     child: Image.network(
//       //       'https://via.placeholder.com/150',
//       //     ),
//       //   ),
//       // ),
//       titleSpacing: 10,

//       toolbarHeight: preferredSize.height,

//       title: Transform(
//         transform: Matrix4.translationValues(10.0, 0.0, 10.0),
//         child: Text(
//           title!,
//           style: TextStyle(
//             fontSize: textSize,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       // backgroundColor: backgroundColor,
//       // centerTitle: iscenter,
//     );
//   }
// }
