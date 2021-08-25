import 'dart:io';
import 'package:xml/xml.dart';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final double _borderRadius = 16.0;
final double _textFieldsPadding = 24.0;

class ConfigurationItems extends StatelessWidget {
  final homeDirPath = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConfigStateful(),
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView(
      children: [],
    );
  }
}

class ConfigStateful extends StatefulWidget {
  const ConfigStateful({Key? key}) : super(key: key);

  @override
  State<ConfigStateful> createState() => _ConfigStateful();
}

class _ConfigStateful extends State<ConfigStateful> {
  Future WindowSizeFunc() async {
    await DesktopWindow.setWindowSize(Size(400, 860));
  }

  void checkXML(){
    try {
      final file = new File('malleableconfig.xml');
      final document = XmlDocument.parse(
          file.readAsStringSync());
    }
    on FileSystemException {

      final bookshelfXml = '''<?xml version="1.0" encoding="utf-8"?>
<MalleableMenu>
	<MenuConfig>
		<HomeDirectory></HomeDirectory>
	</MenuConfig>
	<IconCreatingConfig>
		<AppIconSize></AppIconSize>
		<AppIconColumns></AppIconColumns>
	</IconCreatingConfig>
	<RunningMode>
		<SingleMode></SingleMode>
		<AutoFocus></AutoFocus>
		<AutoFocusDelay></AutoFocusDelay>
		<MenuFocus></MenuFocus>
	</RunningMode>
</MalleableMenu>''';
      final document = XmlDocument.parse(bookshelfXml);


      var filename = new File('malleableconfig.xml');
      filename.writeAsString(bookshelfXml.toString());

    }
  }


  final homeController = TextEditingController();
  final appSizeController = TextEditingController();
  final appIconsColumnsController = TextEditingController();
  String singleModeValue = 'false';
  String autoFocusValue = 'false';
  final autoFocusDelayController = TextEditingController();
  String menuFocusValue = 'false';

