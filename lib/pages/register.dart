import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi registro'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: ('email'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: ('first_name'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: ('username'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: ('email'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: ('password'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Year',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Gender',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        OutlinedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.indigo),
                          ),
                          onPressed: () {},
                          child: const Text('Presioname'),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
