# mutable_copy

MutableCopy simplify copy of immutable object. Unlike CopyWith allow to set null value

## Usage

# Copy object with help mutable copy.

```dart
final e1 = Employee(
  fullName: 'Max Hatson',
  department: 'Mobile',
  team: 'Flutter',
);
final eMutable = e1.copy((o) => o..fullName = 'Bob Watson');
```

# Import

```dart
import 'package:mutable_copy/mutable_copy.dart';
```

# Sample object
```dart
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
```

# Mutable copy extension

```dart
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
```

# Mutable object

```dart
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
```

# Code generation
Code generator for [mutable_copy](https://pub.dev/packages/mutable_copy_generator/)

```dart
import 'package:mutable_copy/mutable_copy.dart';

@imutable
@MutableCopy
class Employee {
  final String fullName;
  final String department;
  final String team;

  Employee({
    this.fullName,
    this.department,
    this.team,
  });
}
```

# Generate code 
```
pub run build_runner build
```

