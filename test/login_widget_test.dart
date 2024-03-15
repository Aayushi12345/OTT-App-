

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ott_app/main.dart';

void main(){
  
  testWidgets("test login Widger", (WidgetTester tester) 
    async{
    await tester.pumpWidget(MyApp());
    var loginTextField = find.byType(TextFormField);
    expect(loginTextField,findsOneWidget);
    await tester.enterText(loginTextField, "hello");
   expect(find.text('hello'), findsOneWidget);

    }
  );
}