import 'package:yoonek/domain/entities/announcement.dart';
import 'package:yoonek/domain/entities/event.dart';
import 'package:yoonek/domain/entities/leave_balance.dart';
import 'package:yoonek/domain/entities/pay_period.dart';
import 'package:yoonek/domain/entities/policy.dart';
import 'package:yoonek/domain/entities/reporter.dart';
import 'package:yoonek/domain/entities/supervisor.dart';

abstract class DashboardRepository {
  Future<List<Event>> getEvents(int employeeID, int org);
  Future<List<LeaveBalance>> getLeaveBalances(Map<String, String> params);
  Future<List<Announcement>> getAnnouncements(int employeeID, int org);
  Future<List<Reporter>> getReporters(Map<String, String> params);
  Future<List<Policy>> getPolicies(int employeeID, int org);
  Future<List<Supervisor>> getSupervisor(Map<String, String> params);
  Future<List<PayPeriod>> getPayPeriod(int orgId);
}