import 'package:defov_flutter/test/album.dart';
import 'package:defov_flutter/test/fetch_album.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_album_dio_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group('fetchAlbumDio', () {
    test('returns an Album if the http call completes successfully', () async {
      final dio = MockDio();
      when(dio.get('https://jsonplaceholder.typicode.com/albums/1'))
          .thenAnswer((realInvocation) async {
        return Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 200,
          data:
              '{"userId": 1, "id": 2, "title": "mockito", "description": "hello"}',
        );
      });

      // when(dio.get('https://jsonplaceholder.typicode.com/albums/1')).thenReturn(
      //   Future.value(
      //     Response(
      //       requestOptions: RequestOptions(path: ''),
      //       statusCode: 200,
      //       data:
      //           '{"userId": 1, "id": 2, "title": "mockito", "description": "hello"}',
      //     ),
      //   ),
      // );
      expect(await fetchAlbumDio(dio), isA<String>());
    });
  });
}
