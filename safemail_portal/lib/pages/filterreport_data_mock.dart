import 'dart:core';
import 'package:safemail_portal/pages/filterreportchart.dart';

class DataMock {

  List<FilterReportData> GenerateData(
  List<String> selectedSources) {
    List<FilterReportData> lstData = [
      FilterReportData(Date: "01/04", Reviewed: 0, Flags: 0, Filtered: 0),
      FilterReportData(Date: "01/05", Reviewed: 0, Flags: 0, Filtered: 0),
      FilterReportData(Date: "01/06", Reviewed: 0, Flags: 0, Filtered: 0),
      FilterReportData(Date: "01/07", Reviewed: 0, Flags: 0, Filtered: 0),
    ];
    final List<FilterReportData> lstEmailData = [
      FilterReportData(Date: "01/04", Reviewed: 10, Flags: 9, Filtered: 15),
      FilterReportData(Date: "01/05", Reviewed: 7, Flags: 5, Filtered: 19),
      FilterReportData(Date: "01/06", Reviewed: 12, Flags: 6, Filtered: 14),
      FilterReportData(Date: "01/07", Reviewed: 8, Flags: 5, Filtered: 17),
    ];
    final List<FilterReportData> lstDriveData = [
      FilterReportData(Date: "01/04", Reviewed: 20, Flags: 19, Filtered: 25),
      FilterReportData(Date: "01/05", Reviewed: 17, Flags: 15, Filtered: 23),
      FilterReportData(Date: "01/06", Reviewed: 17, Flags: 7, Filtered: 19),
      FilterReportData(Date: "01/07", Reviewed: 8, Flags: 5, Filtered: 17),
    ];
    final List<FilterReportData> lstCalendarData = [
      FilterReportData(Date: "01/04", Reviewed: 2, Flags: 0, Filtered: 7),
      FilterReportData(Date: "01/05", Reviewed: 4, Flags: 1, Filtered: 9),
      FilterReportData(Date: "01/06", Reviewed: 3, Flags: 1, Filtered: 8),
      FilterReportData(Date: "01/07", Reviewed: 6, Flags: 0, Filtered: 7),
    ];

    if (selectedSources.contains("Email")) {
      for (var sourceItem in lstEmailData) {
        var item = lstData.firstWhere((item) => item.Date == sourceItem.Date);
        item.Filtered += sourceItem.Filtered;
        item.Flags += sourceItem.Flags;
        item.Reviewed += sourceItem.Reviewed;
      }
    }

    if (selectedSources.contains("Drive")) {
      for (var sourceItem in lstDriveData) {
        var item = lstData.firstWhere((item) => item.Date == sourceItem.Date);
        item.Filtered += sourceItem.Filtered;
        item.Flags += sourceItem.Flags;
        item.Reviewed += sourceItem.Reviewed;
      }
    }

    if (selectedSources.contains("Calendar")) {
      for (var sourceItem in lstCalendarData) {
        var item = lstData.firstWhere((item) => item.Date == sourceItem.Date);
        item.Filtered += sourceItem.Filtered;
        item.Flags += sourceItem.Flags;
        item.Reviewed += sourceItem.Reviewed;
      }
    }

    return lstData;
  }
}
