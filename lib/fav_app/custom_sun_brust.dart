import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SunburstData {
  final String id;
  final String parent;
  final String name;
  final String label;
  final num value;
  final String color;

  SunburstData({
    required this.id,
    required this.parent,
    required this.name,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  String toString() {
    return '''
    {
      id: '$id',
      parent: '$parent',
      name: '$name',
      color: '$color',
      label: '$label',
      value: $value,
    }
    ''';
  }
}

class SunburstChart extends StatefulWidget {
  final List<SunburstData> chartData;

  const SunburstChart({super.key, required this.chartData});

  @override
  State<SunburstChart> createState() => _SunburstChartState();
}

class _SunburstChartState extends State<SunburstChart> {
  InAppWebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    final script = _generateChartScript(widget.chartData);
    _updateChart(script);
    return SizedBox(
      height: 260,
      child: InAppWebView(
        initialData: InAppWebViewInitialData(
          data: _generateChartScript(widget.chartData),
        ),
        initialSettings: InAppWebViewSettings(javaScriptEnabled: true),
        onWebViewCreated: (controller) {
          _webViewController = controller;
          final script = _generateChartScript(widget.chartData);
          _updateChart(script);
        },
      ),
    );
  }

  void _updateChart(String script) {
    _webViewController?.loadData(data: script);
  }

  String _generateChartScript(List<SunburstData> data) {
    final seriesString = data.toString();
    print(seriesString);
    return '''
    <!DOCTYPE html>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/sunburst.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
    Highcharts.chart('container', {
        chart: {
           height: '80%',
        },
        colors: ['transparent'].concat(Highcharts.getOptions().colors),
        title: undefined,
        exporting: {
            enabled: false
        },
         credits: {
            enabled: false
        },
        series: [{
            type: 'sunburst',
            data: $seriesString,
            name: 'H',
            allowTraversingTree: true,
            accessibility: {
                enabled: false,
            },
            time: {
            useUTC: false,
          },
            allowDrillToNode: true,
            borderRadius: 3,
            borderWidth: 1,
            borderColor: '#fff',
            cursor: 'pointer',
            dataLabels: {
                format: '{point.name}',
                filter: {
                    property: 'innerArcLength',
                    operator: '>',
                    value: 16
                }, style: { 
                    color: 'white',
                    fontSize: '25',
                    fontWeight: '400',
                    textOutline: 'none',
                }
            },
            
            levels: [{
                level: 1,
                levelIsConstant: false,
                dataLabels: {
                    filter: {
                        property: 'outerArcLength',
                        operator: '>',
                        value: 64
                    },
                },
            }, {
                level: 2,
                colorByPoint: true
            }, {
                level: 3,
                colorVariation: {
                    key: 'brightness',
                    to: -0.2
                }
            }]
        }],
        tooltip: {
            style: {
                fontSize: '30px'
            },
            headerFormat: '',
            pointFormat: '<b> {point.name} <br/>Portfolio wt. {point.value}%</b>',
        }
        });
    });
    </script>
    
    <figure class="highcharts-figure">
        <div id="container"></div>
    </figure>
    ''';
  }
}
