import 'package:flutter/material.dart';
import 'package:mini_project_alfath/config/theme_config.dart';
import 'package:mini_project_alfath/core/component/buttons.dart';
import 'package:mini_project_alfath/core/extensions/parse_selary_ext.dart';
import 'package:mini_project_alfath/core/extensions/sized_box_ext.dart';
import 'package:mini_project_alfath/core/resources/constants/app_constants.dart';
import 'package:mini_project_alfath/core/styles/app_sizes.dart';
import 'package:mini_project_alfath/presentation/work/widget/card_type_work_widget.dart';

class ShowModalBottomFilterWidget extends StatefulWidget {
  final String? selectedTipeBottom;
  final String? selectedMinValue;
  final String? selectedMaxValue;
  final List<int> selectedTipeList;
  final List<String> salaryItems;

  /// Callback untuk kirim hasil filter ke parent
  final void Function({
    required String? tipeBottom,
    required String? minValue,
    required String? maxValue,
    required List<int> tipeList,
    required int? minSalary,
    required int? maxSalary,
  })
  onFilterApplied;

  const ShowModalBottomFilterWidget({
    super.key,
    required this.selectedTipeBottom,
    required this.selectedMinValue,
    required this.selectedMaxValue,
    required this.selectedTipeList,
    required this.salaryItems,
    required this.onFilterApplied,
  });

  @override
  State<ShowModalBottomFilterWidget> createState() =>
      _ShowModalBottomFilterWidgetState();
}

class _ShowModalBottomFilterWidgetState
    extends State<ShowModalBottomFilterWidget> {
  late String? _selectedTipeBottom;
  late String? _selectedMinValue;
  late String? _selectedMaxValue;
  late List<int> _selectedTipeList;

  @override
  void initState() {
    super.initState();
    _selectedTipeBottom = widget.selectedTipeBottom;
    _selectedMinValue = widget.selectedMinValue;
    _selectedMaxValue = widget.selectedMaxValue;
    _selectedTipeList = List.from(widget.selectedTipeList);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.s24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizes.s24.height,
            Text(
              AppConstants.labelWork,
              style: ThemeConfig.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            AppSizes.s12.height,
            StatefulBuilder(
              builder: (context, setModalState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CardTypeWorkWidget(
                          label: 'Semua',
                          isSelected: _selectedTipeBottom == 'Semua',
                          onTap: () {
                            setModalState(() {
                              _selectedTipeBottom = 'Semua';
                              _selectedTipeList = [];
                            });
                          },
                        ),
                        AppSizes.s8.width,
                        CardTypeWorkWidget(
                          label: 'FullTime',
                          isSelected: _selectedTipeBottom == 'FullTime',
                          onTap: () {
                            setModalState(() {
                              _selectedTipeBottom = 'FullTime';
                              _selectedTipeList = [1];
                            });
                          },
                        ),
                        AppSizes.s8.width,
                        CardTypeWorkWidget(
                          label: 'PartTime',
                          isSelected: _selectedTipeBottom == 'PartTime',
                          onTap: () {
                            setModalState(() {
                              _selectedTipeBottom = 'PartTime';
                              _selectedTipeList = [2];
                            });
                          },
                        ),
                      ],
                    ),
                    AppSizes.s8.height,
                    SizedBox(
                      width: 103,
                      child: CardTypeWorkWidget(
                        label: 'Internship',
                        isSelected: _selectedTipeBottom == 'Internship',
                        onTap: () {
                          setModalState(() {
                            _selectedTipeBottom = 'Internship';
                            _selectedTipeList = [3];
                          });
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
            AppSizes.s20.height,
            Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gaji Minimal',
                        style: ThemeConfig.bodyMedium.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      AppSizes.s12.height,
                      DropdownButtonFormField<String>(
                        value: _selectedMinValue,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                        hint: const Text("Rp. 0"),
                        items: widget.salaryItems.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedMinValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                AppSizes.s20.width,
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gaji Maksimal',
                        style: ThemeConfig.bodyMedium.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      AppSizes.s12.height,
                      DropdownButtonFormField<String>(
                        value: _selectedMaxValue,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                        hint: const Text("Rp. 0"),
                        items: widget.salaryItems.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedMaxValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppSizes.s20.height,
            Button.filled(
              height: AppSizes.s45,
              borderRadius: AppSizes.s12,
              onPressed: () {
                final minSalary = parseSalary(_selectedMinValue);
                final maxSalary = parseSalary(_selectedMaxValue);

                widget.onFilterApplied(
                  tipeBottom: _selectedTipeBottom,
                  minValue: _selectedMinValue,
                  maxValue: _selectedMaxValue,
                  tipeList: _selectedTipeList,
                  minSalary: minSalary,
                  maxSalary: maxSalary,
                );

                Navigator.pop(context);
              },
              label: 'Filter',
            ),
            AppSizes.s20.height,
          ],
        ),
      ),
    );
  }
}
