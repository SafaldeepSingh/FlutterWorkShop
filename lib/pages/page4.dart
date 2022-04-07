import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
/*
* Forms
* FilePicker
* */
class Page4Widget extends StatefulWidget {

  @override
  State createState() => _Page4WidgetState();
}
class _Page4WidgetState extends State<Page4Widget>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'deadlineDate': DateTime.now(),
    'deadlineTime': TimeOfDay.now(),
    'average_rating': 6
  };

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _formData['deadlineDate'], // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _formData['deadlineDate'])
      setState(() {
        _formData['deadlineDate'] = picked;
        print(picked);
      });
  }
  _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _formData['deadlineTime'], // Refer step 1
    );
    if (picked != null && picked != _formData['deadlineTime'])
      setState(() {
        _formData['deadlineTime'] = picked;
        print(picked);
      });
  }
  _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if(result != null) {
      File file = File(result.files.single.path as String);
    } else {
      // User canceled the picker
    }
  }
  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Title', border: OutlineInputBorder(),filled: true, fillColor: Colors.white,),
      keyboardType: TextInputType.emailAddress,
      validator: (String? value) {
        if(value == null)
          return null;
        if (value.isEmpty) {
          return 'Please enter a title';
        }
      },
      onSaved: (String? value) {
        _formData['title'] = value;
      },
    );
  }
  Widget _buildDescriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Description', border: OutlineInputBorder(), filled: true, fillColor: Colors.white,
      hintMaxLines: 1
      ),
      keyboardType: TextInputType.multiline,
      minLines: 10,
      maxLines: 15,
      onSaved: (String? value) {
        _formData['description'] = value;
      },
    );
  }
  Widget _buildDeadlineDateTimeField() {
    return Column(
      children: [
        ElevatedButton(onPressed: () => _selectDate(context), child: Text("Select Deadline Date")),
        SizedBox(height: 10,),
        ElevatedButton(onPressed: () => _selectTime(context), child: Text("Select Deadline Time"))
      ],
    );
  }
  Widget _buildFilePicker(){
    return ElevatedButton(onPressed: () => _pickFile(), child: Text("Upload Image"));
  }
  Widget _buildRatingSlider(){
    return Slider(
      min: 0,
      divisions: 11,
      label: "Average Rating",
      max: 10,
      value: _formData['average_rating'],
      onChanged: (double value) {
        print(value);
        setState(() {
          _formData['average_rating'] = value;
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a Course"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: targetWidth,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTitleTextField(),
                SizedBox(
                  height: 10.0,
                ),
                _buildDescriptionTextField(),
                SizedBox(
                  height: 10.0,
                ),
                _buildDeadlineDateTimeField(),
                SizedBox(
                  height: 10.0,
                ),
                _buildFilePicker(),
                SizedBox(
                  height: 10.0,
                ),
                _buildRatingSlider(),
                SizedBox(
                  height: 10.0,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}