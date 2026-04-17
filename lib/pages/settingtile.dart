// import 'package:flutter/material.dart';

// class _SettingsTile extends StatelessWidget {
//   final String label;
//   final Widget? trailing;
//   final bool darkMode;

//   const _SettingsTile({
//     required this.label,
//     this.trailing,
//     this.darkMode = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
//       decoration: BoxDecoration(
//         color: darkMode ? const Color(0xFF1E2434) : Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               color: darkMode ? Colors.white : Colors.black,
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           trailing ??
//               const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
//         ],
//       ),
//     );
//   }
// }
