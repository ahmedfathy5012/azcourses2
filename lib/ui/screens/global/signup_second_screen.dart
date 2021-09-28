// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// // import 'package:keyboard_visibility/keyboard_visibility.dart';
// import 'package:azcourses/bloc/controller/auth_controller.dart';
// import 'package:azcourses/bloc/controller/stage_controller.dart';
// import 'package:azcourses/bloc/controller/year_controller.dart';
// import 'package:azcourses/bloc/model/auth_user.dart';
// import 'package:azcourses/helpers/screen_helper.dart';
// import 'package:azcourses/ui/screens/global/google_map_screen.dart';
// import 'package:azcourses/ui/screens/global/login_screen.dart';
// import 'package:azcourses/ui/screens/student/home_screen.dart';
// import 'package:azcourses/ui/screens/student/tabs_screen.dart';
// import 'package:azcourses/ui/widgets/cutom_drop_down_form_field.dart';
// import 'package:azcourses/ui/widgets/global/back_bar.dart';
// import 'package:azcourses/ui/widgets/global/back_ground.dart';
// import 'package:azcourses/ui/widgets/global/custom_drop_down_field.dart';
// import 'package:azcourses/ui/widgets/global/custom_text_field.dart';
// import 'package:azcourses/ui/widgets/global/error_dialog.dart';
// import 'package:azcourses/ui/widgets/global/grade_dialog.dart';
// import 'package:azcourses/ui/widgets/global/loading_dialog.dart';
// import 'package:azcourses/ui/widgets/global/square_image_container.dart';
// import 'package:azcourses/ui/widgets/global/states_dialog.dart';
// import 'package:azcourses/ui/widgets/global/used_button.dart';
//
// import '../../../utils/constants.dart';
// import 'add_center_register.dart';
// import 'menu_screen.dart';
//
// class SignUpSecondScreen extends StatefulWidget {
//   @override
//   _SignUpSecondScreenState createState() => _SignUpSecondScreenState();
// }
//
// class UserType {
//   int id;
//   String title;
//
//   UserType({this.id, this.title});
// }
//
// List<UserType> types = [
//   UserType(
//     id: 1,
//     title: "اساسي",
//   ),
//   UserType(
//     id: 0,
//     title: "جامعي",
//   ),
// ];
//
// class _SignUpSecondScreenState extends State<SignUpSecondScreen> {
//   AuthController authController = Get.put(AuthController());
//
//   bool isSecure = true;
//   final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
//
//   // KeyboardVisibilityNotification _keyboardVisibility =
//   //     new KeyboardVisibilityNotification();
//   // int _keyboardVisibilitySubscriberId;
//   bool _keyboardState = false;
//
//   TextEditingController controller1;
//   TextEditingController controller1Index;
//   TextEditingController controller2;
//   TextEditingController controller2Index;
//   TextEditingController controller3;
//   TextEditingController controller3Index;
//   TextEditingController controller4;
//   TextEditingController controller4Index;
//   TextEditingController controller5;
//   TextEditingController controller5Index;
//   TextEditingController controller6;
//   TextEditingController controller6Index;
//   TextEditingController controller7;
//   TextEditingController controller7Index;
//   TextEditingController controller8;
//   TextEditingController controller8Index;
//
//   var _selectItem;
//
//   YearController yearController = Get.put(YearController());
//   StageController stageController = Get.put(StageController());
//
//   Future<void> fetchYears() async {
//     try {
//       await yearController.fetchYears();
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   bool passSecure = true;
//   bool confirmPassSecure = true;
//
//   String controller2Selected;
//   String controller5Selected;
//   String controller6Selected;
//   String controller7Selected;
//   String controller8Selected;
//   String controller9Selected;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     fetchYears();
//     controller1 = TextEditingController();
//     controller1Index = TextEditingController();
//     controller2 = TextEditingController();
//     controller2Index = TextEditingController();
//     controller3 = TextEditingController();
//     controller3Index = TextEditingController();
//     controller4 = TextEditingController();
//     controller4Index = TextEditingController();
//     controller5 = TextEditingController();
//     controller5Index = TextEditingController();
//     controller6 = TextEditingController();
//     controller6Index = TextEditingController();
//     controller7 = TextEditingController();
//     controller7Index = TextEditingController();
//     controller8 = TextEditingController();
//     controller8Index = TextEditingController();
//     // _keyboardVisibilitySubscriberId = _keyboardVisibility.addNewListener(
//     //   onChange: (bool visible) {
//     //     setState(() {
//     //       _keyboardState = visible;
//     //       print(_keyboardState);
//     //     });
//     //   },
//     // );
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     controller1.dispose();
//     controller1Index.dispose();
//     controller2.dispose();
//     controller2Index.dispose();
//     controller3.dispose();
//     controller3Index.dispose();
//     controller4.dispose();
//     controller4Index.dispose();
//     controller5.dispose();
//     controller5Index.dispose();
//     controller6.dispose();
//     controller6Index.dispose();
//     controller7.dispose();
//     controller7Index.dispose();
//     controller8.dispose();
//     controller8Index.dispose();
//     // _keyboardVisibility.removeListener(_keyboardVisibilitySubscriberId);
//     super.dispose();
//   }
//
//   int typeId = 1;
//   int current = 0;
//
//
//   @override
//   Widget build(BuildContext context) {
//     var node = FocusScope.of(context);
//     //
//     return SafeArea(
//       top: false,
//       child: Scaffold(
//         body: GetBuilder<StageController>(
//           builder: (_) =>  Stack(
//             children: [
//               BackGround(),
//               _.isLoading?
//              Center(child: LoadingDialog()):
//               SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: ScreenHelper.screenWidth(context, 30)),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: ScreenHelper.screenHeight(context, 40),
//                       ),
//                       Text(
//                         "إنشاء حساب",
//                         style: Theme.of(context).textTheme.headline1.copyWith(
//                             fontSize: ScreenHelper.screenFont(context, 17),
//                             color: Colors.white),
//                       ),
//                       SizedBox(
//                         height: ScreenHelper.screenHeight(context, 40),
//                       ),
//                       Form(
//                         key: _globalKey,
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Radio(
//                                       hoverColor: Colors.red,
//                                       focusColor: Colors.green,
//                                       groupValue: typeId,
//                                       value: types[0].id,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           typeId = types[0].id;
//                                         });
//                                       },
//                                       activeColor: Colors.white,
//                                     ),
//                                     SizedBox(
//                                       width: ScreenHelper.screenWidth(context, 0),
//                                     ),
//
//                                     Text(
//                                       types[0].title,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .headline2
//                                           .copyWith(
//                                             color: Colors.white,
//                                             fontSize: ScreenHelper.screenFont(
//                                                 context, 20),
//                                           ),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Radio(
//                                       focusColor: Colors.white,
//                                       groupValue: typeId,
//                                       value: types[1].id,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           typeId = types[1].id;
//                                         });
//                                       },
//                                       activeColor: Colors.white,
//                                     ),
//                                     Text(
//                                       types[1].title,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .headline2
//                                           .copyWith(
//                                             color: Colors.white,
//                                             fontSize: ScreenHelper.screenFont(
//                                                 context, 20),
//                                           ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             typeId == 1
//                                 ?
//                             Column(
//                                     children: [
//                                       CustomDropDownField(
//                                         onComplete: () {
//                                           node.nextFocus();
//                                         },
//                                         label: "المرحلة الدراسية",
//                                         controller: controller1,
//                                         data:
//                                         stageController.primaryStage??[],
//                                         onChanged: (id,index){
//                                           setState(() {
//                                             // controller2.clear();
//                                             controller1.text = id.toString();
//                                             controller1Index.text = index.toString();
//                                             if(stageController.primaryStage[int.parse(controller1Index.text)].lists.isEmpty){
//                                               controller2Selected=null;
//                                             }else{
//                                               controller2Selected=stageController.primaryStage[int.parse(controller1Index.text)].lists[0].id.toString();
//                                               controller2.text = stageController.primaryStage[int.parse(controller1Index.text)].lists[0].id.toString();
//                                               controller2Index.text = 0.toString();
//                                             }
//                                             print("selected college id >> $id");
//                                             print("selected college index >> $index");
//                                           });
//                                         },
//                                       ),
//                                       SizedBox(
//                                         height: ScreenHelper.screenHeight(
//                                             context, 30),
//                                       ),
//                                       CustomDropDownField(
//                                         onComplete: () {
//                                           node.nextFocus();
//                                         },
//                                         label: "الصف الدراسي",
//                                         // controller: controller2,
//                                         controller: controller2Index,
//                                         selected: controller2Selected,
//                                         data:
//                                         controller1Index.text.isEmpty ?
//                                             []:
//                                         stageController.primaryStage[int.parse(controller1Index.text)].lists??[],
//                                         onChanged: (id,index){
//                                           setState(() {
//                                             // controller6.clear();
//                                             controller2.text = id.toString();
//                                             controller2Index.text = index.toString();
//                                             print("selected college id >> $id");
//                                             print("selected college index >> $index");
//                                           });
//                                         },
// //                                      errorMessage: "يجب ادخال اسم المستخدم",
//                                       ),
//                                       SizedBox(
//                                         height: ScreenHelper.screenHeight(
//                                             context, 30),
//                                       ),
// //                                       CustomTextField(
// //                                         onComplete: () {
// //                                           node.unfocus();
// //                                         },
// //                                         label: "الشعبة",
// //                                         controller: controller3,
// // //                                      errorMessage: "يجب ادخال اسم المستخدم",
// //                                       ),
//                                       SizedBox(
//                                         height: ScreenHelper.screenHeight(
//                                             context, 30),
//                                       ),
//                                     ],
//                                   )
//                                 : Column(
//                                     children: [
//                                       CustomDropDownField(
//                                         onComplete: () {
//                                           node.nextFocus();
//                                         },
//                                         label: "الجامعة",
//                                         controller: controller4,
//                                         data: stageController.collectorStage,
//                                         onChanged: (id,index){
//                                           setState(() {
//                                             controller5.clear();
//                                             controller4.text = id.toString();
//                                             controller4Index.text = index.toString();
//
//                                             controller5Index.text = "0";
//                                             controller5.text =  stageController.collectorStage[int.parse(controller4Index.text)].collegeLists[int.parse(controller5Index.text)].id.toString();
//
//
//                                             controller6Index.text = "0";
//                                             controller6.text =
//                                                 stageController
//                                                 .collectorStage[int.parse(controller4Index.text)]
//                                                 .collegeLists[int.parse(controller5Index.text)]
//                                                 .sectionsList[int.parse(controller6Index.text)]
//                                                 .id.toString();
//
//
//                                             controller7Index.text = "0";
//                                             controller7.text =  stageController
//                                                 .collectorStage[int.parse(controller4Index.text)]
//                                                 .collegeLists[int.parse(controller5Index.text)]
//                                                 .sectionsList[int.parse(controller6Index.text)]
//                                                 .yearList[int.parse(controller7Index.text)]
//                                                 .id.toString();
//
//
//                                             // controller5Selected= controller5.text;
//                                             // controller6Selected= controller6.text;
//                                             // controller7Selected= controller7.text;
//
//                                             controller5Selected= null;
//                                             controller6Selected= null;
//                                             controller7Selected= null;
//
//
//                                             print("selected college id >> $id");
//                                             print("selected college index >> $index");
//                                           });
//                                         },
// //                                      errorMessage: "يجب ادخال اسم المستخدم",
//                                       ),
//                                       SizedBox(
//                                         height: ScreenHelper.screenHeight(
//                                             context, 30),
//                                       ),
//                                       CustomDropDownField(
//                                         onComplete: () {
//                                           node.nextFocus();
//                                         },
//                                         label: "الكلية",
//                                         controller: controller5,
//                                         selected: controller5Selected,
//                                         data:
//                                         controller4Index.text.isNotEmpty ?
//                                         stageController.collectorStage[int.parse(controller4Index.text)].collegeLists??[]:
//                                         [],
//                                         onChanged: (id,index){
//                                           setState(() {
//                                             controller6.clear();
//                                             controller5.text = id.toString();
//                                             controller5Index.text = index.toString();
//                                             print("selected college id >> $id");
//                                             print("selected college index >> $index");
//
//
//                                             controller6Index.text = "0";
//                                             controller6.text = stageController
//                                                 .collectorStage[int.parse(controller4Index.text)]
//                                                 .collegeLists[int.parse(controller5Index.text)]
//                                                 .sectionsList[int.parse(controller6Index.text)]
//                                                 .id.toString();
//
//                                             controller7Index.text = "0";
//                                             controller7.text =  stageController
//                                                 .collectorStage[int.parse(controller4Index.text)]
//                                                 .collegeLists[int.parse(controller5Index.text)]
//                                                 .sectionsList[int.parse(controller6Index.text)]
//                                                 .yearList[int.parse(controller7Index.text)]
//                                                 .id.toString();
//
//
//                                             // controller6Selected= controller6.text;
//                                             // controller7Selected= controller7.text;
//                                             controller6Selected= null;
//                                             controller7Selected= null;
//                                           });
//                                         },
// //                                      errorMessage: "يجب ادخال اسم المستخدم",
//                                       ),
//                                       SizedBox(
//                                         height: ScreenHelper.screenHeight(
//                                             context, 30),
//                                       ),
//                                       CustomDropDownField(
//                                         onComplete: () {
//                                           node.nextFocus();
//                                         },
//                                         label: "القسم",
//                                         controller: controller6,
//                                         selected: controller6Selected,
//                                         data: controller5Index.text.isNotEmpty ?
//                                         stageController.collectorStage[int.parse(controller4Index.text)].collegeLists[int.parse(controller5Index.text)].sectionsList:
//                                         [],
//                                         onChanged: (id,index){
//                                           setState(() {
//                                             controller7.clear();
//                                             controller6.text = id.toString();
//                                             controller6Index.text = index.toString();
//                                             print("selected college id >> $id");
//                                             print("selected college index >> $index");
//
//                                             controller7Index.text = "0";
//                                             controller7.text =  stageController
//                                                 .collectorStage[int.parse(controller4Index.text)]
//                                                 .collegeLists[int.parse(controller5Index.text)]
//                                                 .sectionsList[int.parse(controller6Index.text)]
//                                                 .yearList[int.parse(controller7Index.text)]
//                                                 .id.toString();
//                                             // controller7Selected= controller7.text;
//                                             controller7Selected= null;
//
//                                           });
//                                         },
//
// //                                      errorMessage: "يجب ادخال اسم المستخدم",
//                                       ),
//                                       SizedBox(
//                                         height: ScreenHelper.screenHeight(
//                                             context, 30),
//                                       ),
//                                       CustomDropDownField(
//                                         onComplete: () {
//                                           node.unfocus();
//                                         },
//                                         label: "الفرقة",
//                                         controller: controller7,
//                                         selected: controller7Selected,
//                                         data: controller6Index.text.isNotEmpty ?
//                                         stageController.collectorStage[int.parse(controller4Index.text)]
//                                             .collegeLists[int.parse(controller5Index.text)].sectionsList[int.parse(controller6Index.text)].yearList:
//                                         [],
//                                         onChanged: (id,index){
//                                           setState(() {
//                                             controller7.text = id.toString();
//                                             controller7Index.text = index.toString();
//                                             print("selected college id >> $id");
//                                             print("selected college index >> $index");
//                                           });
//                                         },
// //                                      errorMessage: "يجب ادخال اسم المستخدم",
//                                       ),
//                                       SizedBox(
//                                         height: ScreenHelper.screenHeight(
//                                             context, 30),
//                                       ),
//                                     ],
//                                   ),
//                             SizedBox(
//                               height: ScreenHelper.screenHeight(context, 40),
//                             ),
//                             !_keyboardState
//                                 ? SizedBox(
//                                     height: 0,
//                                   )
//                                 : Padding(
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: ScreenHelper.screenWidth(
//                                             context, 39)),
//                                     child: Column(
//                                       children: [
//                                         UsedButton(
//                                           onTap: () {
//                                             // Get.offAll(TabsScreen(),transition: Transition.leftToRight);
//                                             submit(context);
//                                           },
//                                           title: "إنشاء حساب",
//                                         ),
//                                         SizedBox(
//                                           height: ScreenHelper.screenHeight(
//                                               context, 18),
//                                         ),
//                                         SizedBox(
//                                           height: ScreenHelper.screenHeight(
//                                               context, 10),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                           ],
//                         ),
//                       ),
//                       _keyboardState
//                           ? SizedBox(
//                               height: 0,
//                             )
//                           : Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal:
//                                       ScreenHelper.screenWidth(context, 39)),
//                               child: Column(
//                                 children: [
//                                   UsedButton(
//                                     onTap: () {
//                                       // Get.offAll(TabsScreen(),transition: Transition.leftToRight);
//                                       submit(context);
//                                     },
//                                     title: "إنشاء حساب",
//                                   ),
//                                   SizedBox(
//                                     height:
//                                         ScreenHelper.screenHeight(context, 18),
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   void submit(BuildContext context) async {
//     if (_globalKey.currentState.validate()) {
//       _globalKey.currentState.save();
//
//
//       print(controller2.text);
//
//
//      //  AuthUser user = AuthUser();
//      //
//      //  user.isPrimary = typeId.toString();
//      //  // if is primary 0
//      //  user.universityId =  controller4.text.toString();
//      //  user.collegeId =     controller5.text.toString();
//      //  user.departmentId =  controller6.text.toString();
//      //  user.collegeYearId = controller7.text.toString();
//      //  // if is primary 1
//      //  user.primaryStageId = controller1.text.toString();
//      //  user.primaryYearId = controller2.text.toString();
//      //
//      //
//      // Get.dialog(Center(child: LoadingDialog()));
//      // await authController.secondRegister(authUser: user).then((value) {
//      //   switch (value) {
//      //     case 0:
//      //       Get.back();
//      //       Get.offAll(MenuDashboardPage(),
//      //           duration: Duration(milliseconds: 100),
//      //           transition: Transition.leftToRight);
//      //       break;
//      //     case 1:
//      //       Get.back();
//      //       Get.dialog(Center(
//      //           child: ErrorDialog(
//      //         onSave: () {
//      //           Get.back();
//      //         },
//      //         buttonTitle: "المحاولة مرة اخري",
//      //         message: authController.errorMessage,
//      //       )));
//      //       break;
//      //     case 2:
//      //       Get.back();
//      //       Get.dialog(Center(
//      //           child: ErrorDialog(
//      //               onSave: () {
//      //                 Get.back();
//      //               },
//      //               buttonTitle: "المحاولة مرة اخري",
//      //               message: "حدث خطأ ما")));
//      //       break;
//      //     default:
//      //       Get.back();
//      //       Get.dialog(Center(
//      //           child: ErrorDialog(
//      //               onSave: () {
//      //                 Get.back();
//      //               },
//      //               buttonTitle: "المحاولة مرة اخري",
//      //               message: "حدث خطأ ما")));
//      //       break;
//      //   }
//      // });
//     }
//   }
// }


import 'package:azcourses/bloc/model/collector_stage_model.dart';
import 'package:azcourses/bloc/model/primary_stage_model.dart';
import 'package:azcourses/ui/widgets/select_dialog.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:azcourses/bloc/controller/auth_controller.dart';
import 'package:azcourses/bloc/controller/stage_controller.dart';
import 'package:azcourses/bloc/controller/year_controller.dart';
import 'package:azcourses/bloc/model/auth_user.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/global/google_map_screen.dart';
import 'package:azcourses/ui/screens/global/login_screen.dart';
import 'package:azcourses/ui/screens/student/home_screen.dart';
import 'package:azcourses/ui/screens/student/tabs_screen.dart';
import 'package:azcourses/ui/widgets/global/back_bar.dart';
import 'package:azcourses/ui/widgets/global/back_ground.dart';
import 'package:azcourses/ui/widgets/global/custom_drop_down_field.dart';
import 'package:azcourses/ui/widgets/global/custom_text_field.dart';
import 'package:azcourses/ui/widgets/global/error_dialog.dart';
import 'package:azcourses/ui/widgets/global/grade_dialog.dart';
import 'package:azcourses/ui/widgets/global/loading_dialog.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/states_dialog.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';

import '../../../utils/constants.dart';
import 'add_center_register.dart';
import 'menu_screen.dart';

class SignUpSecondScreen extends StatefulWidget {
  final bool isEdit;
  final isVisitor;

  SignUpSecondScreen({this.isEdit=false,this.isVisitor=false});

  @override
  _SignUpSecondScreenState createState() => _SignUpSecondScreenState();
}

class UserType {
  int id;
  String title;

  UserType({this.id, this.title});
}

List<UserType> types = [
  UserType(
    id: 1,
    title: "اساسي",
  ),
  UserType(
    id: 0,
    title: "جامعي",
  ),
];

class _SignUpSecondScreenState extends State<SignUpSecondScreen> {
  AuthController authController = Get.put(AuthController());

  bool isSecure = true;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  // KeyboardVisibilityNotification _keyboardVisibility =
  //     new KeyboardVisibilityNotification();
  // int _keyboardVisibilitySubscriberId;


  bool _keyboardState = false;

  TextEditingController controller1;
  TextEditingController controller1Index;
  TextEditingController controller2;
  TextEditingController controller2Index;
  TextEditingController controller3;
  TextEditingController controller3Index;
  TextEditingController controller4;
  TextEditingController controller4Index;
  TextEditingController controller5;
  TextEditingController controller5Index;
  TextEditingController controller6;
  TextEditingController controller6Index;




  TextEditingController controller1Content;
  TextEditingController controller2Content;
  TextEditingController controller3Content;
  TextEditingController controller4Content;
  TextEditingController controller5Content;
  TextEditingController controller6Content;


  var _selectItem;

  YearController yearController = Get.put(YearController());
  StageController stageController = Get.put(StageController());

  Future<void> fetchYears() async {
    try {
      await yearController.fetchYears();
    } catch (e) {
      print(e);
    }
  }

  bool passSecure = true;
  bool confirmPassSecure = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchYears();
    controller1 = TextEditingController();
    controller1Index = TextEditingController();
    controller2 = TextEditingController();
    controller2Index = TextEditingController();
    controller3 = TextEditingController();
    controller3Index = TextEditingController();
    controller4 = TextEditingController();
    controller4Index = TextEditingController();
    controller5 = TextEditingController();
    controller5Index = TextEditingController();
    controller6 = TextEditingController();
    controller6Index = TextEditingController();

    controller1Content = TextEditingController();
    controller2Content = TextEditingController();
    controller3Content = TextEditingController();
    controller4Content = TextEditingController();
    controller5Content = TextEditingController();
    controller6Content = TextEditingController();

    // _keyboardVisibilitySubscriberId = _keyboardVisibility.addNewListener(
    //   onChange: (bool visible) {
    //     setState(() {
    //       _keyboardState = visible;
    //       print(_keyboardState);
    //     });
    //   },
    // );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller1.dispose();
    controller1Index.dispose();
    controller2.dispose();
    controller2Index.dispose();
    controller3.dispose();
    controller3Index.dispose();
    controller4.dispose();
    controller4Index.dispose();
    controller5.dispose();
    controller5Index.dispose();
    controller6.dispose();
    controller6Index.dispose();




    controller1Content.dispose();
    controller2Content.dispose();
    controller3Content.dispose();
    controller4Content.dispose();
    controller5Content.dispose();
    controller6Content.dispose();

    // _keyboardVisibility.removeListener(_keyboardVisibilitySubscriberId);
    super.dispose();
  }

  int typeId = 1;

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    //
    return SafeArea(
      top: false,
      child: Scaffold(
        body: GetBuilder<StageController>(
          builder: (_) =>  Stack(
            children: [
              BackGround(),
              _.isLoading?
              Center(child: LoadingDialog()):
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenHelper.screenWidth(context, 30)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: ScreenHelper.screenHeight(context, 40),
                      ),
                      Text(
                        widget.isEdit?"تعديل المعلومات":"إنشاء حساب",
                        style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: ScreenHelper.screenFont(context, 17),
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: ScreenHelper.screenHeight(context, 40),
                      ),
                      Form(
                        key: _globalKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                      hoverColor: Colors.red,
                                      focusColor: Colors.green,
                                      groupValue: typeId,
                                      value: types[0].id,
                                      onChanged: (value) {
                                        setState(() {
                                          typeId = types[0].id;
                                        });
                                      },
                                      activeColor: Colors.white,
                                    ),
                                    SizedBox(
                                      width: ScreenHelper.screenWidth(context, 0),
                                    ),

                                    Text(
                                      types[0].title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          .copyWith(
                                        color: Colors.white,
                                        fontSize: ScreenHelper.screenFont(
                                            context, 20),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      focusColor: Colors.white,
                                      groupValue: typeId,
                                      value: types[1].id,
                                      onChanged: (value) {
                                        setState(() {
                                          typeId = types[1].id;
                                        });
                                      },
                                      activeColor: Colors.white,
                                    ),
                                    Text(
                                      types[1].title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          .copyWith(
                                        color: Colors.white,
                                        fontSize: ScreenHelper.screenFont(
                                            context, 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            typeId == 1
                                ? Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Get.dialog(Center(child: SelectDialog<PrimaryStageModel>(
                                      headerTitle: "اختر المرحلة الدراسية",
                                      listData: stageController.primaryStage,
                                      onSave: (PrimaryStageModel data,int index){
                                        controller1Content.text = data.title;
                                        controller1Index.text = index.toString();
                                        controller1.text = data.id.toString();

                                        controller2Content.clear();
                                        Get.back();
                                      },
                                    ),));
                                  },
                                  child: CustomTextField(
                                    onComplete: () {
                                      node.unfocus();
                                    },
                                    enable: false,
                                    enabled: false,
                                    label: "المرحلة الدراسية",
                                    controller: controller1Content,
                                    errorMessage: "يجب اختيار المرحلة الدراسية",
                                    suffixWidget: Icon(Icons.arrow_drop_down,color: Colors.white,),
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenHelper.screenHeight(
                                      context, 30),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Get.dialog(Center(child: SelectDialog<PrimaryYear>(
                                      headerTitle: "اختر الصف الدراسي",
                                      listData:controller1Index.text.isEmpty ?
                                      []:
                                      stageController.primaryStage[int.parse(controller1Index.text)].lists??[],
                                      onSave: (PrimaryYear data,int index){
                                        controller2Content.text = data.title;
                                        controller2Index.text = index.toString();
                                        controller2.text = data.id.toString();

                                        Get.back();
                                      },
                                    ),));
                                  },
                                  child: CustomTextField(
                                    onComplete: () {
                                      node.unfocus();
                                    },
                                    enable: false,
                                    enabled: false,
                                    label: "اختر الصف الدراسي",
                                    controller: controller2Content,
                                    errorMessage: "يجب اختيار الصف الدراسي",
                                    suffixWidget: Icon(Icons.arrow_drop_down,color: Colors.white,),
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenHelper.screenHeight(
                                      context, 30),
                                ),
//                                       CustomTextField(
//                                         onComplete: () {
//                                           node.unfocus();
//                                         },
//                                         label: "الشعبة",
//                                         controller: controller3,
// //                                      errorMessage: "يجب ادخال اسم المستخدم",
//                                       ),
                                SizedBox(
                                  height: ScreenHelper.screenHeight(
                                      context, 30),
                                ),
                              ],
                            )
                                : Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Get.dialog(Center(child: SelectDialog<CollectorStageModel>(
                                      headerTitle: "اختر الجامعة",
                                      listData:stageController.collectorStage,
                                      onSave: (CollectorStageModel data,int index){
                                        controller3Content.text = data.title;
                                        controller3Index.text = index.toString();
                                        controller3.text = data.id.toString();

                                        controller4Content.clear();
                                        controller5Content.clear();
                                        controller6Content.clear();


                                        Get.back();
                                      },
                                    ),));
                                  },
                                  child: CustomTextField(
                                    onComplete: () {
                                      node.unfocus();
                                    },
                                    enable: false,
                                    enabled: false,
                                    label: "اختر الجامعة",
                                    controller: controller3Content,
                                    errorMessage: "يجب اختيار الجامعة",
                                    suffixWidget: Icon(Icons.arrow_drop_down,color: Colors.white,),
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenHelper.screenHeight(
                                      context, 30),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Get.dialog(Center(child: SelectDialog<CollectorCollege>(
                                      headerTitle: "اختر الكلية",
                                      listData: controller3Index.text.isNotEmpty ?
                                      stageController.collectorStage[int.parse(controller3Index.text)].collegeLists??[]:
                                      [],
                                      onSave: (CollectorCollege data,int index){
                                        controller4Content.text = data.title;
                                        controller4Index.text = index.toString();
                                        controller4.text = data.id.toString();

                                        controller5Content.clear();
                                        controller6Content.clear();


                                        Get.back();
                                      },
                                    ),));
                                  },
                                  child: CustomTextField(
                                    onComplete: () {
                                      node.unfocus();
                                    },
                                    enable: false,
                                    enabled: false,
                                    label: "اختر الكلية",
                                    controller: controller4Content,
                                    errorMessage: "يجب اختيار الكلية",
                                    suffixWidget: Icon(Icons.arrow_drop_down,color: Colors.white,),
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenHelper.screenHeight(
                                      context, 30),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Get.dialog(Center(child: SelectDialog<CollectorSection>(
                                      headerTitle: "اختر القسم",
                                      listData: controller4Index.text.isNotEmpty ?
                                      stageController.collectorStage[int.parse(controller3Index.text)].collegeLists[int.parse(controller4Index.text)].sectionsList:
                                      [],
                                      onSave: (CollectorSection data,int index){
                                        controller5Content.text = data.title;
                                        controller5Index.text = index.toString();
                                        controller5.text = data.id.toString();

                                        controller6Content.clear();


                                        Get.back();
                                      },
                                    ),));
                                  },
                                  child: CustomTextField(
                                    onComplete: () {
                                      node.unfocus();
                                    },
                                    enable: false,
                                    enabled: false,
                                    label: "اختر القسم",
                                    controller: controller5Content,
                                    errorMessage: "يجب اختيار القسم",
                                    suffixWidget: Icon(Icons.arrow_drop_down,color: Colors.white,),
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenHelper.screenHeight(
                                      context, 30),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Get.dialog(Center(child: SelectDialog<CollectorYear>(
                                      headerTitle: "اختر الفرقة",
                                      listData:controller5Index.text.isNotEmpty?
                                      stageController.collectorStage[int.parse(controller3Index.text)]
                                          .collegeLists[int.parse(controller4Index.text)].sectionsList[int.parse(controller5Index.text)].yearList:
                                      [],
                                      onSave: (CollectorYear data,int index){
                                        controller6Content.text = data.title;
                                        controller6Index.text = index.toString();
                                        controller6.text = data.id.toString();

                                        Get.back();
                                      },
                                    ),));
                                  },
                                  child: CustomTextField(
                                    onComplete: () {
                                      node.unfocus();
                                    },
                                    enable: false,
                                    enabled: false,
                                    label: "اختر الفرقة",
                                    controller: controller6Content,
                                    errorMessage: "يجب اختيار الفرقة",
                                    suffixWidget: Icon(Icons.arrow_drop_down,color: Colors.white,),
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenHelper.screenHeight(
                                      context, 30),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenHelper.screenHeight(context, 40),
                            ),
                            !_keyboardState
                                ? SizedBox(
                              height: 0,
                            )
                                : Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ScreenHelper.screenWidth(
                                      context, 39)),
                              child: Column(
                                children: [
                                  UsedButton(
                                    widthFraction: 343,
                                    onTap: () {
                                      // Get.offAll(TabsScreen(),transition: Transition.leftToRight);
                                      submit(context);
                                    },
                                    title: "إنشاء حساب",
                                  ),
                                  SizedBox(
                                    height: ScreenHelper.screenHeight(
                                        context, 18),
                                  ),
                                  SizedBox(
                                    height: ScreenHelper.screenHeight(
                                        context, 10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      _keyboardState
                          ? SizedBox(
                        height: 0,
                      )
                          : Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            ScreenHelper.screenWidth(context, 39)),
                        child: Column(
                          children: [
                            UsedButton(
                              widthFraction: 343,
                              onTap: () {
                                // Get.offAll(TabsScreen(),transition: Transition.leftToRight);
                                submit(context);
                              },
                              title: widget.isEdit?"تعديل المعلومات":"إنشاء حساب",
                            ),
                            SizedBox(
                              height:
                              ScreenHelper.screenHeight(context, 18),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void submit(BuildContext context) async {
    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();

      AuthUser user = AuthUser();

      user.isPrimary = typeId.toString();
      // if is primary 0
      user.universityId =  controller3.text.toString();
      user.collegeId =     controller4.text.toString();
      user.departmentId =  controller5.text.toString();
      user.collegeYearId = controller6.text.toString();
      // if is primary 1
      user.primaryStageId = controller1.text.toString();
      user.primaryYearId = controller2.text.toString();



      await authController.secondRegister(isEdit:widget.isEdit,authUser: user,isVisitor: widget.isVisitor).then((value) {

      });
    }
  }
}