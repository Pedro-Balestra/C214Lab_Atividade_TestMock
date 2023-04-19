import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_mock/home.dart';
import 'package:teste_mock/user.dart';
import 'fetch_rick_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group(
    'Teste Mock rick',
    () {
      test(
        '200 Ok',
        () async {
          final client = MockRick();

          when(client.get(
                  Uri.parse("https://rickandmortyapi.com/api/character/293")))
              .thenAnswer(
            (_) async => http.Response(
                '{"id": 293 ,'
                '"name": "Rick Sanchez",'
                '"status": "Dead",'
                '"species": "Human",'
                '"created": "2017-12-31T20:22:29.032Z",'
                '"gender": "male"'
                '}',
                200),
          );
          expect(await fetchUser(client), isA<User>());
        },
      );

      test(
        '404',
        () async {
          final client = MockRick();

          when(client.get(
                  Uri.parse("https://rickandmortyapi.com/api/character/292")))
              .thenAnswer((_) async => http.Response("Not Found", 404));

          expect(fetchUser(client), throwsException);
        },
      );
    },
  );
}
