part of 'employee_manager_bloc.dart';

@immutable
sealed class EmployeeManagerEvent {}

class FetchEmployeeList extends EmployeeManagerEvent {
  final List<ListItemModel> listItemModel;

  FetchEmployeeList({required this.listItemModel});
}

class AddEmployee extends EmployeeManagerEvent {
  final ListItemModel employeeItem;

  AddEmployee(this.employeeItem);
}

class UpdateEmployee extends EmployeeManagerEvent {
  final ListItemModel alarmItem;
  final int index;

  UpdateEmployee(this.alarmItem, this.index);
}

class DeleteEmployee extends EmployeeManagerEvent {
  final int index;

  DeleteEmployee(this.index);
}
