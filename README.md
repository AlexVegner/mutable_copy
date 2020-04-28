# mutable_copy

MutableCopy simplify copy of immutable object. Unlike CopyWith allow to set null value

## Usage

# Copy object with help mutable copy.

```dart
final e1 = Employe(
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
```

# Mutable copy extension

```dart
extension EmployeMutableCopyExt on Employe {
  EmployeMutable mutableCopy() {
    return EmployeMutable(
      fullName: fullName,
      department: department,
      team: team,
    );
  }

  Employe copy(UpdateWith<EmployeMutable> updateWith) {
    return updateWith(mutableCopy()).copy();
  }
}
```

# Mutable object

```dart
class EmployeMutable with Mutable<Employe> {
  String fullName;
  String department;
  String team;

  EmployeMutable({
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
```

# Code generation
Code generator for [mutable_copy](https://pub.dev/packages/mutable_copy_generator/)

```dart
import 'package:mutable_copy/mutable_copy.dart';

part 'employe.g.dart';

@imutable
@MutableCopy
class Employe {
  final String fullName;
  final String department;
  final String team;

  Employe({
    this.fullName,
    this.department,
    this.team,
  });
}
```

# Add dependencies
```
dependencies:
  ...
  mutable_copy: ^0.2.5

dev_dependencies:
  ...
  mutable_copy_generator: ^0.2.5
  build_runner: ^1.9.0
```

# Generate code
```
flutter pub run build_runner build
```

