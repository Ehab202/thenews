import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/app_provider.dart';

class SettingsTap extends StatefulWidget {
  const SettingsTap({super.key});

  @override
  State<SettingsTap> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<SettingsTap> {
  bool isArEnable = false;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider=Provider.of(context);
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 10,),
            const Text("language(ar) (العربيه)",style: TextStyle(color:Colors.green,fontSize: 18,fontWeight: FontWeight.w500)),
            const Spacer(),
            Switch(
              activeColor: Colors.green,
              value: appProvider.isArEnable,
              onChanged: (value) {
                appProvider.changeCurrantLocala(value);

              },
            ),
            const SizedBox(width: 8,)
          ],
        ),

      ],
    );
  }
}