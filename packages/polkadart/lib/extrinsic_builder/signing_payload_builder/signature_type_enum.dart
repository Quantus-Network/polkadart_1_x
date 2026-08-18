part of extrinsic_builder;

/// SCALE signature-enum variant written in front of the signature blob.
///
/// [ed25519], [sr25519], and [ecdsa] are Substrate `MultiSignature`.
/// Any other runtime enum uses [SignatureType.custom].
class SignatureType {
  final int type;

  const SignatureType._(this.type);

  static const ed25519 = SignatureType._(0);
  static const sr25519 = SignatureType._(1);
  static const ecdsa = SignatureType._(2);

  /// A variant this package does not name. [type] is the SCALE index.
  const SignatureType.custom(this.type) : assert(type >= 0 && type <= 255);

  @override
  bool operator ==(Object other) => other is SignatureType && other.type == type;

  @override
  int get hashCode => type.hashCode;

  @override
  String toString() => 'SignatureType($type)';
}
