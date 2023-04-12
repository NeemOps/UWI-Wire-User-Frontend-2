import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:uwiwire_vendor/backend/_account_info.dart';

import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web3dart/web3dart.dart';

class Transactions {
  late final WalletConnect _connector;
  late final SessionStatus _session;
  late var _uri;

  void connectWallet() {
    _connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
        name: 'UWIwire',
        description: 'An app for digital payments in the UWI',
        url: 'https://uwi-wire.herokuapp.com/',
        icons: [],
      ),
    );
  }

  void sessionConnect() {}

  WalletConnect getConnector() {
    return _connector;
  }

  SessionStatus getSession() {
    return _session;
  }

  connectMetamask(BuildContext context) async {
    if (!_connector.connected) {
      try {
        var session = await _connector.createSession(
          onDisplayUri: (uri) async {
            _uri = uri;
            await launchUrlString(uri, mode: LaunchMode.externalApplication);
          },
        );

        _session = session;
      } catch (exp) {
        print(exp);
      }
    } else {
      Navigator.pushNamed(context, '/homeRoute');
    }
  }

  // Contract Data
  final EthereumAddress _addr =
      EthereumAddress.fromHex('0x6298b8EEfCe01ac5164127B13A8C1957b1b1e439');

  final abiJSON = [
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "pelicoinAddress",
          "type": "address"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "constructor"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "previousOwner",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "address",
          "name": "newOwner",
          "type": "address"
        }
      ],
      "name": "OwnershipTransferred",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": false,
          "internalType": "address",
          "name": "account",
          "type": "address"
        }
      ],
      "name": "Paused",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": false,
          "internalType": "address",
          "name": "account",
          "type": "address"
        }
      ],
      "name": "Unpaused",
      "type": "event"
    },
    {
      "inputs": [
        {"internalType": "address", "name": "from", "type": "address"},
        {"internalType": "address", "name": "to", "type": "address"},
        {"internalType": "uint256", "name": "amount", "type": "uint256"}
      ],
      "name": "addTransaction",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getBalance",
      "outputs": [
        {"internalType": "uint256", "name": "", "type": "uint256"}
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getTokenAddress",
      "outputs": [
        {"internalType": "address", "name": "", "type": "address"}
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {"internalType": "uint256", "name": "index", "type": "uint256"}
      ],
      "name": "getTransaction",
      "outputs": [
        {
          "components": [
            {"internalType": "address", "name": "from", "type": "address"},
            {"internalType": "address", "name": "to", "type": "address"},
            {"internalType": "uint256", "name": "amount", "type": "uint256"},
            {"internalType": "uint256", "name": "timestamp", "type": "uint256"}
          ],
          "internalType": "struct Transactions.Transaction",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getTransactionHistory",
      "outputs": [
        {
          "components": [
            {"internalType": "address", "name": "from", "type": "address"},
            {"internalType": "address", "name": "to", "type": "address"},
            {"internalType": "uint256", "name": "amount", "type": "uint256"},
            {"internalType": "uint256", "name": "timestamp", "type": "uint256"}
          ],
          "internalType": "struct Transactions.Transaction[]",
          "name": "",
          "type": "tuple[]"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getTransactionsLength",
      "outputs": [
        {"internalType": "uint256", "name": "", "type": "uint256"}
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "owner",
      "outputs": [
        {"internalType": "address", "name": "", "type": "address"}
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "pause",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "paused",
      "outputs": [
        {"internalType": "bool", "name": "", "type": "bool"}
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "renounceOwnership",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {"internalType": "address", "name": "newOwner", "type": "address"}
      ],
      "name": "transferOwnership",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {"internalType": "address", "name": "to", "type": "address"},
        {"internalType": "uint256", "name": "amount", "type": "uint256"}
      ],
      "name": "transferTokens",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "unpause",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {"internalType": "contract IERC20", "name": "token", "type": "address"},
        {"internalType": "uint256", "name": "amount", "type": "uint256"}
      ],
      "name": "withdrawTokens",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    }
  ];

  // Send Tokens
  final web3client =
      Web3Client('https://cibc-mainnet.sundaebytes.com', Client());

  Future<void> sendTokens(String receiverAddr, double amount) async {
    AccountInfo acc = AccountInfo();

    String abiEncode = jsonEncode(abiJSON);

    ContractAbi contractABI =
        ContractAbi.fromJson(abiEncode, 'PeliWalletFacade');

    var contract = DeployedContract(contractABI, _addr);

    print('1');

    var transfer = contract.function('transferTokens');

    print('2');

    final transferInfo = [
      EthereumAddress.fromHex(receiverAddr),
      BigInt.from(amount),
    ];

    print('3');

    // Transaction Object
    final transaction = Transaction(
      from: acc.getWalletAddress(), // The user's Ethereum address
      to: _addr,
      value: EtherAmount.zero(),
      data: transfer.encodeCall(transferInfo),
    );

    final encodedTransaction = Uri.encodeFull(jsonEncode(transaction));
    final metamaskUrl = Uri.parse(
        'https://metamask.app.link/send/transaction/$encodedTransaction');

    if (await canLaunchUrl(metamaskUrl)) {
      await launchUrl(metamaskUrl);
    } else {
      throw 'Could not launch $metamaskUrl';
    }
    print('4');

    Transaction.callContract(
        contract: contract, function: transfer, parameters: transferInfo);

    print('5');
  }
}
