import 'package:yoonek/data/network/apis.dart';
import 'package:yoonek/domain/entities/announcement.dart';
import 'package:yoonek/domain/entities/event.dart';
import 'package:yoonek/domain/entities/leave_balance.dart';
import 'package:yoonek/domain/entities/pay_period.dart';
import 'package:yoonek/domain/entities/policy.dart';
import 'package:yoonek/domain/usecases/dashboard.dart';

class EventsNotifier extends ResponseNotifier<List<Event>> {
  final GetEventsUsecase getEventsUsecase;
  // Session? session;

  EventsNotifier({required this.getEventsUsecase});

  Future<void> getEvents() async {
    response = Loading();
    notifyListeners();
    try {
      List<Event> data = await getEventsUsecase.call(employeeID: 2, org: 1);
      response = Success(data: data);
    } on Exception catch (e) {
      response = Error(exception: e);
    }

    notifyListeners();
  }

  @override
  Response<List<Event>>? response;
}

class LeaveBalanceNotifier extends ResponseNotifier<List<LeaveBalance>> {
  final GetLeaveBalancesUsecase getLeaveBalancesUsecase;
  // Session? session;

  LeaveBalanceNotifier({required this.getLeaveBalancesUsecase});

  Future<void> getLeavebalances() async {
    response = Loading();
    notifyListeners();
    try {
      Map<String, String> params = {};
      params["o"]="1";
      params["p1"]="2024";

      List<LeaveBalance> data = await getLeaveBalancesUsecase.call(params: {"o":"1", "p1":"2024"});
      response = Success(data: data);
    } on Exception catch (e) {
      response = Error(exception: e);
    }

    notifyListeners();
  }

  @override
  Response<List<LeaveBalance>>? response;
}

class AnnouncementNotifier extends ResponseNotifier<List<Announcement>> {
  final GetAnnouncementsUsecase getAnnouncementsUsecase;
  // Session? session;

  AnnouncementNotifier({required this.getAnnouncementsUsecase});

  Future<void> getAnnouncements() async {
    response = Loading();
    notifyListeners();
    try {
      Map<String, String> params = {};
      params["o"]="1";
      params["p1"]="2024";

      List<Announcement> data = await getAnnouncementsUsecase.call(employeeID: 2,org: 1);
      response = Success(data: data);
    } on Exception catch (e) {
      response = Error(exception: e);
    }

    notifyListeners();
  }

  @override
  Response<List<Announcement>>? response;
}

class PolicyNotifier extends ResponseNotifier<List<Policy>> {
  final GetPoliciesUsecase getPoliciesUsecase;
  // Session? session;

  PolicyNotifier({required this.getPoliciesUsecase});

  Future<void> getPolicies() async {
    response = Loading();
    notifyListeners();
    try {
      Map<String, String> params = {};
      params["o"]="1";
      params["p1"]="2024";

      List<Policy> data = await getPoliciesUsecase.call(employeeID: 2,org: 1);
      response = Success(data: data);
    } on Exception catch (e) {
      response = Error(exception: e);
    }

    notifyListeners();
  }

  @override
  Response<List<Policy>>? response;
}

class PayperiodNotifier extends ResponseNotifier<List<PayPeriod>> {
  final GetPayPeriodUsecase getPayPeriodUsecase;
  // Session? session;

  PayperiodNotifier({required this.getPayPeriodUsecase});

  Future<void> getEvents() async {
    response = Loading();
    notifyListeners();
    try {
      Map<String, String> params = {};
      params["o"]="1";
      params["p1"]="2024";

      List<PayPeriod> data = await getPayPeriodUsecase.call(orgId: 1);
      response = Success(data: data);
    } on Exception catch (e) {
      response = Error(exception: e);
    }

    notifyListeners();
  }

  @override
  Response<List<PayPeriod>>? response;
}