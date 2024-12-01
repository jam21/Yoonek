import 'package:yoonek/domain/entities/announcement.dart';
import 'package:yoonek/domain/entities/event.dart';
import 'package:yoonek/domain/entities/leave_balance.dart';
import 'package:yoonek/domain/entities/pay_period.dart';
import 'package:yoonek/domain/entities/policy.dart';
import 'package:yoonek/domain/entities/reporter.dart';
import 'package:yoonek/domain/entities/supervisor.dart';
import 'package:yoonek/domain/repositories/dashboard.dart';

class GetEventsUsecase {
  final DashboardRepository repository;

  GetEventsUsecase({required this.repository});

  Future<List<Event>> call({required int employeeID, required int org}) async {
    return await repository.getEvents(employeeID, org);
  }
}

class GetLeaveBalancesUsecase {
  final DashboardRepository repository;

  GetLeaveBalancesUsecase({required this.repository});

  Future<List<LeaveBalance>> call({required Map<String, String> params}) async {
    return await repository.getLeaveBalances(params);
  }
}

class GetAnnouncementsUsecase {
  final DashboardRepository repository;

  GetAnnouncementsUsecase({required this.repository});

  Future<List<Announcement>> call({required int employeeID, required int org}) async {
    return await repository.getAnnouncements(employeeID, org);
  }
}

class GetReportersUsecase {
  final DashboardRepository repository;

  GetReportersUsecase({required this.repository});

  Future<List<Reporter>> call({required Map<String, String> params}) async {
    return await repository.getReporters(params);
  }
}

class GetPoliciesUsecase {
  final DashboardRepository repository;

  GetPoliciesUsecase({required this.repository});

  Future<List<Policy>> call({required int employeeID, required int org}) async {
    return await repository.getPolicies(employeeID, org);
  }
}

class GetSupervisorUsecase {
  final DashboardRepository repository;

  GetSupervisorUsecase({required this.repository});

  Future<List<Supervisor>> call({required Map<String, String> params}) async {
    return await repository.getSupervisor(params);
  }
}

class GetPayPeriodUsecase {
  final DashboardRepository repository;

  GetPayPeriodUsecase({required this.repository});

  Future<List<PayPeriod>> call({required int orgId}) async {
    return await repository.getPayPeriod(orgId);
  }
}





