import 'package:flutter_complete/core/di/di.dart';
import 'package:flutter_complete/core/exceptions/app_exception.dart';
import 'package:flutter_complete/core/hive/hive_service.dart';
import 'package:flutter_complete/domain/start/view/start_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fakes/fake_hive_service.dart';
import '../../../helpers/helpers.dart';

void main() {

  group('Start page tests', () {

    setUpAll(setupAllForTests);

    testWidgets('Test page has error', (tester) async {

      final fakeHiveService = FakeHiveService(
        fakeInit: () {
          throw DefaultAppException();
        },
      );
      locator.registerSingleton<HiveService>(fakeHiveService);

      await tester.pumpApp(
        const StartPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(StartPage), findsOneWidget);
      expect(find.text(DefaultAppException().userFriendlyMessage), findsOneWidget);

    });

  });

}