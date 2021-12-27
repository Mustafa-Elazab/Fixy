import 'package:fixy/app/controllers/home_controller.dart';
import 'package:fixy/app/ui/global_widgets/custom_button.dart';
import 'package:fixy/app/ui/global_widgets/custom_input_field.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/global_widgets/custom_textfield_search.dart';
import 'package:fixy/app/ui/pages/main_page.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatelessWidget {
  AddTaskPage({Key? key}) : super(key: key);

  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String selectedReapet = 'None';
  List<String> categoryList = ['None', 'Daily', 'Weekly', 'Monthly'];
  int selectedColor = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CustomSearchTextField(
              //     title: 'Task Category',
              //     hint: 'select task category',
              //     list: categoryList),
              const CustomInputField(
                title: 'Title',
                hint: 'Enter a title text .',
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: titleStyle,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                        autofocus: false,
                        cursorColor: Get.isDarkMode
                            ? Colors.grey[100]
                            : Colors.grey[700],
                        style: subTitleStyle,
                        maxLines: 5,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "description",
                          hintStyle: subTitleStyle,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).backgroundColor,
                                width: 0.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).backgroundColor,
                                width: 0.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (controller) {
                    return CustomInputField(
                      title: 'DeadLine Date',
                      hint: DateFormat.yMMMMd().format(controller.dateTime),
                      widget: IconButton(
                          onPressed: () {
                            controller.getDataFromUser(context);
                          },
                          icon: const Icon(Icons.date_range_outlined)),
                    );
                  }),
              CustomInputField(
                title: 'Remind',
                hint: '$selectedRemind minutes early',
                widget: DropdownButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    iconSize: 32,
                    elevation: 4,
                    style: subTitleStyle,
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String? newValue) {
                      // setState(() {
                      //   _selectedRemind = int.parse(newValue!);
                      // });
                    },
                    items:
                        remindList.map<DropdownMenuItem<String>>((int value) {
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString()),
                      );
                    }).toList()),
              ),
              CustomInputField(
                title: 'Reapet',
                hint: selectedReapet,
                widget: DropdownButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    iconSize: 32,
                    elevation: 4,
                    style: subTitleStyle,
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String? newValue) {
                      // setState(() {
                      //   _selectedReapet = newValue!;
                      // });
                    },
                    items: categoryList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList()),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: CustomButton(
                  title: 'Create Task',
                  onTap: () {
                    Get.offAll(() => MainPage());
                  },
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 16,
                  sizeBox: 0.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // _validateDate() {
  //   if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
  //   } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
  //     Get.snackbar(
  //       'Requird',
  //       'All Field is Requird !',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: whiteColor,
  //       colorText: Get.isDarkMode ? blackColor : blackColor,
  //       icon: const Icon(Icons.warning_amber_outlined),
  //     );
  //   }
  // }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () {
          Get.offAll(() => MainPage());
        },
      ),
      title: CustomText(
        title: 'Add Task',
        fontSize: 20,
        fontFamily: 'Lato-Bold',
        color: blueColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // void _getTimeFromUser({required bool isStartTime}) async {
  //   var timePicker = await _showTimePicker();
  //   var _formatTime = timePicker.format(context);
  //   if (timePicker == null) {
  //   } else if (isStartTime == true) {
  //     setState(() {
  //       _startTime = _formatTime;
  //     });
  //   } else if (isStartTime == false) {
  //     setState(() {
  //       _endTime = _formatTime;
  //     });
  //   }
  // }

  // _showTimePicker() {
  //   return showTimePicker(
  //     initialEntryMode: TimePickerEntryMode.input,
  //     context: context,
  //     initialTime: TimeOfDay(
  //         hour: int.parse(_startTime.split(":")[0]),
  //         minute: int.parse(_startTime.split(":")[1].split(" ")[0])),
  //   );
  // }

  // void addTaskDb() async {
  //   int value = await _taskController.addTask(
  //       task: Task(
  //     note: _noteController.text,
  //     title: _titleController.text,
  //     date: DateFormat.yMd().format(_dateTime),
  //     startTime: _startTime,
  //     endTime: _endTime,
  //     remind: _selectedRemind,
  //     repeat: _selectedReapet,
  //     color: _selectedColor,
  //     isComplete: 0,
  //   ));
  // }
}
