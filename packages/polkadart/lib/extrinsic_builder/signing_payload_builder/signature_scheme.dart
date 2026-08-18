part of extrinsic_builder;

/// How a chain encodes the signature field of a signed extrinsic.
///
/// Built-in Substrate schemes map to [SignatureType.ed25519] / [sr25519] /
/// [ecdsa]. A chain with a different signature enum returns
/// [SignatureType.custom].
abstract class ExtrinsicSignatureScheme {
  const ExtrinsicSignatureScheme();

  SignatureType get signatureType;
}

/// Substrate `MultiSignature::Ed25519`.
class Ed25519SignatureScheme extends ExtrinsicSignatureScheme {
  const Ed25519SignatureScheme();

  @override
  SignatureType get signatureType => SignatureType.ed25519;
}

/// Substrate `MultiSignature::Sr25519`.
class Sr25519SignatureScheme extends ExtrinsicSignatureScheme {
  const Sr25519SignatureScheme();

  @override
  SignatureType get signatureType => SignatureType.sr25519;
}

/// Substrate `MultiSignature::Ecdsa`.
class EcdsaSignatureScheme extends ExtrinsicSignatureScheme {
  const EcdsaSignatureScheme();

  @override
  SignatureType get signatureType => SignatureType.ecdsa;
}
