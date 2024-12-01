import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

var events = [
  "Industrial Expo 2024",
  "PC Conference 2024",
  "Zeal Annual Trip 2024",
  "Zeal Annual Trip 2024",
  "Zeal Annual Trip 2024",
  "Zeal Annual Trip 2024",
  "Zeal Annual Trip 2024",
  "Zeal Annual Trip 2024",
  "Zeal Annual Trip 2024",
  "Zeal Annual Trip 2024",
  "Zeal Annual Trip 2024",
  "Zeal Annual Trip 2024",
  "Zeal Annual Trip 2024",
  "Zeal Annual Trip 2024",
];

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
                                child: Text("Hello, Steven",
                                    style: GoogleFonts.manrope(fontSize: 18)),
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
                                        fontSize: 18,
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
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.fromBorderSide(
                              BorderSide(color: Color(0XFF59CEA1), width: 2)),
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
                                  fontSize: 18, fontWeight: FontWeight.bold),
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
                        child: Text(
                          "3",
                          style: GoogleFonts.manrope(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16),
                            Text(
                              "My Events",
                              style: GoogleFonts.manrope(
                                  fontSize: 18.0, fontWeight: FontWeight.w900),
                            ),
                            SizedBox(height: 8),
                            LayoutBuilder(builder: (context, constraints) {
                              return SizedBox(
                                height: constraints.maxWidth * (191 / 188) - 65,
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
                                            child: Center(child: Text(events[index], style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w600),)),
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 8.0),
                              child: Text(
                                "My Leave",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 8),
                            DataTable(
                              columns: [
                                DataColumn(label: Text('Type')),
                                DataColumn(label: Text('Total')),
                                DataColumn(label: Text('Avail.')),
                                DataColumn(label: Text('Bal.')),
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text('Annual')),
                                  DataCell(Text('20.0')),
                                  DataCell(Text('4.0')),
                                  DataCell(Text('16.0')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Hajj')),
                                  DataCell(Text('30.0')),
                                  DataCell(Text('0.0')),
                                  DataCell(Text('30.0')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Sick')),
                                  DataCell(Text('8.0')),
                                  DataCell(Text('2.0')),
                                  DataCell(Text('6.0')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Casual')),
                                  DataCell(Text('10.0')),
                                  DataCell(Text('0.0')),
                                  DataCell(Text('10.0')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Emergency')),
                                  DataCell(Text('5.0')),
                                  DataCell(Text('1.0')),
                                  DataCell(Text('4.0')),
                                ]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 8.0),
                              child: Text(
                                "Policies",
                                style: GoogleFonts.manrope(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            SizedBox(height: 8),
                            for (String policy in [
                              "Travel Policy   29/12/2021 - 15/02/2024",
                              "Leave Policy    29/12/2021 - 15/02/2024",
                              "Leave Policy    29/12/2021 - 15/02/2024",
                              "Travel Policy   29/12/2021 - 15/02/2024",
                            ])
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text(policy),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
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
                                  vertical: 16.0, horizontal: 8.0),
                              child: Text(
                                "Salary Slip",
                                style: GoogleFonts.manrope(
                                    fontSize: 15.0,
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
