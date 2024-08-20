import 'package:flutter/material.dart';
import 'package:food_recipe_app/domain/filter/filter_search_state.dart';
import 'package:food_recipe_app/presentation/component/search.dart';
import 'package:food_recipe_app/presentation/component/search_image.dart';
import 'package:food_recipe_app/presentation/main/home/component/filter_search_sheet.dart';
import 'package:food_recipe_app/presentation/search/search_view_model.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search recipes',
          style: TextStyles.mediumTextBold,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Search(
            hintText: 'Search recipe',
            onChangeQuery: viewModel.search,
            onTapFilter: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return FilterSearchSheet(
                    onChangeFilter: (filter) {
                      // TODO : 필터 동작
                      Navigator.pop(context);
                    },
                    state: const FilterSearchState(),
                  );
                },
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30.0, top: 10.0, bottom: 20.0),
            child: Text(
              'Recent search',
              style: TextStyles.normalTextBold,
            ),
          ),
          viewModel.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15),
                        itemCount: viewModel.recipes.length,
                        itemBuilder: (context, index) {
                          return SearchImage(recipe: viewModel.recipes[index]);
                        }),
                  ),
                ),
        ],
      ),
    );
  }
}
