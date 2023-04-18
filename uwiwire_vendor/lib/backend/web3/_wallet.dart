import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

import '../../constants.dart';
import '../transactions/_transactions.dart';

class Web3Wallet {
  static final Web3Wallet _instance = Web3Wallet._internal();

  factory Web3Wallet() {
    return _instance;
  }

  Web3Wallet._internal();

  static late SessionStatus _session;

  WalletConnect getConnector() {
    final WalletConnect connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
        name: 'UWIwire',
        description: 'An app for digital payments in the UWI',
        url: 'https://uwi-wire.herokuapp.com/',
        icons: [],
      ),
    );

    return connector;
  }

  SessionStatus getSession() {
    return _session;
  }

  EthereumWalletConnectProvider getProvider() {
    return EthereumWalletConnectProvider(getConnector());
  }
}
