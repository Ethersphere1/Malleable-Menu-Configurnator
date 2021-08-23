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
  Future testWindowFunctions() async {
    await DesktopWindow.setWindowSize(Size(400, 860));
  }

  String dropdownValue = 'true';

  @override
  Widget build(BuildContext context) {
    testWindowFunctions();
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
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: _textFieldsPadding),
                      child: TextField(
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
                          labelText: "Menu Directory",
                          hintText: "Input the path to menu application",
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
                              value: dropdownValue,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
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
                              value: dropdownValue,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
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
                              value: dropdownValue,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
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
            ],
          ),
        ),
      ),
    );
  }
}
