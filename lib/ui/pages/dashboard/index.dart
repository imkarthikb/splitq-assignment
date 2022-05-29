import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:splitq/stores/dashboard.store.dart';
import 'package:splitq/stores/user.store.dart';
import 'package:splitq/ui/index.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final UserStore _userStore = Get.find<UserStore>();
  final DashboardStore _dashboardStore = Get.find<DashboardStore>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _dashboardStore.getDashboardData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: kColorPrimary,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Page 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.train,
              ),
              title: const Text('Page 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/bg_login.png',
                    width: 172,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 54, right: 16, bottom: 16, left: 16),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 16),
                        child: InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: SvgPicture.asset(
                              'assets/images/ic_hamburger.svg'),
                        ),
                      ),
                      Expanded(
                        child: _userStore.obx((user) {
                          String firstName = 'User';
                          if (user != null &&
                              user.userProfileDto != null &&
                              user.userProfileDto?.firstName != null &&
                              user.userProfileDto!.firstName!
                                  .trim()
                                  .isNotEmpty) {
                            firstName = user.userProfileDto!.firstName!;
                          }

                          return Text(
                            'Hi, $firstName',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          );
                        }),
                      ),
                      InkWell(
                        onTap: () {
                          _userStore.logout();
                        },
                        child: SvgPicture.asset(
                            'assets/images/ic_notification.svg'),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Image.asset('assets/images/img_home_banner.png'),
                ],
              ),
            ),
            _dashboardStore.obx(
              (data) => Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Row(
                          children: [
                            DashboardCard(
                              title: 'TOTAL TEST',
                              value: data != null && data.totalTest != null
                                  ? data.totalTest!.toString()
                                  : '',
                              valueColor: kColorBlack,
                              bgPath: 'assets/images/bg_total_test.png',
                              iconPath: 'assets/images/ic_calendar.svg',
                            ),
                            DashboardCard(
                              title: 'TODAY TOTAL TEST',
                              value: data != null && data.todayTest != null
                                  ? data.todayTest!.toString()
                                  : '',
                              valueColor: kColorBlack,
                              bgPath: 'assets/images/bg_today_total_test.png',
                              iconPath: 'assets/images/ic_like.svg',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Row(
                          children: [
                            DashboardCard(
                              title: 'TODAY HOME SAMPLE COLLECTION',
                              value: data != null &&
                                      data.todayHomeSampleTest != null
                                  ? data.todayHomeSampleTest!.toString()
                                  : '',
                              valueColor: kColorMustard,
                              bgPath:
                                  'assets/images/bg_home_collection_sample.png',
                              iconPath: 'assets/images/ic_profile.svg',
                            ),
                            DashboardCard(
                              title: 'TODAY PENDING TEST',
                              value: data != null && data.pendingTest != null
                                  ? data.pendingTest!.toString()
                                  : '',
                              valueColor: kColorPurple,
                              bgPath: 'assets/images/bg_today_pending_test.png',
                              iconPath: 'assets/images/ic_2_user.svg',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: kColorBorder),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Contact Us',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    color: kColorPurple,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: SvgPicture.asset(
                                      'assets/images/ic_message.svg'),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: kColorPurple,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: SvgPicture.asset(
                                      'assets/images/ic_calling.svg'),
                                )
                              ],
                            ),
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
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    Key? key,
    required this.bgPath,
    required this.iconPath,
    required this.title,
    required this.value,
    required this.valueColor,
  }) : super(key: key);

  final String bgPath;
  final String iconPath;
  final String title;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 170,
        margin: const EdgeInsets.only(right: 16, bottom: 16),
        decoration: BoxDecoration(
          border: Border.all(color: kColorBorder),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            // Positioned(
            //   top: 40,
            //   right: 0,
            //   left: 0,
            //   bottom: 0,
            //   child: Image.asset(
            //     bgPath,
            //     fit: BoxFit.scaleDown,
            //   ),
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(54.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(iconPath),
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right_outlined),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            value,
                            style: TextStyle(
                              color: valueColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
