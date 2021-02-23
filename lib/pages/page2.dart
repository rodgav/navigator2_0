import 'package:flutter/material.dart';
import 'package:navigator2_0/arguments/pageArgument.dart';
import 'package:navigator2_0/router/pageManage.dart';

class Page2 extends StatelessWidget {
  PageArgument pageArgument;

  Page2({@required this.pageArgument});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('page 2 --- id:${pageArgument.id} name: ${pageArgument.id}'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('ir a home'),
          onPressed: () => RouterPageManager.of(context).didPopAll(),
        ),
      ),
    );
  }
}
