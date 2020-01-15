import 'package:mutable_copy/mutable_copy.dart';
import 'package:test/test.dart';

void main() {
  test('test mutable copy', () {
    final e1 = Employee(
      fullName: 'Max Hatson',
      department: 'Mobile',
      team: 'Flutter',
    );
    // Copy with field copy
    final e2 = Employee(
      fullName: 'Bob Watson',
      department: e1.department,
      team: e1.team,
    );
    // copy with mytable copy
    final eMutable = e1.copy((o) => o..fullName = 'Bob Watson');

    expect(eMutable, e2);
  });
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

  bool operator ==(o) =>
      o is Employee &&
      fullName == o.fullName &&
      department == o.department &&
      team == o.team;
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
