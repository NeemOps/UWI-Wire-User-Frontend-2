import 'dart:typed_data';

import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3dart/crypto.dart';

class WCCredentials extends CustomTransactionSender {
  WCCredentials({required this.provider});

  final EthereumWalletConnectProvider provider;

  @override
  Future<String> sendTransaction(Transaction transaction) async {
    String hash = await provider.sendTransaction(
      from: transaction.from!.hex,
      to: transaction.to?.hex,
      data: transaction.data,
      gas: transaction.maxGas,
      gasPrice: transaction.gasPrice?.getInWei,
      value: transaction.value?.getInWei,
      nonce: transaction.nonce,
    );

    return hash;
  }

  @override
  EthereumAddress get address => throw UnimplementedError();

  @override
  MsgSignature signToEcSignature(Uint8List payload,
      {int? chainId, bool isEIP1559 = false}) {
    throw UnimplementedError();
  }

  @override
  Future<MsgSignature> signToSignature(
    Uint8List payload, {
    int? chainId,
    bool isEIP1559 = false,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<EthereumAddress> extractAddress() {
    throw UnimplementedError();
  }
}
