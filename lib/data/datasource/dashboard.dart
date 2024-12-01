
import 'package:yoonek/data/datasource/remote.dart';
import 'package:yoonek/data/network/apis.dart';
import 'package:yoonek/domain/entities/announcement.dart';
import 'package:yoonek/domain/entities/event.dart';
import 'package:yoonek/domain/entities/leave_balance.dart';
import 'package:yoonek/domain/entities/pay_period.dart';
import 'package:yoonek/domain/entities/policy.dart';
import 'package:yoonek/domain/entities/reporter.dart';
import 'package:yoonek/domain/entities/supervisor.dart';

abstract class DashboardDataSource {
  Future<List<Event>> getEvents(int employeeID, int org);
  Future<List<LeaveBalance>> getLeaveBalances(Map<String, String> params);
  Future<List<Announcement>> getAnnouncements(int employeeID, int org);
  Future<List<Reporter>> getReporters(Map<String, String> params);
  Future<List<Policy>> getPolicies(int employeeID, int org);
  Future<List<Supervisor>> getSupervisor(Map<String, String> params);
  Future<List<PayPeriod>> getPayPeriod(int orgId);
}


class DashboardRemoteDataSource extends RemoteDataSource implements DashboardDataSource {
  @override
  Future<List<LeaveBalance>> getLeaveBalances(Map<String, String> params) async {
    List<dynamic> response = await safeApiCall(() async {
      return getLeaveBalancesRequest(params);
    });

    return response.map((e){return LeaveBalance.fromJson(e);}).toList();
  }

  @override
  Future<List<Event>> getEvents(int employeeID, int org) async {
    List<dynamic> response = safeApiCall(() async {
      return getEventsRequest(employeeID:employeeID, org:org);
    });
    return response.map((e){return Event.fromJson(e);}).toList();
  }

  @override
  Future<List<Announcement>> getAnnouncements(int employeeID, int org) async {
    List<dynamic> response = safeApiCall(() async {
      return getAnnouncementsRequest(employeeID:employeeID, org:org);
    });

    return response.map((e){return Announcement.fromJson(e);}).toList();
  }

  @override
  Future<List<Reporter>> getReporters(Map<String, String> params) async {
    List<dynamic> response = safeApiCall(() async {
      return getReportersRequest(params);
    });
    return response.map((e){return Reporter.fromJson(e);}).toList();
  }

  @override
  Future<List<Policy>> getPolicies(int employeeID, int org) async {
    List<dynamic> response = safeApiCall(() async {
      return getPoliciesRequest(employeeID:employeeID, org:org);
    });

    return response.map((e){return Policy.fromJson(e);}).toList();
  }

  @override
  Future<List<Supervisor>> getSupervisor(Map<String, String> params) async {
    List<dynamic> response = safeApiCall(() async {
      return getSupervisorRequest(params);
    });

    return response.map((e){return Supervisor.fromJson(e);}).toList();
  }

  @override
  Future<List<PayPeriod>> getPayPeriod(int orgId) async {
    List<dynamic> response = safeApiCall(() async {
      return getPayPeriodRequest(orgId:orgId);
    });

    return response.map((e){return PayPeriod.fromJson(e);}).toList();
  }
}

