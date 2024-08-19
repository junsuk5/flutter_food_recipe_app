import 'package:flutter/material.dart';
import 'package:food_recipe_app/domain/filter/filter_search_state.dart';
import 'package:food_recipe_app/presentation/component/small_button.dart';
import 'package:food_recipe_app/presentation/main/home/component/filter_picker.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class FilterSearchSheet extends StatefulWidget {
  final FilterSearchState state;
  final ValueChanged<FilterSearchState> onChangeFilter;

  const FilterSearchSheet({
    super.key,
    required this.state,
    required this.onChangeFilter,
  });

  @override
  State<FilterSearchSheet> createState() => _FilterSearchSheetState();
}

class _FilterSearchSheetState extends State<FilterSearchSheet> {
  late FilterSearchState _state;

  @override
  void initState() {
    super.initState();
    _state = widget.state;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 31),
            const Text(
              'Filter Search',
              style: TextStyles.smallTextBold,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Time',
                    style: TextStyles.smallTextBold,
                  ),
                  FilterPicker(
                    items: const [
                      'All',
                      'Newest',
                      'Oldest',
                      'Popularity',
                    ],
                    selectedItem: _state.time,
                    onChangeValue: (String value) {
                      setState(() {
                        _state = _state.copyWith(time: value);
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Rate',
                    style: TextStyles.smallTextBold,
                  ),
                  FilterPicker(
                    items: const [
                      '5',
                      '4',
                      '3',
                      '2',
                      '1',
                    ],
                    selectedItem: _state.rate.toString(),
                    onChangeValue: (String value) {
                      setState(() {
                        _state = _state.copyWith(rate: int.parse(value));
                      });
                    },
                  ),
                  const Text(
                    'Rate',
                    style: TextStyles.smallTextBold,
                  ),
                  FilterPicker(
                    items: const [
                      'All',
                      'Cereal',
                      'Vegetables',
                      'Dinner',
                      'Chinese',
                      'Local Dish',
                      'Fruit',
                      'BreadFast',
                      'Spanish',
                      'Chinese',
                      'Lunch',
                    ],
                    selectedItem: _state.category,
                    onChangeValue: (String value) {
                      setState(() {
                        _state = _state.copyWith(category: value);
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  SmallButton(
                    text: 'Filter',
                    onPressed: () => widget.onChangeFilter(_state),
                  ),
                  const SizedBox(height: 22),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
