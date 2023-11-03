import 'package:web_app/domain/entity/dashboard.dart';
import 'package:web_app/domain/entity/dashboard_unit.dart';

class DashBoardApiClient {
  Future<List<Dashboard>> getDashboards({int? from, int? to}) async {
    var timestamp = DateTime.now().millisecondsSinceEpoch;

    return [
      Dashboard(
        title: 'Cpu usage',
        units: [
          DashboardUnit(
            timestamp: timestamp++,
            value: 98.1,
          ),
          DashboardUnit(
            timestamp: timestamp++,
            value: 91.1,
          ),
          DashboardUnit(
            timestamp: timestamp++,
            value: 86.1,
          ),
          DashboardUnit(
            timestamp: timestamp++,
            value: 61.1,
          ),
          DashboardUnit(
            timestamp: timestamp++,
            value: 91.1,
          ),
          DashboardUnit(
            timestamp: timestamp++,
            value: 86.1,
          ),
        ],
      ),
      Dashboard(
        title: 'Cpu usage',
        units: [
          DashboardUnit(
            timestamp: timestamp++,
            value: 98.1,
          ),
          DashboardUnit(
            timestamp: timestamp++,
            value: 91.1,
          ),
          DashboardUnit(
            timestamp: timestamp++,
            value: 86.1,
          ),
          DashboardUnit(
            timestamp: timestamp++,
            value: 61.1,
          ),
          DashboardUnit(
            timestamp: timestamp++,
            value: 91.1,
          ),
          DashboardUnit(
            timestamp: timestamp++,
            value: 86.1,
          ),
        ],
      ),
      Dashboard(
        title: 'Cpu usage',
        units: [
          DashboardUnit(
            timestamp: timestamp++,
            value: 98.1,
          ),
          DashboardUnit(
            timestamp: timestamp++,
            value: 91.1,
          ),
          DashboardUnit(
            timestamp: timestamp++,
            value: 86.1,
          ),
          DashboardUnit(
            timestamp: timestamp++,
            value: 61.1,
          ),
          DashboardUnit(
            timestamp: timestamp++,
            value: 91.1,
          ),
          DashboardUnit(
            timestamp: timestamp++,
            value: 86.1,
          ),
        ],
      ),
      Dashboard(
        title: 'Cpu usage',
        units: [
          DashboardUnit(
            timestamp: timestamp++,
            value: 98.1,
          ),
          DashboardUnit(
            timestamp: timestamp++,
            value: 91.1,
          ),
          DashboardUnit(
            timestamp: timestamp++,
            value: 86.1,
          ),
          DashboardUnit(
            timestamp: timestamp++,
            value: 61.1,
          ),
          DashboardUnit(
            timestamp: timestamp++,
            value: 91.1,
          ),
          DashboardUnit(
            timestamp: timestamp++,
            value: 86.1,
          ),
        ],
      ),
    ];
  }
}
