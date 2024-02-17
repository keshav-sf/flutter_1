import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/extensions/context_extension.dart';
import 'package:flutter_boilerplate/src/base/extensions/scaffold_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/fontsize_constant.dart';
import 'package:flutter_boilerplate/src/controllers/auth/auth_controller.dart';
// ignore: unused_import
import 'package:flutter_boilerplate/src/widgets/primary_button.dart';
import 'package:flutter_boilerplate/src/widgets/primary_text_button_widget.dart';
import 'package:flutter_boilerplate/src/widgets/single_text_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../base/dependencyinjection/locator.dart';
import '../../base/utils/constants/preference_key_constant.dart';
import '../../base/utils/preference_utils.dart';
import '../../models/auth/res_dashboard_model.dart';

class GDPData {
  GDPData(this.continent, this.gap);

  final String continent;
  final int gap;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<GDPData> _chartData;

  final _dashboard = ValueNotifier<ResDashboardModel?>(null);
  Future<void> _getdashboard() async {
    _dashboard.value = await locator<AuthController>().dashboardApiCall();
  }

  @override
  void initState() {
    _getdashboard();
    super.initState();
  }

  List<GDPData> getChartData({paid, unpaid}) {
    final List<GDPData> chartData = [
      GDPData('paid', paid),
      GDPData('unpaid', unpaid),
    ];
    return chartData;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
            valueListenable: _dashboard,
            builder: (context, ResDashboardModel? dashboard, child) {
              _chartData = getChartData(
                  paid: _dashboard.value!.data!.totalInvoices!.paid,
                  unpaid: _dashboard.value!.data!.totalInvoices!.unpaid);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getTotalIncome(totalIncome: dashboard?.data?.totalIncome),
                  _getReportChart(
                      total: dashboard?.data?.total,
                      totalInvoice: dashboard?.data?.totalInvoices),
                  _addSpacing(value: 50.0),
                  _getSingleButton(
                      buttonText: "New Invoice", buttonIcon: Icons.add),
                  _getSingleButton(
                      buttonText: "Invoice List", buttonIcon: Icons.add),
                  _getDoubleButton(
                    button1Text: "Expense Manage",
                    button1Icon: Icons.currency_exchange_rounded,
                    button2Text: "Items",
                    button2Icon: Icons.label,
                  ),
                  _getDoubleButton(
                    button1Text: "Reports",
                    button1Icon: Icons.bar_chart,
                    button2Text: "Client List",
                    button2Icon: Icons.person,
                  )
                ],
              );
            })
        .dashboardContainerScaffold(
            context: context,
            title: getString(prefkeyName),
            bottomNavigationIcon1: Icons.home,
            bottomNavigationIcon2: Icons.person_2_outlined);
  }

  Widget _addSpacing({value = 10.0}) {
    return SizedBox(height: value);
  }

  Widget _getTotalIncome({totalIncome = 0}) {
    return Container(
      width: context.getWidth(),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            offset: Offset(0, 7),
            spreadRadius: 0,
            blurRadius: 5,
            color: Colors.black12),
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SingleTextWidget(
              text: "Total Income",
              textWeight: fontWeightRegular,
              textSize: fontSize16,
            ),
            _addSpacing(),
            SingleTextWidget(
              text: "$totalIncome SR",
              textWeight: fontWeightMedium,
              textSize: fontSize32,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getDonutChart({total = 0}) {
    return SizedBox(
      height: 200,
      child: SfCircularChart(
        annotations: [CircularChartAnnotation(widget: Text("Total $total"))],
        margin: EdgeInsets.zero,
        palette: const <Color>[primaryColor, Colors.grey],
        series: <CircularSeries>[
          DoughnutSeries<GDPData, String>(
            // strokeWidth: 10,
            dataSource: _chartData,
            xValueMapper: (GDPData data, _) => data.continent,
            yValueMapper: (GDPData data, _) => data.gap,
            radius: '90%',
            innerRadius: '70%',
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          )
        ],
      ),
    );
  }

  Widget _getChartlabelData({text, color, total = 0}) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              maxRadius: 10,
              backgroundColor: color,
            ),
            const SizedBox(
              width: 5,
            ),
            SingleTextWidget(
              text: text,
              textWeight: FontWeight.bold,
              textColor: secondaryTextColor,
              textSize: fontSize16,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 5),
          child: SingleTextWidget(
            text: "$total SR",
            textColor: secondaryTextColor,
            textSize: fontSize22,
            textWeight: FontWeight.w500,
            // textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _getReportChart({total, totalInvoice}) {
    return Container(
      color: primaryColor.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: context.getWidth(0.6),
                  child: Column(
                    children: [_getDonutChart(total: total)],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getChartlabelData(
                        color: primaryColor,
                        text: "Paid",
                        total: totalInvoice.paid),
                    _addSpacing(value: 30.0),
                    _getChartlabelData(
                        color: Colors.grey,
                        text: "Unpaid",
                        total: totalInvoice.unpaid),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSingleButton({buttonText, buttonIcon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: PrimaryTextButton(
        buttonText: buttonText,
        onButtonClick: () {},
        textColor: secondaryTextColor,
        textSize: fontSize20,
        textWeight: fontWeightMedium,
        buttonIcon: buttonIcon,
        borderColor: secondaryTextColor,
        borderRadius: 5,
        verticalPadding: 18,
        horizontalPadding: 10,
      ),
    );
  }

  Widget _getDoubleButton(
      {button1Text, button1Icon, button2Text, button2Icon}) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Expanded(
          child: Row(
            children: [
              Expanded(
                child: PrimaryTextButton(
                  buttonText: button1Text,
                  onButtonClick: () {},
                  textColor: secondaryTextColor,
                  textSize: fontSize14,
                  textWeight: fontWeightMedium,
                  buttonIcon: button1Icon,
                  borderColor: secondaryTextColor,
                  borderRadius: 5,
                  verticalPadding: 10,
                  horizontalPadding: 10,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: PrimaryTextButton(
                  buttonText: button2Text,
                  onButtonClick: () {},
                  textColor: secondaryTextColor,
                  textSize: fontSize14,
                  textWeight: fontWeightMedium,
                  buttonIcon: button2Icon,
                  borderColor: secondaryTextColor,
                  borderRadius: 5,
                  verticalPadding: 10,
                  horizontalPadding: 10,
                ),
              ),
            ],
          ),
        ));
  }
}
