import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Add, update, and delete songs', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Add a song.
    await tester.enterText(find.byType(TextField).at(0), 'Song Title');
    await tester.enterText(find.byType(TextField).at(1), 'Artist');
    await tester.enterText(find.byType(TextField).at(2), '2024');
    await tester.tap(find.text('Add Song'));
    await tester.pump();

    // Verify that the song is added.
    expect(find.text('Song Title by Artist (2024)'), findsOneWidget);

    // Tap on the song to update it.
    await tester.tap(find.text('Song Title by Artist (2024)'));
    await tester.pump();

    // Update the song.
    await tester.enterText(find.byType(TextField).at(0), 'Updated Title');
    await tester.enterText(find.byType(TextField).at(1), 'Updated Artist');
    await tester.enterText(find.byType(TextField).at(2), '2025');
    await tester.tap(find.text('Update'));
    await tester.pump();

    // Verify that the song is updated.
    expect(find.text('Updated Title by Updated Artist (2025)'), findsOneWidget);

    // Delete the song.
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    // Verify that the song is deleted.
    expect(find.text('Updated Title by Updated Artist (2025)'), findsNothing);
  });
}
