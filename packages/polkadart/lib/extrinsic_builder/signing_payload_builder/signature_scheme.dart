part of extrinsic_builder;

/// How a chain encodes the signature field of a signed extrinsic.
///
/// Polkadart writes [variantIndex] and then [signature] as an opaque blob.
/// The blob length is not interpreted — post-quantum signatures of several
/// thousand bytes are written the same way as a 64-byte Sr25519 signature.
abstract class ExtrinsicSignatureScheme {
  const ExtrinsicSignatureScheme();

  /// SCALE enum index of the runtime signature type.
  int get variantIndex;
}

/// Substrate `MultiSignature::Ed25519`.
class Ed25519SignatureScheme extends ExtrinsicSignatureScheme {
  const Ed25519SignatureScheme();

  @override
  int get variantIndex => 0;
}

/// Substrate `MultiSignature::Sr25519`.
class Sr25519SignatureScheme extends ExtrinsicSignatureScheme {
  const Sr25519SignatureScheme();

  @override
  int get variantIndex => 1;
}

/// Substrate `MultiSignature::Ecdsa`.
class EcdsaSignatureScheme extends ExtrinsicSignatureScheme {
  const EcdsaSignatureScheme();

  @override
  int get variantIndex => 2;
}
