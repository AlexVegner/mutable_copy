mixin Mutable<T> {
  T copy();
}

mixin CopyWithMutable<T, M extends Mutable<T>> {
  M mutableCopy();

  T copy(UpdateWith<M> updateWith) {
    return updateWith(mutableCopy()).copy();
  }
}

typedef UpdateWith<T> = T Function(T o);
