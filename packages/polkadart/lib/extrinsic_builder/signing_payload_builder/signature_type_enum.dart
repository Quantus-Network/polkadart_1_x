part of extrinsic_builder;

/// SCALE signature-enum variant.
///
/// The built-in values match Substrate `MultiSignature`. A chain whose
/// signature enum is not that type (Quantus Dilithium, etc.) passes
/// [SignatureType.custom] with its own variant byte.
class SignatureType {
  /// SCALE index written in front of the signature blob.
  final int type;

  /// True when this value was constructed with [SignatureType.custom].
  final bool isCustom;

  const SignatureType._(this.type, {this.isCustom = false});

  static const ed25519 = SignatureType._(0);
  static const sr25519 = SignatureType._(1);
  static const ecdsa = SignatureType._(2);

  /// A variant polkadart does not name. [type] is written as-is.
  const SignatureType.custom(this.type) : isCustom = true, assert(type >= 0 && type <= 255);

  @override
  bool operator ==(Object other) =>
      other is SignatureType && other.type == type && other.isCustom == isCustom;

  @override
  int get hashCode => Object.hash(type, isCustom);

  @override
  String toString() {
    if (isCustom) return 'SignatureType.custom($type)';
    return switch (type) {
      0 => 'SignatureType.ed25519',
      1 => 'SignatureType.sr25519',
      2 => 'SignatureType.ecdsa',
      _ => 'SignatureType.custom($type)',
    };
  }
}
