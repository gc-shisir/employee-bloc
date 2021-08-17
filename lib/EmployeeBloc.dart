// TODO: imports
import 'dart:async';
import './Employee.dart';

class EmployeeBloc {
  // sink to add in pipe/blackbox
  // stream to get data from pipe/blackbox
  // by pipe, we mean data flow

  // TODO: list of employees

  List<Employee> _employeeList = [
    Employee(1, "Employee 1", 1000.0),
    Employee(2, "Employee 2", 2000.0),
    Employee(3, "Employee 3", 3000.0),
    Employee(4, "Employee 4", 4000.0),
    Employee(5, "Employee 5", 5000.0),
  ];

  // TODO: Stream Controllers
  final _employeeListStreamController = StreamController<List<Employee>>();

  // for increment and decrement
  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

  // TODO: Stream sink getter
  // getters
  Stream<List<Employee>> get employeeListStream =>
      _employeeListStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink =>
      _employeeListStreamController.sink;

  StreamSink<Employee> get employeeSalaryIncrement =>
      _employeeSalaryIncrementStreamController.sink;

  StreamSink<Employee> get employeeSalaryDecrement =>
      _employeeSalaryDecrementStreamController.sink;

  // TODO: Constructor - add data; listen to changes
  EmployeeBloc() {
    // constructor and add data
    _employeeListStreamController.add(_employeeList);

    // listen to changes
    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);

    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
  }

  // TODO: Core functions
  _incrementSalary(Employee employee) {
    double salary = employee.salary;
    double incrementedSalary = salary * 20 / 100;

    _employeeList[employee.id - 1].salary = salary + incrementedSalary;

    // add to sink
    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee) {
    double salary = employee.salary;
    double decrementedSalary = salary * 20 / 100;

    _employeeList[employee.id - 1].salary = salary - decrementedSalary;

    // add to sink
    employeeListSink.add(_employeeList);
  }

  // TODO: Dispose
  void dispose() {
    _employeeSalaryIncrementStreamController.close();
    _employeeSalaryDecrementStreamController.close();
    _employeeListStreamController.close();
  }
}
