class Transaction_model {
  String profilename, name, payment, transaction, datetime;
  Transaction_model(this.profilename, this.name, this.payment, this.transaction,
      this.datetime);
}

class Transation_data {
  static var transationlist = [
    Transaction_model(
        'WS', 'Will Smith', 'Cash', '+ ₹ 1,560', 'March 28, 2024 at 10:28 AM'),
    Transaction_model(
        'AC', 'Aman Chhimpa', 'UPI', '+ ₹ 5,560', 'June 28, 2024 at 10:28 AM'),
    // Transaction_model('MB', 'Mandeep Batesar', 'Cash', '+ ₹ 2,560',
    //     'June 28, 2024 at 10:28 AM'),
    // Transaction_model('SB', 'Sandeep Batesar', 'UPI', '+ ₹ 2,560',
    //     'June 28, 2024 at 10:28 AM'),
    // Transaction_model(
    //     'NB', 'Nikhal Borra', 'Cash', '+ ₹ 2,560', 'June 28, 2024 at 10:28 AM'),
  ];
  static var aprilist = [
    Transaction_model(
        'WS', 'Will Smith', 'Cash', '+ ₹ 1,560', 'March 28, 2024 at 10:28 AM'),
    Transaction_model(
        'AC', 'Aman Chhimpa', 'UPI', '+ ₹ 5,560', 'June 28, 2024 at 10:28 AM'),
    Transaction_model('MB', 'Mandeep Batesar', 'Cash', '+ ₹ 2,560',
        'June 28, 2024 at 10:28 AM'),
    Transaction_model('SB', 'Sandeep Batesar', 'UPI', '+ ₹ 2,560',
        'June 28, 2024 at 10:28 AM'),
    Transaction_model(
        'NB', 'Nikhal Borra', 'Cash', '+ ₹ 2,560', 'June 28, 2024 at 10:28 AM'),
  ];
}
