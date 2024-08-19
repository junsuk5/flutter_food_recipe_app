import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_search_state.freezed.dart';

@freezed
class FilterSearchState with _$FilterSearchState {
  const factory FilterSearchState({
    @Default('All') String time,
    @Default(4) int rate,
    @Default('All') String category,
  }) = _FilterSearchState;
}