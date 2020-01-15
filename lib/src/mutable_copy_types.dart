/// Mixin for mutable object
abstract class Mutable<T> {
  /// copy method create imutable object from mutable object
  T copy();
}

/// Mixin for mutable object
mixin CopyWithMutable<T, M extends Mutable<T>> {
  /// mutableCopy method create mutable object
  M mutableCopy();

  /// copy object with mutation
  T copy(UpdateWith<M> updateWith) {
    return updateWith(mutableCopy()).copy();
  }
}

/// UpdateWith
typedef UpdateWith<T> = T Function(T o);
