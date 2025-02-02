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
    repository = DashboardRepositoryImpl(
        dashboardDataSource: DashboardRemoteDataSource());
    announcementNotifier = AnnouncementNotifier(
        getAnnouncementsUsecase:
            GetAnnouncementsUsecase(repository: repository));
    eventsNotifier = EventsNotifier(
        getEventsUsecase: GetEventsUsecase(repository: repository));
    leaveBalanceNotifier = LeaveBalanceNotifier(
        getLeaveBalancesUsecase:
            GetLeaveBalancesUsecase(repository: repository));
    policyNotifier = PolicyNotifier(
        getPoliciesUsecase: GetPoliciesUsecase(repository: repository));
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              LayoutBuilder(builder: (context, constraint) {
                return Row(
                  children: [
                    SizedBox(
                      width: (constraint.maxWidth / 2) - 8,
                      child: ResponseListenableBuilder(
                        listenable: announcementNotifier,
                        onResponseSuccess: (context, data) => {},
                        onResponseError: (context, exception) => {},
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.fromBorderSide(BorderSide(
                                        color: Color(0XFF59CEA1), width: 2)),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white),
                                child: ListTile(
                                  leading: Container(
                                    width: 26,
                                    height: 21,
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
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child:
                                      (announcementNotifier.response is Success)
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
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      width: (constraint.maxWidth / 2) - 8,
                      child: ResponseListenableBuilder(
                        listenable: announcementNotifier,
                        onResponseSuccess: (context, data) => {},
                        onResponseError: (context, exception) => {},
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.fromBorderSide(BorderSide(
                                        color: Color(0XFF59CEA1), width: 2)),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white),
                                child: ListTile(
                                  leading: Container(
                                    width: 26,
                                    height: 21,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0XFFBFECDB),
                                    ),
                                    child: Image.asset('assets/images/bell.png'),
                                  ),
                                  title: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Notifcations",
                                      style: GoogleFonts.manrope(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child:
                                      (announcementNotifier.response is Success)
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
                    )
                  ],
                );
              }),
              SizedBox(height: 8),
              // Welcome Card
              AspectRatio(
                aspectRatio: 397 / 175,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0XFF59CEA1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
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
                            Column( 
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,                                                           
                              children: [                            
                                Image.asset(
                                  'assets/images/profile.png',
                                  scale: 175 / 133,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(                                                        
                        mainAxisSize: MainAxisSize.max,
                        children: [                            
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                8.0, 0, 8.0, 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.fromBorderSide(
                                        BorderSide(
                                            color: Colors.white,
                                            width: 2)),
                                    borderRadius:
                                        BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [                                    
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text: "Supervisor:",
                                          style: GoogleFonts.manrope(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: "Saad Ali",
                                          style: GoogleFonts.manrope(
                                              fontSize: 14,
                                              color: Colors.black),
                                        )
                                      ])),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text: "Reportee:",
                                          style: GoogleFonts.manrope(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: "Saif Khan",
                                          style: GoogleFonts.manrope(
                                              fontSize: 14,
                                              color: Colors.black),
                                        )
                                      ])),
                                      TextButton(                                                                            
                                        style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                                        onPressed: () => {},                                                                            
                                        child: Text(
                                          "All Reportees>",
                                          style: GoogleFonts.manrope(
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.w800,
                                                  color: Colors.white)
                                              .copyWith(
                                                  decorationColor:
                                                      Colors.white,
                                                  decoration:
                                                      TextDecoration
                                                          .underline,
                                                  color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
          
              // Announcements Card
              LayoutBuilder(builder: (context, constraint) {
                return Row(
                  children: [
                    SizedBox(
                      width: (constraint.maxWidth / 2) - 8,
                      child: ResponseListenableBuilder(
                        listenable: announcementNotifier,
                        onResponseSuccess: (context, data) => {},
                        onResponseError: (context, exception) => {},
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.fromBorderSide(BorderSide(
                                        color: Color(0XFF59CEA1), width: 2)),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0, vertical: 8.0),
                                  child: ListTile(
                                    title: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Performance\nHistory",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.manrope(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      width: (constraint.maxWidth / 2) - 8,
                      child: ResponseListenableBuilder(
                        listenable: announcementNotifier,
                        onResponseSuccess: (context, data) => {},
                        onResponseError: (context, exception) => {},
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.fromBorderSide(BorderSide(
                                        color: Color(0XFF59CEA1), width: 2)),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0, vertical: 8.0),
                                  child: ListTile(
                                    title: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Training\nHistory",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.manrope(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }),
              SizedBox(
                height: 16,
              ),
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
                                    fontSize: 14.0, fontWeight: FontWeight.w900),
                              ),
                              SizedBox(height: 8),
                              LayoutBuilder(builder: (context, constraints) {
                                return SizedBox(
                                    height:
                                        constraints.maxWidth * (188 / 191) - 56,
                                    child: ListView.builder(
                                        itemCount: events.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                color: Color(0XFFE2D3FF),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(4),
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
                                        }));
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
                                    fontSize: 14.0, fontWeight: FontWeight.w900),
                              ),
                              SizedBox(height: 8),
                              Row(children: [
                                Expanded(
                                  child: Text(
                                    "Type",
                                    style: GoogleFonts.manrope(fontSize: 11, fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Total",
                                    style: GoogleFonts.manrope(fontSize: 11, fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Avail",
                                    style: GoogleFonts.manrope(fontSize: 11, fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Bal.",
                                    style: GoogleFonts.manrope(fontSize: 11, fontWeight: FontWeight.w600),
                                  ),
                                )
                              ]),
                              SizedBox(height: 8),
                              LayoutBuilder(builder: (context, constrints) {
                                return SizedBox(
                                  height: constrints.maxWidth * (188 / 191) - 82,
                                  child: ListView.builder(
                                      itemCount: leaveBalances.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        var data = leaveBalances[index];
                                        return Row(children: [
                                          Expanded(
                                            child: Text(
                                              data.name,
                                              style: GoogleFonts.manrope(
                                                  fontSize: 11, fontWeight: FontWeight.w200),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              data.total.toString(),
                                              style: GoogleFonts.manrope(
                                                  fontSize: 11, fontWeight: FontWeight.w200),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              data.availed.toString(),
                                              style: GoogleFonts.manrope(
                                                  fontSize: 11, fontWeight: FontWeight.w200),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(data.balance.toString(),style: GoogleFonts.manrope(
                                                  fontSize: 11, fontWeight: FontWeight.w200)),
                                          )
                                        ]);
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
                                    fontSize: 14.0, fontWeight: FontWeight.w900),
                              ),
                              SizedBox(height: 8),
                              Row(children: [
                                Expanded(
                                  child: Text(
                                    "Name",
                                    style: GoogleFonts.manrope(fontSize: 11, fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "Date From",
                                      style: GoogleFonts.manrope(fontSize: 11, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "Date To",
                                      style: GoogleFonts.manrope(fontSize: 11, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ]),
                              SizedBox(height: 8),
                              LayoutBuilder(builder: (context, constrints) {
                                return SizedBox(
                                  height: constrints.maxWidth * (188 / 191) - 82,
                                  child: ListView.builder(
                                      itemCount: policies.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        var data = policies[index];
                                        return Row(children: [
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                data.policyName,
                                                style: GoogleFonts.manrope(
                                                    fontSize: 11,fontWeight: FontWeight.w200),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                data.dateFrom.toSlashedDDMMYYY(),
                                                style: GoogleFonts.manrope(
                                                    fontSize: 11,fontWeight: FontWeight.w200),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                data.dateTo.toSlashedDDMMYYY(),
                                                style: GoogleFonts.manrope(
                                                    fontSize: 11),
                                              ),
                                            ),
                                          )
                                        ]);
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
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "Salary Slip",
                                style: GoogleFonts.manrope(
                                    fontSize: 14.0, fontWeight: FontWeight.w900),
                              ),
                            ),
                            SizedBox(height: 8),
                            Expanded(
                                child: SizedBox(
                                  width: double.maxFinite,
                                  child: Image.network(
                                                                "https://yoonek.thzeal.com/ZealERPTest/assets/images/salarySlip.jpg",
                                                                
                                                              ),
                                )),
                            TextButton(
                              onPressed: () {},
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "View Image",
                                  style: TextStyle(color: Colors.blue),
                                ),
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
