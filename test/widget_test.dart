import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lecture_glass_ai/app/app.dart';

void main() {
  testWidgets('App builds successfully', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: LectureGlassApp(),
      ),
    );
    await tester.pump();

    expect(find.text('講義を検索...'), findsOneWidget);
  });
}