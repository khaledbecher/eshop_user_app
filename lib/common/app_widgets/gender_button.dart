import 'package:flutter/material.dart';



class Genderbutton extends StatelessWidget {
 final String? text;
  final bool? enabled;
  final VoidCallback? onTap;
  const Genderbutton({super.key, this.text = '', this.enabled = false,this.onTap});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap:onTap ,
      child: Container(height: 50,alignment: Alignment.center,
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          border: enabled!?Border(
            bottom: BorderSide(
              color: theme.colorScheme.primary,
              width: 3.0,
            ),
          ):null,
          boxShadow: enabled!?kElevationToShadow[3]:kElevationToShadow[1],
        ),
        child:  Text(text!,style: enabled!?theme.textTheme.titleMedium:theme.textTheme.bodySmall,),
      ),
    );
  }
}
