import 'package:fixy/app/data/services/icon_broken.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey.shade300),
      child: Row(
        children: [
          const Expanded(
              flex: 2,
              child: Icon(
                IconBroken.Shield_Done,
                color: greenColor,
                size: 50,
              )),
          Container(
            width: 2,
            height: MediaQuery.of(context).size.height / 10,
            color: blueColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  title: 'Accounting Task',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'lato-bold',
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomText(
                  title:
                      'need to calculate the expenes , and need a programming man to do stuff in my app ',
                  textOverflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
          ),
          const Expanded(flex: 1, child: Icon(IconBroken.Arrow___Right_2)),
        ],
      ),
    );
  }
}
