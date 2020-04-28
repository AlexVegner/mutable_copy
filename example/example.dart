import 'package:mutable_copy/mutable_copy.dart';

main() {
  final e1 = Employe(
    fullName: 'Max Hatson',
    department: 'Mobile',
    team: 'Flutter',
  );
  final eMutable = e1.copy((o) => o..fullName = 'Bob Watson');
  print(eMutable);
}

class Employe {
  final String fullName;
  final String department;
  final String team;

  Employe({
    this.fullName,
    this.department,
    this.team,
  });

  @override
  String toString() {
    return '$fullName, Department: $department, Team: $team';
  }
}

extension EmployeeMutableCopyExt on Employe {
  EmployeeMutable mutableCopy() {
    return EmployeeMutable(
      fullName: fullName,
      department: department,
      team: team,
    );
  }

  Employe copy(UpdateWith<EmployeeMutable> updateWith) {
    return updateWith(mutableCopy()).copy();
  }
}

class EmployeeMutable with Mutable<Employe> {
  String fullName;
  String department;
  String team;

  EmployeeMutable({
    this.fullName,
    this.department,
    this.team,
  });

  @override
  Employe copy() {
    return Employe(
      fullName: fullName,
      department: department,
      team: team,
    );
  }
}
