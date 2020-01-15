/// MutableCopy annotation for object
class MutableCopy {
  /// Default constructor
  const MutableCopy();
}

/// MutableCopyField annotation for object field
class MutableCopyField {
  final bool ignore;

  /// Default constructor
  const MutableCopyField({
    this.ignore = false,
  });
}
