
import 'package:flutter/material.dart';

/// This Widget is the main application widget.
class AddNews extends StatelessWidget {
  static const String _title = 'ADD NEW NEWS';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: NewsForm(),
      ),
    );
  }
}

class NewsForm extends StatefulWidget {
  NewsForm({Key key}) : super(key: key);

  @override
  _NewsFormWidgetState createState() => _NewsFormWidgetState();
}

class _NewsFormWidgetState extends State<NewsForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your user id',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your user id';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your user id',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your user id';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}