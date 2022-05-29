class DashboardModel {
  int? totalTest;
  int? pendingTest;
  int? notificationCount;
  int? todayTest;
  int? todayHomeSampleTest;

  DashboardModel(
      {this.totalTest,
      this.pendingTest,
      this.notificationCount,
      this.todayTest,
      this.todayHomeSampleTest});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    totalTest = json['totalTest'];
    pendingTest = json['pendingTest'];
    notificationCount = json['notificationCount'];
    todayTest = json['todayTest'];
    todayHomeSampleTest = json['todayHomeSampleTest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalTest'] = this.totalTest;
    data['pendingTest'] = this.pendingTest;
    data['notificationCount'] = this.notificationCount;
    data['todayTest'] = this.todayTest;
    data['todayHomeSampleTest'] = this.todayHomeSampleTest;
    return data;
  }
}
