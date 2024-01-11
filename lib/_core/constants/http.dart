import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//권보미
//192.168.0.45

// http 통신
final dio = Dio(
  BaseOptions(
      baseUrl: "http://192.168.0.45:80", // 내 IP 입력
      contentType: "application/json; charset=utf-8"),
);

// 휴대폰 로컬에 파일로 저장
const secureStorage = FlutterSecureStorage();