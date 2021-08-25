import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final cureentIndex = StateProvider.autoDispose<int>((ref) {
  ref.onDispose(() {
    log('on dispose INdex');
  });
  return 0;
});
