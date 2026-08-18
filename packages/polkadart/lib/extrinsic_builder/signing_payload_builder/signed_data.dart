part of extrinsic_builder;

/// Result of signing operation
class SignedData {
  /// The signer's public key
  final Uint8List signer;

  /// The signature bytes
  final Uint8List signature;

  /// Extension values (for the extrinsic)
  final Map<String, dynamic> extensions;

  /// Additional signed data (not included in extrinsic)
  final Map<String, dynamic> additionalSigned;

  /// The original call data
  final Uint8List callData;

  /// The actual payload that was signed (for reference/debugging)
  final Uint8List signingPayload;

  /// SCALE signature variant. Never inferred from [signature] length.
  final SignatureType signatureType;

  const SignedData({
    required this.signer,
    required this.signature,
    required this.signatureType,
    required this.extensions,
    required this.additionalSigned,
    required this.callData,
    required this.signingPayload,
  });

  /// Was the signing payload hashed?
  bool get wasPayloadHashed => signingPayload.length == 32;

  /// Get hex representation of signature
  String get signatureHex =>
      '0x${signature.map((b) => b.toRadixString(16).padLeft(2, '0')).join()}';

  /// Get hex representation of signer
  String get signerHex => '0x${signer.map((b) => b.toRadixString(16).padLeft(2, '0')).join()}';

  /// Create a summary for debugging
  Map<String, dynamic> summary() {
    return {
      'signer': signerHex,
      'signatureType': signatureType.toString(),
      'signatureLength': signature.length,
      'wasPayloadHashed': wasPayloadHashed,
      'payloadSize': signingPayload.length,
      'extensionCount': extensions.length,
      'additionalSignedCount': additionalSigned.length,
    };
  }
}
