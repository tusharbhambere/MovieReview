import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_review/core/model/top10.dart';
import 'package:movie_review/core/repository/api.repo.dart';

final getPerson = FutureProvider<List<Result>>((ref) async {
  return ref.watch(apiProvider).getMovie();
});
