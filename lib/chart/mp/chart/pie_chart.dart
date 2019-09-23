import 'dart:ui';

import 'package:mp_flutter_chart/chart/mp/core/common_interfaces.dart';
import 'package:mp_flutter_chart/chart/mp/core/data/pie_data.dart';
import 'package:mp_flutter_chart/chart/mp/core/description.dart';
import 'package:mp_flutter_chart/chart/mp/core/marker/bar_chart_marker.dart';
import 'package:mp_flutter_chart/chart/mp/core/marker/i_marker.dart';
import 'package:mp_flutter_chart/chart/mp/painter/pie_chart_painter.dart';

import 'chart.dart';

class PieChart extends PieRadarChart<PieChartPainter> {
  bool drawEntryLabels;
  bool drawHole;
  bool drawSlicesUnderHole;
  bool usePercentValues;
  bool drawRoundedSlices;
  String centerText;
  double holeRadiusPercent; // = 50
  double transparentCircleRadiusPercent; //= 55
  bool drawCenterText; // = true
  double centerTextRadiusPercent; // = 100.0
  double maxAngle; // = 360
  double minAngleForSlices; // = 0

  PieChart(PieData data,
      {IMarker marker,
      Description description,
      OnChartValueSelectedListener selectionListener,
      double rotationAngle = 270,
      double rawRotationAngle = 270,
      bool rotateEnabled = true,
      double minOffset = 30.0,
      double maxHighlightDistance = 100.0,
      bool highLightPerTapEnabled = true,
      bool dragDecelerationEnabled = true,
      double dragDecelerationFrictionCoef = 0.9,
      double extraTopOffset = 0.0,
      double extraRightOffset = 0.0,
      double extraBottomOffset = 0.0,
      double extraLeftOffset = 0.0,
      String noDataText = "No chart data available.",
      bool touchEnabled = true,
      bool drawMarkers = true,
      double descTextSize = 12,
      double infoTextSize = 12,
      Color descTextColor,
      Color infoTextColor,
      bool drawEntryLabels = true,
      bool drawHole = true,
      bool drawSlicesUnderHole = false,
      bool usePercentValues = false,
      bool drawRoundedSlices = false,
      String centerText = "",
      double holeRadiusPercent = 50,
      double transparentCircleRadiusPercent = 55,
      bool drawCenterText = true,
      double centerTextRadiusPercent = 100.0,
      double maxAngle = 360,
      double minAngleForSlices = 0})
      : drawCenterText = drawCenterText,
        drawEntryLabels = drawEntryLabels,
        drawHole = drawHole,
        drawSlicesUnderHole = drawSlicesUnderHole,
        usePercentValues = usePercentValues,
        drawRoundedSlices = drawRoundedSlices,
        holeRadiusPercent = holeRadiusPercent,
        transparentCircleRadiusPercent = transparentCircleRadiusPercent,
        centerTextRadiusPercent = centerTextRadiusPercent,
        centerText = centerText,
        maxAngle = maxAngle,
        minAngleForSlices = minAngleForSlices,
        super(data,
            marker: marker,
            description: description,
            selectionListener: selectionListener,
            maxHighlightDistance: maxHighlightDistance,
            highLightPerTapEnabled: highLightPerTapEnabled,
            dragDecelerationEnabled: dragDecelerationEnabled,
            dragDecelerationFrictionCoef: dragDecelerationFrictionCoef,
            extraTopOffset: extraTopOffset,
            extraRightOffset: extraRightOffset,
            extraBottomOffset: extraBottomOffset,
            extraLeftOffset: extraLeftOffset,
            noDataText: noDataText,
            touchEnabled: touchEnabled,
            drawMarkers: drawMarkers,
            descTextSize: descTextSize,
            infoTextSize: infoTextSize,
            descTextColor: descTextColor,
            infoTextColor: infoTextColor,
            rotationAngle: rotationAngle,
            rawRotationAngle: rawRotationAngle,
            rotateEnabled: rotateEnabled,
            minOffset: minOffset);

  @override
  IMarker initMarker() => BarChartMarker();

  @override
  PieChartState createChartState() {
    return PieChartState();
  }

  PieChartPainter get painter => super.painter;

  @override
  void initialPainter() {
    painter = PieChartPainter(
      data,
      animator,
      viewPortHandler,
      maxHighlightDistance,
      highLightPerTapEnabled,
      dragDecelerationEnabled,
      dragDecelerationFrictionCoef,
      extraLeftOffset,
      extraTopOffset,
      extraRightOffset,
      extraBottomOffset,
      noDataText,
      touchEnabled,
      marker,
      description,
      drawMarkers,
      infoPaint,
      descPaint,
      xAxis,
      legend,
      legendRenderer,
      selectionListener,
      rotationAngle,
      rawRotationAngle,
      rotateEnabled,
      minOffset,
      drawEntryLabels,
      drawHole,
      drawSlicesUnderHole,
      usePercentValues,
      drawRoundedSlices,
      centerText,
      holeRadiusPercent,
      transparentCircleRadiusPercent,
      drawCenterText,
      centerTextRadiusPercent,
      maxAngle,
      minAngleForSlices,
    );
  }
}

class PieChartState extends PieRadarChartState<PieChart> {
  @override
  void updatePainter() {
    if (widget.painter.getData() != null &&
        widget.painter.getData().dataSets != null &&
        widget.painter.getData().dataSets.length > 0)
      widget.painter.highlightValue6(lastHighlighted, false);
  }
}
