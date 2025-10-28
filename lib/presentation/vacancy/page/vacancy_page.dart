import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/extensions/build_context_ext.dart';
import 'package:mini_project_alfath/core/styles/app_colors.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';
import 'package:mini_project_alfath/presentation/connectivity/bloc/bloc/connectivity_bloc.dart';
import 'package:mini_project_alfath/presentation/error/page/error_page.dart';
import 'package:mini_project_alfath/presentation/vacancy/page/detail_vacancy_page.dart';
import 'package:mini_project_alfath/presentation/vacancy/widget/card_job_vacancy_widget.dart';
import 'package:mini_project_alfath/presentation/vacancy/widget/search_job_vacancy_widget.dart';

class VacancyPage extends StatefulWidget {
  const VacancyPage({super.key});

  @override
  State<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends State<VacancyPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isSearchVisible = true;
  double _lastOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    final offset = _scrollController.offset;

    // scroll ke bawah -> sembunyikan
    if (offset > _lastOffset && offset - _lastOffset > 5) {
      if (_isSearchVisible) {
        setState(() => _isSearchVisible = false);
      }
    }
    // scroll ke atas -> tampilkan
    else if (offset < _lastOffset && _lastOffset - offset > 5) {
      if (!_isSearchVisible) {
        setState(() => _isSearchVisible = true);
      }
    }

    _lastOffset = offset;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const SizedBox();
          },
          connected: () {
            return Scaffold(
              backgroundColor: AppColors.colorGeneralWhite,
              appBar: AppBar(
                title: Text(
                  'Lowongan Pekerjaan',
                  style: ThemeConfig.titleMedium.copyWith(
                    fontSize: AppSizes.s18,
                  ),
                ),
                backgroundColor: AppColors.colorGeneralWhite,
                // elevation: _isSearchVisible ? 4 : 0,
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.s16),
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: _isSearchVisible ? 70 : 0,
                      curve: Curves.easeInOut,
                      child: _isSearchVisible
                          ? SearchJobVacancyWidget(
                              controller: TextEditingController(),
                              onTap: () {},
                            )
                          : const SizedBox.shrink(),
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return CardJobVacancyWidget(
                            title: 'UI/UX Designer',
                            type: 'Fulltime',
                            companyName: 'Nama Company',
                            location: 'Surabaya, Indonesia',
                            postedDate: '17/08/2024',
                            status: 'Open',
                            onTap: () {
                              context.push(DetailVacancyPage());
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          disconnected: () {
            return const ErrorPage();
          },
        );
      },
    );
  }
}
