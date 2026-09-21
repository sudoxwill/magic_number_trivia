import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:number_trivia/core/constants/cache_constants.dart';
import 'package:number_trivia/core/network/dio_client.dart';
import 'package:number_trivia/core/network/network_info.dart';

final dioProvider = Provider<Dio>((ref) {
  return createDioInstance();
});

final hiveProvider = Provider<Box<String>>((ref) {
  return Hive.box<String>(CacheConstants.hiveBox);
});

final internetConnectionCheckerProvider = Provider<InternetConnectionChecker>((
  ref,
) {
  return InternetConnectionChecker.createInstance();
});

final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfoImpl(ref.watch(internetConnectionCheckerProvider));
});
