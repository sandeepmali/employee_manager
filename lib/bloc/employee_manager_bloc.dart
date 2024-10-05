import 'package:bloc/bloc.dart';
import 'package:employee_manager/connection_manager.dart';
import 'package:employee_manager/model/listItem.dart';
import 'package:employee_manager/model/list_item_model.dart';
import 'package:meta/meta.dart';

part 'employee_manager_event.dart';

part 'employee_manager_state.dart';

class EmployeeManagerBloc
    extends Bloc<EmployeeManagerEvent, EmployeeManagerState> {
  List<ListItemModel> employeeList = [];
  ListItemModel listItemModel = ListItemModel();

  Map<String, dynamic> data = {};

  EmployeeManagerBloc() : super(ListInitial()) {
    on<EmployeeManagerEvent>((event, emit) async {
      emit(ListLoading());
      try {
        await Future.delayed(Duration(seconds: 2));

      } catch (e) {
        print(e.toString());
        emit(ListError("Failed to fetch list items"));
      }
    });
    on<FetchEmployeeList>((event, emit) {
      emit(ListLoaded(event.listItemModel));
    });
    on<AddEmployee>((event, emit) {
      employeeList.add(event.employeeItem);
      emit(ListLoaded(employeeList));
    });

    on<DeleteEmployee>((event, emit) {
      if (employeeList.length > 0) {
        employeeList.removeAt(event.index); // Remove the item by index
        emit(ListLoaded(employeeList)); // Emit the updated list
      } else {
        emit(ListError("Failed to fetch list items"));
      }
    });
  }
}
