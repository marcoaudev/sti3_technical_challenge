import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoTopProdutos extends StatefulWidget {
  final List<ChartData> chartData;

  const GraficoTopProdutos({
    super.key,
    required this.chartData,
  });

  @override
  State<GraficoTopProdutos> createState() => _GraficoTopProdutosState();
}

class _GraficoTopProdutosState extends State<GraficoTopProdutos> {
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    super.initState();
    tooltipBehavior = TooltipBehavior(enable: true);
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfCircularChart(
        legend: const Legend(
          isVisible: true,
          isResponsive: true,
          toggleSeriesVisibility: true,
        ),
        tooltipBehavior: tooltipBehavior,
        series: <CircularSeries>[
          PieSeries<ChartData, String>(
            dataSource: widget.chartData,
            pointColorMapper: (ChartData data, _) => data.color,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.outside,
              connectorLineSettings: ConnectorLineSettings(
                type: ConnectorType.curve,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final int y;
  final Color? color;
}
