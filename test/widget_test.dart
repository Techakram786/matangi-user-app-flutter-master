import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matangi_user_app/main.dart';
void main(){
  testWidgets('Material App Testing', (WidgetTester tester)async{
    await tester.pumpWidget(MyApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}