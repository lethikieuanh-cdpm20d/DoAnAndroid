import 'package:flutter/material.dart';

class signupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: signupScreenHome(
        onSubmit: (String value) {},
      ),
    );
  }
}

class signupScreenHome extends StatefulWidget {
  signupScreenHome({Key? key, required this.onSubmit}) : super(key: key);
  final ValueChanged<String> onSubmit;
  @override
  State<StatefulWidget> createState() {
    return signupScreenHomeState();
  }
}

class signupScreenHomeState extends State<signupScreenHome> {
  final txtPasswordController = TextEditingController();
  final txtReEnterPasswordController = TextEditingController();
  final txtUsernameController = TextEditingController();
  final txtEmailController = TextEditingController();
  var _text = '';
  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = txtPasswordController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 8) {
      return 'Too short';
    }
    // return null if the text is valid
    return null;
  }

  @override
  void dispose() {
    txtPasswordController.dispose();
    super.dispose();
  }

  bool _submitted = false;
  void _submit() {
    setState(() => _submitted = true);
    // if there is no error text
    if (_errorText == null) {
      // notify the parent widget via the onSubmit callback
      widget.onSubmit(txtPasswordController.value.text);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 224, 93),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 20, top: 50),
                    child: const Text(
                      'Đăng ký',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: txtUsernameController,
                      decoration: InputDecoration(
                        labelText: 'Tên đăng nhập',
                        labelStyle: const TextStyle(color: Colors.green),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 46, 107, 48)),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: txtPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Nhập mật khẩu',
                        errorText: _submitted ? _errorText : null,
                        labelStyle: const TextStyle(color: Colors.green),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(
                          Icons.visibility_off,
                          color: Colors.green,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 46, 107, 48)),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: txtReEnterPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Nhập lại mật khẩu',
                        labelStyle: const TextStyle(color: Colors.green),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(
                          Icons.visibility_off,
                          color: Colors.green,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 46, 107, 48)),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: txtEmailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Colors.green),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.green,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 46, 107, 48)),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: ElevatedButton(
                      onPressed: txtPasswordController.value.text.isNotEmpty
                          ? _submit
                          : null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 14, 234, 76),
                          minimumSize: const Size(200, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      child: const Text(
                        'Đăng Ký Ngay',
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
