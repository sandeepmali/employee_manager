part of 'employee_manager_bloc.dart';

@immutable
sealed class EmployeeManagerState {}

class ListInitial extends EmployeeManagerState {}

class ListLoading extends EmployeeManagerState {}

class ListAddItem extends EmployeeManagerState {}

class ListDeleteItem extends EmployeeManagerState {}

class ListUpdateItem extends EmployeeManagerState {}

class ListLoaded extends EmployeeManagerState {
  final List<ListItemModel> items;

  ListLoaded(this.items);
}

class ListError extends EmployeeManagerState {
  final String errorMessage;

  ListError(this.errorMessage);
}
