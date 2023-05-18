import 'package:flutter/material.dart';

import '../providers/search_word_provider.dart';
import '../widgets/loading_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  TextEditingController wordEditingController = TextEditingController();
  final _keyOne = GlobalKey<FormState>();
  int? resultOcurrency;

  Future<void> _save() async {
    setState(() {
      _isLoading = true;
    });
    String? requestResponse = await SearchWordProvider.countWordOcurrency(
        word: wordEditingController.text);

    setState(() {
      resultOcurrency = int.tryParse(requestResponse ?? '');
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test KnowCode'),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
        child: TextButton(
          onPressed: () {
            if (_keyOne.currentState!.validate()) {
              _save();
            }
          },
          child: const Text(
            'Save',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
      body: _isLoading == true
          ? const LoadingWidget()
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _keyOne,
                    child: TextFormField(
                      autocorrect: false,
                      controller: wordEditingController,
                      decoration: const InputDecoration(
                        labelText: 'Find word',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required field';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                if (resultOcurrency != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'A palavra "${wordEditingController.text}" aparece $resultOcurrency vezes.'),
                  ),
              ],
            ),
    );
  }
}
