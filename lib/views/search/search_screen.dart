import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santvani_app/bloc/search/search_bloc.dart';
import 'package:santvani_app/data/repository/search_repo.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/views/search/widget/search_result_item_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (final BuildContext ctx) => SearchBloc(
        searchRepo: ctx.read<SearchRepo>(),
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0.8,
          shadowColor: const Color(0xFFFF9933).withValues(alpha: 0.15),
          title: BlocBuilder<SearchBloc, SearchState>(
            builder: (final BuildContext ctx, final SearchState state) {
              return Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3E0),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFFFCC80), width: 0.8),
                ),
                child: TextField(
                  onChanged: (final String val) {
                    ctx.read<SearchBloc>().add(SearchEvent.onQueryChanged(query: val));
                  },
                  style: dMSansW500.copyWith(fontSize: 14, color: AppColors.colorNeutral900),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Color(0xFFE65100), size: 20),
                    hintText: 'Search by username...',
                    hintStyle: dMSansW400.copyWith(fontSize: 14, color: AppColors.colorNeutral500),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              );
            },
          ),
        ),
        body: BlocBuilder<SearchBloc, SearchState>(
          builder: (final BuildContext ctx, final SearchState state) {
            if (state.status == CommonScreenState.loading) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFFE65100)),
              );
            }

            if (state.status == CommonScreenState.error) {
              return Center(
                child: Text(
                  state.errorMessage ?? 'An error occurred',
                  style: dMSansW500.copyWith(color: AppColors.colorError500),
                ),
              );
            }

            if (state.searchResults.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(Icons.search_rounded, size: 64, color: Color(0xFFFFCC80)),
                    const SizedBox(height: 12),
                    Text(
                      state.query.isEmpty ? 'Search for other saints & seekers' : 'No matching users found',
                      style: dMSansW500.copyWith(fontSize: 14, color: AppColors.colorNeutral500),
                    ),
                  ],
                ),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.searchResults.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (final BuildContext context, final int index) {
                return SearchResultItemWidget(user: state.searchResults[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
