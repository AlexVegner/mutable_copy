import 'package:mutable_copy/mutable_copy.dart';

main() {
  final e1 = Employee(
    fullName: 'Max Hatson',
    department: 'Mobile',
    team: 'Flutter',
  );
  final eMutable = e1.copy((o) => o..fullName = 'Bob Watson');
  print(eMutable);
}

class Employee {
  final String fullName;
  final String department;
  final String team;

  Employee({
    this.fullName,
    this.department,
    this.team,
  });

  @override
  String toString() {
    return '$fullName, Department: $department, Team: $team';
  }
}

extension EmployeeMutableCopyExt on Employee {
  EmployeeMutable mutableCopy() {
    return EmployeeMutable(
      fullName: fullName,
      department: department,
      team: team,
    );
  }

  Employee copy(UpdateWith<EmployeeMutable> updateWith) {
    return updateWith(mutableCopy()).copy();
  }
}

class EmployeeMutable with Mutable<Employee> {
  String fullName;
  String department;
  String team;

  EmployeeMutable({
    this.fullName,
    this.department,
    this.team,
  });

  @override
  Employee copy() {
    return Employee(
      fullName: fullName,
      department: department,
      team: team,
    );
  }
}
