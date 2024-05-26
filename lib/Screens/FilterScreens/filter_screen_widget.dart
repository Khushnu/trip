import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trip/Model/travelcategorymodel.dart';
import 'package:trip/Screens/FilterScreens/Widgets/label_text_widget.dart';
import 'package:trip/Screens/FilterScreens/barchart_widget.dart';
import 'package:trip/Widgets/text_input_widget.dart';
import 'package:trip/Widgets/text_widget.dart';
import 'package:trip/Widgets/thumb.dart';
import 'package:trip/theme.dart';

class FilterTabWidget extends StatefulWidget {
  const FilterTabWidget({super.key});

  @override
  State<FilterTabWidget> createState() => _FilterTabWidgetState();
}

class _FilterTabWidgetState extends State<FilterTabWidget> {
  RangeValues _currentRangeValues = const RangeValues(0, 100);
  double height = 0;
  var currentSelect;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            const TextWidget(
              text: 'Travel category',
              size: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 4,
            ),
            TextWidget(
              text: 'Select travel category',
              size: 16,
              colortext: Colors.white.withOpacity(0.6),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.1 + 20,
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  verticalDirection: VerticalDirection.down,
                  children: listCategoryTravel.map((e) {
                    bool isSelected = currentSelect == e;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          currentSelect = e;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 18),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: isSelected ? Colors.white : secondaryColor),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              e.icon,
                              scale: 1.4,
                              color: isSelected ? Colors.black : Colors.white,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            TextWidget(
                              text: e.name,
                              size: 13,
                              colortext:
                                  isSelected ? Colors.black : Colors.white,
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                )),
            const TextLabeelWidget(
                text1: 'Total trip budget',
                text2: 'Budget is an approximation of the trip cost'),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.1 + 50,
              alignment: Alignment.bottomCenter,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      BarChartWidget(height: 70),
                      SizedBox(
                        width: 5,
                      ),
                      BarChartWidget(height: 90),
                      SizedBox(
                        width: 5,
                      ),
                      BarChartWidget(height: 40),
                      SizedBox(
                        width: 5,
                      ),
                      BarChartWidget(height: 60),
                      SizedBox(
                        width: 5,
                      ),
                      BarChartWidget(height: 90),
                      SizedBox(
                        width: 5,
                      ),
                      BarChartWidget(height: 90),
                      SizedBox(
                        width: 5,
                      ),
                      BarChartWidget(height: 40),
                      SizedBox(
                        width: 5,
                      ),
                      BarChartWidget(height: 60),
                    ],
                  ),
                  SliderTheme(
                    data: const SliderThemeData(
                        rangeThumbShape: CircleThumbShape()),
                    child: RangeSlider(
                        max: 100,
                        min: 0,
                        inactiveColor: Colors.white.withOpacity(0.2),
                        activeColor: Colors.white,
                        values: _currentRangeValues,
                        onChanged: (v) {
                          setState(() {
                            _currentRangeValues = v;
                          });
                        }),
                  ),
                ],
              ),
            ),
            const TextLabeelWidget(
                text1: 'Trip duration',
                text2: 'Select the duration of the trip'),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget(
                  text: 'Min',
                  size: 13,
                ),
                const Spacer(),
                const TextWidget(
                  text: 'Max',
                  size: 13,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4 - 10,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Expanded(
                    child: TextInputWidget(
                  hintText: 'Min',
                  isIcon: false,
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: TextInputWidget(
                  hintText: 'Min',
                  isIcon: false,
                )),
              ],
            ),
            const TextLabeelWidget(
                text1: 'Trip duration',
                text2: 'Select the duration of the trip')
          ],
        ),
      ),
    );
  }
}