import 'package:http/http.dart' as http;
import 'package:uwiwire_vendor/backend/web3/_wallet.dart';

import 'package:web3dart/web3dart.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:uwiwire_vendor/backend/web3/_contract.dart';
import 'package:uwiwire_vendor/backend/web3/_wc_credentials.dart';

class Transactions {
  final Web3Client web3Client = Web3Client(
    'https://cibc-mainnet.sundaebytes.com',
    http.Client(),
  );

  final FacacadeContract contract = FacacadeContract();

  static late String sender;
  static late WCCredentials wcCredentials;
  static late SessionStatus sessionStatus;
  static late WalletConnect walletConnector;
  static late EthereumWalletConnectProvider provider;

  void initializeProvider(Web3Wallet wallet) {
    sessionStatus = wallet.getSession();
    walletConnector = wallet.getConnector();
    sender = wallet.getSession().accounts[0];

    provider = wallet.getProvider();
    wcCredentials = WCCredentials(provider: provider);
  }

  Future<void> transferTokens(String receiver, double amount) async {
    WCCredentials wcCredentials = WCCredentials(
      provider: provider,
    );

    final receiverAddr = EthereumAddress.fromHex(receiver);
    final transferAmount = BigInt.from(amount);
    final transferInfo = [receiverAddr, transferAmount];

    try {
      final hash = await web3Client.signTransaction(
        wcCredentials,
        Transaction.callContract(
          contract: contract.getContract(),
          function: contract.getTransferFunction(),
          parameters: transferInfo,
          from: EthereumAddress.fromHex(sender),
          value: EtherAmount.zero(),
        ),
        chainId: sessionStatus.chainId,
      );
    } catch (error) {
      print(error);
    }
  }
}
