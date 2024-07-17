class TodayMilkModel {
  String date, week, fat, rate, Qty, totalrupess;
  TodayMilkModel(
      this.date, this.week, this.fat, this.rate, this.Qty, this.totalrupess);
}

class TodayMilkHelp {
  static var dailymilkdetailslist = [
    TodayMilkModel('01', 'Mon', '60%', '₹58', '2 L', '₹ 116'),
    TodayMilkModel('02', 'Tue', '30%', '₹78', '3 L', '₹ 216'),
    TodayMilkModel('03', 'Wed', '10%', '₹18', '1 L', '₹ 168'),
    TodayMilkModel('04', 'Thu', '70%', '₹68', '7 L', '₹ 616'),
    TodayMilkModel('05', 'Fri', '60%', '₹68', '4 L', '₹ 216'),
    TodayMilkModel('06', 'Sat', '80%', '85', '5 L', '₹ 716'),
    TodayMilkModel('07', 'San', '20%', '₹38', '2 L', '₹ 116'),
  ];
}
