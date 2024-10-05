class ListItemModel {
  int? iD;
  String? firstName;
  String? lastName;
  int? rollNo;
  String? branch;
  String? city;
  String? mobileNo;
  String? gender;
  String? salary;
  String? designation;

  ListItemModel(
      {this.iD,
        this.firstName,
        this.lastName,
        this.rollNo,
        this.branch,
        this.city,
        this.mobileNo,
        this.gender,
        this.salary,
        this.designation});

  ListItemModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    rollNo = json['RollNo'];
    branch = json['Branch'];
    city = json['City'];
    mobileNo = json['MobileNo'];
    gender = json['Gender'];
    salary = json['Salary'];
    designation = json['Designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['RollNo'] = this.rollNo;
    data['Branch'] = this.branch;
    data['City'] = this.city;
    data['MobileNo'] = this.mobileNo;
    data['Gender'] = this.gender;
    data['Salary'] = this.salary;
    data['Designation'] = this.designation;
    return data;
  }
}
