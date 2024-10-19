import 'package:flutter/material.dart';
import 'package:settings_tiles/settings_tiles.dart';

void main() {
  runApp(const MyApp());
}

/// Example app.
class MyApp extends StatefulWidget {
  /// Example app.
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool toggled = true;
  bool checked = true;
  String selectedOption = 'Option 1';
  List<String> selectedOptions = ['Option 1', 'Option 3'];
  double sliderValue = 5.0;
  Color color = Colors.blue;
  String text = 'Some text';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('settings_tiles example app'),
        ),
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SettingSection(
                    title: 'Section',
                    divider: null,
                    tiles: [
                      const SettingTextTile(
                        icon: Icons.abc,
                        title: 'Text',
                        description: 'This is a text tile',
                      ),
                      SettingActionTile(
                        icon: Icons.touch_app,
                        title: 'Action',
                        description: 'This is an action tile',
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('The action tile was tapped!'),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                      ),
                      SettingSwitchTile(
                        icon: Icons.toggle_on,
                        title: 'Switch',
                        description: 'This is a switch tile',
                        toggled: toggled,
                        onChanged: (value) {
                          setState(() {
                            toggled = value;
                          });
                        },
                      ),
                      SettingCheckboxTile(
                        icon: Icons.check_box,
                        title: 'Title',
                        description: 'This is a checkbox tile',
                        checked: checked,
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }

                          setState(() {
                            checked = value;
                          });
                        },
                      ),
                      SettingSingleOptionTile(
                        icon: Icons.radio_button_on,
                        title: 'Single option',
                        description: 'This is a single option tile',
                        dialogTitle: 'Options',
                        options: const ['Option 1', 'Option 2', 'Option 3'],
                        initialOption: selectedOption,
                        onSubmitted: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                      ),
                      SettingMultipleOptionsTile(
                        icon: Icons.checklist,
                        title: 'Multiple options',
                        description: 'This is a multiple options tile',
                        dialogTitle: 'Options',
                        options: const ['Option 1', 'Option 2', 'Option 3'],
                        initialOptions: selectedOptions,
                        onSubmitted: (value) {
                          setState(() {
                            selectedOptions = value;
                          });
                        },
                      ),
                      SettingTextFieldTile(
                        icon: Icons.text_fields,
                        title: 'Text field',
                        description: 'This is a text field tile',
                        dialogTitle: 'Text',
                        initialText: text,
                        onSubmitted: (value) {
                          setState(() {
                            text = value;
                          });
                        },
                      ),
                      SettingSliderTile(
                        icon: Icons.linear_scale,
                        title: 'Slider',
                        description: 'This is a slider tile',
                        dialogTitle: 'Slider',
                        min: 1.0,
                        max: 10.0,
                        divisions: 9,
                        initialValue: sliderValue,
                        onSubmitted: (value) {
                          setState(() {
                            sliderValue = value;
                          });
                        },
                      ),
                      SettingColorTile(
                        icon: Icons.color_lens,
                        title: 'Color',
                        description: 'This is a color tile',
                        dialogTitle: 'Color',
                        initialColor: color,
                        onSubmitted: (value) {
                          setState(() {
                            color = value;
                          });
                        },
                      ),
                      SettingAboutTile(
                        applicationIcon: Image.asset(
                          'assets/icon/icon.png',
                          fit: BoxFit.fitWidth,
                          height: 64,
                        ),
                        title: 'Application',
                        description: 'v1.0.0',
                      ),
                    ],
                  ),
                  SettingSection(
                    title: 'Section with dividers',
                    tiles: [
                      const SettingTextTile(
                        icon: Icons.abc,
                        title: 'Tile 1',
                        description: 'This is a text tile',
                      ),
                      SettingActionTile(
                        icon: Icons.touch_app,
                        title: 'Tile 2',
                        description: 'This is an action tile',
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('The action tile was tapped!'),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                      ),
                      const SettingTextTile(
                        icon: Icons.abc,
                        title: 'Tile 3',
                        description: 'This is a text tile',
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
