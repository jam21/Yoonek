import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yoonek/app/ui/dashboard/dashboard_controllers.dart';
import 'package:yoonek/app/ui/widgets.dart';
import 'package:yoonek/data/datasource/dashboard.dart';
import 'package:yoonek/data/network/apis.dart';
import 'package:yoonek/domain/entities/event.dart';
import 'package:yoonek/domain/entities/leave_balance.dart';
import 'package:yoonek/domain/entities/policy.dart';
import 'package:yoonek/domain/entities/session.dart';
import 'package:yoonek/domain/repositories/dashboard.dart';
import 'package:yoonek/domain/usecases/dashboard.dart';
import 'package:yoonek/app/extensions.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardScreen> {
  late DashboardRepository repository;
  late AnnouncementNotifier announcementNotifier;
  late LeaveBalanceNotifier leaveBalanceNotifier;
  late PolicyNotifier policyNotifier;
  late EventsNotifier eventsNotifier;

  List<Event> events = [];
  List<LeaveBalance> leaveBalances = [];
  List<Policy> policies = [];

@override
  void initState() {
    super.initState();
    repository = DashboardRepositoryImpl(dashboardDataSource: DashboardRemoteDataSource());
    announcementNotifier = AnnouncementNotifier(getAnnouncementsUsecase: GetAnnouncementsUsecase(repository: repository));
    eventsNotifier = EventsNotifier(getEventsUsecase: GetEventsUsecase(repository: repository));
    leaveBalanceNotifier = LeaveBalanceNotifier(getLeaveBalancesUsecase: GetLeaveBalancesUsecase(repository: repository));
    policyNotifier = PolicyNotifier(getPoliciesUsecase: GetPoliciesUsecase(repository: repository));
    announcementNotifier.getAnnouncements();
    eventsNotifier.getEvents();
    leaveBalanceNotifier.getLeavebalances();
    policyNotifier.getPolicies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0XFFE7EBEE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        child: Column(
          children: [Text("Coming Soon")],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Welcome Card
              AspectRatio(
                aspectRatio: 397 / 175,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0XFF59CEA1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(
                                    "Hello, ${Session.current().userName}",
                                    style: GoogleFonts.manrope(fontSize: 14)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0XFF12A76E),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Text(
                                    "Welcome back",
                                    style: GoogleFonts.manrope(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset('assets/images/profile.png')),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Announcements Card
              ResponseListenableBuilder(
                listenable: announcementNotifier,
                onResponseSuccess: (context, data) => {},
                onResponseError: (context, exception) => {},
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.fromBorderSide(
                                BorderSide(color: Color(0XFF59CEA1), width: 1)),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ListTile(
                            leading: Container(
                              width: 53,
                              height: 53,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0XFFBFECDB),
                              ),
                              child: Image.asset('assets/images/bell.png'),
                            ),
                            title: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Announcements",
                                style: GoogleFonts.manrope(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: (announcementNotifier.response is Success)
                              ? Text(
                                  "${(announcementNotifier.response as Success).data.length}",
                                  style: GoogleFonts.manrope(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              : Text(
                                  "0",
                                  style: GoogleFonts.manrope(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Event and Leave Section
              Row(
                children: [
                  // My Events
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 191 / 188,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0XFFD3C2F4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ResponseListenableBuilder(
                          listenable: eventsNotifier,
                          onResponseSuccess: (context, data) => {
                            setState(() {
                              events = data as List<Event>;
                            })
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8),
                              Text(
                                "My Events",
                                style: GoogleFonts.manrope(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(height: 8),
                              LayoutBuilder(builder: (context, constraints) {
                                return SizedBox(
                                  height:
                                      constraints.maxWidth * (188 / 191) - 56,
                                  child: ListView.builder(
                                          itemCount: events
                                              .length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color: Color(0XFFE2D3FF),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  child: Center(
                                                      child: Text(
                                                    (eventsNotifier.response
                                                            as Success)
                                                        .data[index]
                                                        .eventName,
                                                    style: GoogleFonts.manrope(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )),
                                                ),
                                              ),
                                            );
                                          })
                                      
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  // My Leave
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 191 / 188,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0XFFEBDBD0),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ResponseListenableBuilder(
                          listenable: leaveBalanceNotifier,
                          onResponseSuccess: (context, data) => {
                            setState(() {
                              leaveBalances = data as List<LeaveBalance>;
                            })
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                SizedBox(height: 8),
                                Text(
                                  "My Leave",
                                  style: GoogleFonts.manrope(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w900),
                                ),
                              SizedBox(height: 8),
                              Row(children: [Expanded(child: Text("Type", style: GoogleFonts.manrope(fontSize: 11),),),Expanded(child: Text("Total", style: GoogleFonts.manrope(fontSize: 11),),),Expanded(child: Text("Avail", style: GoogleFonts.manrope(fontSize: 11),),),Expanded(child: Text("Bal.", style: GoogleFonts.manrope(fontSize: 11),),)]),
                              SizedBox(height: 8),
                              LayoutBuilder(builder: (context, constrints){
                                return SizedBox(
                                  height: constrints.maxWidth*(188/191)-82,
                                  child: ListView.builder(itemCount: leaveBalances.length, shrinkWrap: true, itemBuilder: (context, index){
                                    var data = leaveBalances[index];
                                    return Row(children: [Expanded(child: Text(data.name, style: GoogleFonts.manrope(fontSize: 11),),),Expanded(child: Text(data.total.toString(), style: GoogleFonts.manrope(fontSize: 11),),),Expanded(child: Text(data.availed.toString(), style: GoogleFonts.manrope(fontSize: 11),),),Expanded(child: Text(data.balance.toString()),)]);
                                  }),
                                );
                              }),                                                      
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),

              // Policies and Salary Slip Section
              Row(
                children: [
                  // Policies
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 191 / 188,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0XFFD0E7CD),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ResponseListenableBuilder(
                          listenable: policyNotifier,
                          onResponseSuccess: (context, data) => {
                            setState(() {
                              policies = data as List<Policy>;
                            })
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8),
                              Text(
                                "Policies",
                                style: GoogleFonts.manrope(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(height: 8),
                              Row(children: [Expanded(child: Text("Name", style: GoogleFonts.manrope(fontSize: 11),),),Expanded(child: Text("Date From", style: GoogleFonts.manrope(fontSize: 11),),),Expanded(child: Text("Date To", style: GoogleFonts.manrope(fontSize: 11),),)]),
                               SizedBox(height: 8),
                                LayoutBuilder(builder: (context, constrints){
                                  return SizedBox(
                                    height: constrints.maxWidth*(188/191)-82,
                                    child: ListView.builder(itemCount: policies.length, shrinkWrap: true, itemBuilder: (context, index){
                                      var data = policies[index];
                                      return Row(children: [Expanded(child: Text(data.policyName, style: GoogleFonts.manrope(fontSize: 11),),),Expanded(child: Text(data.dateFrom.toString(), style: GoogleFonts.manrope(fontSize: 11),),),Expanded(child: Text(data.dateTo.toString(), style: GoogleFonts.manrope(fontSize: 11),),)]);
                                    }),
                                  );
                                }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  // Salary Slip
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 191 / 188,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0XFFD5DFE7),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0),
                              child: Text(
                                "Salary Slip",
                                style: GoogleFonts.manrope(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            SizedBox(height: 8),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "View Image",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: "Help"),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Account"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        currentIndex: 2,
        onTap: (index) {},
      ),
    );
  }
}