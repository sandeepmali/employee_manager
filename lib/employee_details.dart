import 'package:employee_manager/bloc/employee_manager_bloc.dart';
import 'package:employee_manager/constant.dart';
import 'package:employee_manager/model/list_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mssql_connection/mssql_connection.dart';

class EmployeeDetailsPage extends StatefulWidget {
  final List<ListItemModel> listItemModel;

  const EmployeeDetailsPage({required this.listItemModel});

  @override
  State<EmployeeDetailsPage> createState() => _EmployeeDetailsPageState();
}

class _EmployeeDetailsPageState extends State<EmployeeDetailsPage> {
  final _key = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context) {
    context
        .read<EmployeeManagerBloc>()
        .add(FetchEmployeeList(listItemModel: widget.listItemModel));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(Constant.APP_NAME),
        actions: [
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: IconButton(
          //     icon: const Icon(Icons.alarm_add),
          //     onPressed: () {
          //     },
          //   ),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color(0xF7C4DFF)),
          child: BlocBuilder<EmployeeManagerBloc, EmployeeManagerState>(
            builder: (context, state) {
              if (state is ListLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ListLoaded && state.items.length > 0) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return Container(
                      height: 170,
                      child: Card(
                        color: Colors.white60,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Name : " + " ",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(item.firstName!,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          )),
                                      Text(
                                        "    Last Name : " + " ",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(item.lastName!,
                                          style: TextStyle(fontSize: 18.0)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Roll No : " + " ",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(item.rollNo!.toString(),
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          )),
                                      Text(
                                        "    Branch : " + " ",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(item.branch!,
                                          style: TextStyle(fontSize: 18.0)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "City : " + " ",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(item.city!,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          )),
                                      Text(
                                        "    Salary : " + " ",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(item.salary!,
                                          style: TextStyle(fontSize: 18.0)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Gender : " + " ",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(item.gender!,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          )),
                                      Text(
                                        "    Designation : " + " ",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(item.designation!,
                                          style: TextStyle(fontSize: 18.0)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Mobile : " + " ",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(item.mobileNo!,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (state is ListError) {
                return Center(
                    child: Text(
                  state.errorMessage,
                  style: TextStyle(fontSize: 30.0),
                ));
              } else {
                return Center(
                    child: Text(
                  "No Records Found",
                  style: TextStyle(fontSize: 30.0),
                ));
              }
            },
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => NextPage())));
            }),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NextPage extends StatelessWidget {
  NextPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerRollNo = TextEditingController();
  final TextEditingController _controlleBranch = TextEditingController();
  final TextEditingController _controllerCity = TextEditingController();
  final TextEditingController _controllerMobile = TextEditingController();
  final TextEditingController _controllerGender = TextEditingController();
  final TextEditingController _controllerSalary = TextEditingController();
  final TextEditingController _controllerDesignation = TextEditingController();

  showProgress(BuildContext context,
          [String alertMessage = "Fetching Data..."]) async =>
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox.square(
                        dimension: 35, child: CircularProgressIndicator()),
                    const SizedBox(width: 12),
                    Text(
                      alertMessage,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ));

  hideProgress(BuildContext context) {
    Navigator.pop(context);
  }

  Future<bool?> toastMessage(String message,
      {Color color = Colors.blueAccent}) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  execute(String writeQuery, BuildContext context) async {
    try {
      final _sqlConnection = MssqlConnection.getInstance();
      print(writeQuery);
      if (writeQuery.isEmpty) {
        toastMessage("Empty query", color: Colors.redAccent);
        return;
      }
      showProgress(context);
      var startTime = DateTime.now();
      var result = await _sqlConnection.writeData(writeQuery);
      var difference = DateTime.now().difference(startTime);
      // if (!mounted) return;
      hideProgress(context);
      print("Duration: ${DateTime.now().difference(startTime)} ");
      Navigator.pop(context);
      Navigator.pop(context);
      print(result.toString());
      toastMessage("Data Inserted successfully!!!!");
      // toastMessage(
      //     "Please check the console for data.\n Duration: $difference");
    } on PlatformException catch (e) {
      hideProgress(context);
      toastMessage(e.message ?? "", color: Colors.redAccent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Insert Details'),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Container(
            color: Colors.white60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: _controllerFirstName,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: _controllerLastName,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: _controllerRollNo,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Roll No',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: _controlleBranch,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Branch',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: _controllerCity,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: _controllerMobile,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Mobile No',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: _controllerGender,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: _controllerSalary,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Salary',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: _controllerDesignation,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: 'Designation',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FloatingActionButton(
            child: Icon(Icons.done),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Retrieve values from the controllers
                String firstName = _controllerFirstName.text;
                String lastName = _controllerLastName.text;
                String rollNo = _controllerRollNo.text;
                String branch = _controlleBranch.text;
                String city = _controllerCity.text;
                String mobile = _controllerMobile.text;
                String gender = _controllerGender.text;
                String salary = _controllerSalary.text;
                String designation = _controllerDesignation.text;
                String writeQuery = 'insert into' +
                    ' ' +
                    Constant.TABLE_NAME +
                    '(' +
                    Constant.iD +
                    ',' +
                    Constant.firstName +
                    ',' +
                    Constant.lastName +
                    ',' +
                    Constant.rollNo +
                    ',' +
                    Constant.branch +
                    ',' +
                    Constant.city +
                    ',' +
                    Constant.mobileNo +
                    ',' +
                    Constant.gender +
                    ',' +
                    Constant.salary +
                    ',' +
                    Constant.designation +
                    ')' +
                    ' ' +
                    'values' +
                    '(' +
                    '4' +
                    ",'" +
                    firstName +
                    "'" +
                    ",'" +
                    lastName +
                    "'" +
                    ",'" +
                    rollNo +
                    "'" +
                    ",'" +
                    branch +
                    "'" +
                    ",'" +
                    city +
                    "'" +
                    ",'" +
                    mobile +
                    "'" +
                    ",'" +
                    gender +
                    "'" +
                    ",'" +
                    salary +
                    "'" +
                    ",'" +
                    designation +
                    "'" ')' +
                    ';';
                print(writeQuery);
                execute(writeQuery, context);
              }
            }),
      ),
    );
  }
}