  @override
  Widget build(BuildContext context) {
    WindowSizeFunc();
    checkXML();
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: 327,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: _textFieldsPadding),
                    child: Text('Configurnator',
                        style: GoogleFonts.montserrat(
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: _textFieldsPadding),
                    child: Text(
                      'Menu Configuration',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Padding(
              //         padding: EdgeInsets.only(bottom: _textFieldsPadding),
              //         child: TextField(
              //           decoration: InputDecoration(
              //             focusedBorder: OutlineInputBorder(
              //               borderSide: BorderSide(color: Colors.black),
              //               borderRadius: BorderRadius.all(
              //                 Radius.circular(_borderRadius),
              //               ),
              //             ),
              //             border: OutlineInputBorder(
              //               borderSide: BorderSide(color: Colors.black),
              //               borderRadius: BorderRadius.all(
              //                 Radius.circular(_borderRadius),
              //               ),
              //             ),
              //             labelText: "Menu Directory",
              //             hintText: "Input the path to menu application",
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: _textFieldsPadding),
                      child: TextField(
                        controller: homeController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(_borderRadius),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(_borderRadius),
                            ),
                          ),
                          labelText: "Home Directory",
                          hintText: "Input the home directory path",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: _textFieldsPadding),
                    child: Text(
                      'Icon Configuration',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: _textFieldsPadding),
                      child: TextField(
                        controller: appSizeController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(_borderRadius),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(_borderRadius),
                            ),
                          ),
                          labelText: "App Icon Size",
                          hintText: "Input the desired size",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: _textFieldsPadding),
                      child: TextField(
                        controller: appIconsColumnsController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(_borderRadius),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(_borderRadius),
                            ),
                          ),
                          labelText: "App Columns",
                          hintText: "Input the number of columns",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: _textFieldsPadding),
                    child: Text(
                      'Mode',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: _textFieldsPadding),
                      child: Row(
                        children: [
                          Text(
                            'Single Mode',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: DropdownButton<String>(
                              value: singleModeValue,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  singleModeValue = newValue!;
                                });
                              },
                              items: <String>[
                                'true',
                                'false',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: _textFieldsPadding),
                      child: Row(
                        children: [
                          Text(
                            'Auto Focus',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: DropdownButton<String>(
                              value: autoFocusValue,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  autoFocusValue = newValue!;
                                });
                              },
                              items: <String>[
                                'true',
                                'false',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: _textFieldsPadding),
                      child: TextField(
                        controller: autoFocusDelayController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(_borderRadius),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(_borderRadius),
                            ),
                          ),
                          labelText: "AutoFocus Delay",
                          hintText: "autofocus delay in ms",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: _textFieldsPadding),
                      child: Row(
                        children: [
                          Text(
                            'Menu Focus',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: DropdownButton<String>(
                              value: menuFocusValue,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  menuFocusValue = newValue!;
                                });
                              },
                              items: <String>[
                                'true',
                                'false',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(_borderRadius),
                child: ColoredBox(
                  color: Colors.black,
                  child: ListTile(
                    onTap: () {
                      // print("hi");
                      try {

                        final menuConfigXml = '''<?xml version="1.0" encoding="utf-8"?>
<MalleableMenu>
	<MenuConfig>
		<HomeDirectory>${homeController.text}</HomeDirectory>
	</MenuConfig>
	<IconCreatingConfig>
		<AppIconSize>${appSizeController.text}</AppIconSize>
		<AppIconColumns>${appIconsColumnsController.text}</AppIconColumns>
	</IconCreatingConfig>
	<RunningMode>
		<SingleMode>${singleModeValue}</SingleMode>
		<AutoFocus>${autoFocusValue}</AutoFocus>
		<AutoFocusDelay>${autoFocusDelayController.text}</AutoFocusDelay>
		<MenuFocus>${menuFocusValue}</MenuFocus>
	</RunningMode>
</MalleableMenu>''';

                        var filename = new File('malleableconfig.xml');
                        filename.writeAsString(menuConfigXml.toString());

                        // final file = new File('malleableconfig.xml');
                        // final document = XmlDocument.parse(
                        //     file.readAsStringSync());
                      }
                      on FileSystemException {
                        print("not found");

//                         final bookshelfXml = '''<?xml version="1.0" encoding="utf-8"?>
// <MalleableMenu>
// 	<MenuConfig>
// 		<HomeDirectory>C:\Users\akshif\Documents\</HomeDirectory>
// 	</MenuConfig>
// 	<IconCreatingConfig>
// 		<AppIconSize>256</AppIconSize>
// 		<AppIconColumns>5</AppIconColumns>
// 	</IconCreatingConfig>
// 	<RunningMode>
// 		<SingleMode>true</SingleMode>
// 		<AutoFocus>true</AutoFocus>
// 		<AutoFocusDelay>300</AutoFocusDelay>
// 		<MenuFocus>true</MenuFocus>
// 	</RunningMode>
// </MalleableMenu>''';
//                         final document = XmlDocument.parse(bookshelfXml);
//
//
//                         var filename = new File('malleableconfig.xml');
//                         filename.writeAsString(bookshelfXml.toString());


                        // final document = XmlDocument.parse('bookshelf.xml');
                        // document.toXmlString(pretty: true, indent: '\t');
                        // document.toXmlString(pretty: true, indent: '\t');
                      }
                    },
                    title: Text(
                      'Generate',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
              // Row(
              //   children: [
              //     Expanded(
              //       child: Padding(
              //         padding: EdgeInsets.only(bottom: 16.0),
              //         child: ClipRRect(
              //           borderRadius: BorderRadius.circular(_borderRadius),
              //           child: ColoredBox(
              //             color: Colors.black,
              //             child: ListTile(
              //               onTap: () {
              //
              //                 print("hi");
              //               },
              //               trailing: Icon(
              //                 Icons.navigate_next,
              //                 color: Colors.white,
              //               ),
              //               title: Text(
              //                 'Next',
              //                 style: TextStyle(
              //                   color: Colors.white,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
