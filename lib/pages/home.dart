import 'package:flutter/material.dart';
import 'package:navigator2_0/arguments/pageArgument.dart';
import 'package:navigator2_0/router/pageManage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('ir page1'),
          onPressed: () => RouterPageManager.of(context)
              .openPage('page1', arguments: PageArgument(id: '1', name: 'page1')),
        ),
      ),
    );
  }
}
