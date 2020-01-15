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

# Udage

`ExEvent` provide business logic and payload

`ExStore` provide ability to dispatch other events or get other states. 

```dart
class TestEvent extends ExEvent<TestState, TestBloc> {
  @override
  Stream<TestState> call(ExStore store, TestBloc bloc) async* {
    yield TestState(afterInitial: true);
  }
}
```

# Dispatch events

```dart
store.dispatch(TestEvent());
```
or
```dart
TestEvent().dispatch();
```

# Get state from ExStore

```dart
final store = ExStore.instance;
final testState = store.getState<TestState>();
```


# Subscribe event

```dart
final _subscribeSpecific = ExStore.instance.on<TestEvent>().listen((e) => print('do something'));
final _subscribeAny = ExStore.instance.on().listen((e) => print('do something'));
_subscribeSpecific.cancel();
_subscribeAny.cancel();
```

# Wait for event

```dart
await ExStore.instance.wait<TestEvent>();
```

# Reselect usage

[Reselect](https://pub.dev/packages/reselect) can be used if needed

```dart
final testStateSelector = (ExStore store) => store.getState<TestState>();

final afterInitialSelector = createSelector1(
    testStateSelector,
    (TestState testState) => testState.afterInitial,
);
```

## TODO

# Code generation
Implement code generator for `mutable_copy`

Like it done for copy_with [copy_with](https://www.oleksandrkirichenko.com/blog/dart-extensions/)

```dart
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

