import 'package:flutter/material.dart';
import 'package:navigator2_0/arguments/pageArgument.dart';
import 'package:navigator2_0/router/pageManage.dart';

class Page1 extends StatelessWidget {
  PageArgument pageArgument;

  Page1({@required this.pageArgument});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('page 1 --- id:${pageArgument.id} name: ${pageArgument.id}'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('ir page2'),
          onPressed: () => RouterPageManager.of(context)
              .openPage('page2', arguments: PageArgument(id: '2', name: 'page2')),
        ),
      ),
    );
  }
}
