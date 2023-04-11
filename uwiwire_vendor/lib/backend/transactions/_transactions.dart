import 'package:web3dart/web3dart.dart';

// const String rpcUrl = 'https://cibc-mainnet.sundaebytes.com';

// final EthereumAddress _contractAddr =
//     EthereumAddress.fromHex('0x6298b8EEfCe01ac5164127B13A8C1957b1b1e439');

class Transactions {
  // late final _contract;

  // // Establish a connection to the ethereum rpc node.
  // final client = Web3Client(rpcUrl, Client());

  // // Credentials

  // // Get the contract abi and tell web3dart where it's deployed (contractAddr)
  // List<dynamic> _getFacadeABI() {
  //   return [
  //     {
  //       "inputs": [
  //         {
  //           "internalType": "address",
  //           "name": "pelicoinAddress",
  //           "type": "address"
  //         }
  //       ],
  //       "stateMutability": "nonpayable",
  //       "type": "constructor"
  //     },
  //     {
  //       "anonymous": false,
  //       "inputs": [
  //         {
  //           "indexed": true,
  //           "internalType": "address",
  //           "name": "previousOwner",
  //           "type": "address"
  //         },
  //         {
  //           "indexed": true,
  //           "internalType": "address",
  //           "name": "newOwner",
  //           "type": "address"
  //         }
  //       ],
  //       "name": "OwnershipTransferred",
  //       "type": "event"
  //     },
  //     {
  //       "anonymous": false,
  //       "inputs": [
  //         {
  //           "indexed": false,
  //           "internalType": "address",
  //           "name": "account",
  //           "type": "address"
  //         }
  //       ],
  //       "name": "Paused",
  //       "type": "event"
  //     },
  //     {
  //       "anonymous": false,
  //       "inputs": [
  //         {
  //           "indexed": false,
  //           "internalType": "address",
  //           "name": "account",
  //           "type": "address"
  //         }
  //       ],
  //       "name": "Unpaused",
  //       "type": "event"
  //     },
  //     {
  //       "inputs": [
  //         {"internalType": "address", "name": "from", "type": "address"},
  //         {"internalType": "address", "name": "to", "type": "address"},
  //         {"internalType": "uint256", "name": "amount", "type": "uint256"}
  //       ],
  //       "name": "addTransaction",
  //       "outputs": [],
  //       "stateMutability": "nonpayable",
  //       "type": "function"
  //     },
  //     {
  //       "inputs": [],
  //       "name": "getBalance",
  //       "outputs": [
  //         {"internalType": "uint256", "name": "", "type": "uint256"}
  //       ],
  //       "stateMutability": "view",
  //       "type": "function"
  //     },
  //     {
  //       "inputs": [],
  //       "name": "getTokenAddress",
  //       "outputs": [
  //         {"internalType": "address", "name": "", "type": "address"}
  //       ],
  //       "stateMutability": "view",
  //       "type": "function"
  //     },
  //     {
  //       "inputs": [
  //         {"internalType": "uint256", "name": "index", "type": "uint256"}
  //       ],
  //       "name": "getTransaction",
  //       "outputs": [
  //         {
  //           "components": [
  //             {"internalType": "address", "name": "from", "type": "address"},
  //             {"internalType": "address", "name": "to", "type": "address"},
  //             {"internalType": "uint256", "name": "amount", "type": "uint256"},
  //             {
  //               "internalType": "uint256",
  //               "name": "timestamp",
  //               "type": "uint256"
  //             }
  //           ],
  //           "internalType": "struct Transactions.Transaction",
  //           "name": "",
  //           "type": "tuple"
  //         }
  //       ],
  //       "stateMutability": "view",
  //       "type": "function"
  //     },
  //     {
  //       "inputs": [],
  //       "name": "getTransactionHistory",
  //       "outputs": [
  //         {
  //           "components": [
  //             {"internalType": "address", "name": "from", "type": "address"},
  //             {"internalType": "address", "name": "to", "type": "address"},
  //             {"internalType": "uint256", "name": "amount", "type": "uint256"},
  //             {
  //               "internalType": "uint256",
  //               "name": "timestamp",
  //               "type": "uint256"
  //             }
  //           ],
  //           "internalType": "struct Transactions.Transaction[]",
  //           "name": "",
  //           "type": "tuple[]"
  //         }
  //       ],
  //       "stateMutability": "view",
  //       "type": "function"
  //     },
  //     {
  //       "inputs": [],
  //       "name": "getTransactionsLength",
  //       "outputs": [
  //         {"internalType": "uint256", "name": "", "type": "uint256"}
  //       ],
  //       "stateMutability": "view",
  //       "type": "function"
  //     },
  //     {
  //       "inputs": [],
  //       "name": "owner",
  //       "outputs": [
  //         {"internalType": "address", "name": "", "type": "address"}
  //       ],
  //       "stateMutability": "view",
  //       "type": "function"
  //     },
  //     {
  //       "inputs": [],
  //       "name": "pause",
  //       "outputs": [],
  //       "stateMutability": "nonpayable",
  //       "type": "function"
  //     },
  //     {
  //       "inputs": [],
  //       "name": "paused",
  //       "outputs": [
  //         {"internalType": "bool", "name": "", "type": "bool"}
  //       ],
  //       "stateMutability": "view",
  //       "type": "function"
  //     },
  //     {
  //       "inputs": [],
  //       "name": "renounceOwnership",
  //       "outputs": [],
  //       "stateMutability": "nonpayable",
  //       "type": "function"
  //     },
  //     {
  //       "inputs": [
  //         {"internalType": "address", "name": "newOwner", "type": "address"}
  //       ],
  //       "name": "transferOwnership",
  //       "outputs": [],
  //       "stateMutability": "nonpayable",
  //       "type": "function"
  //     },
  //     {
  //       "inputs": [
  //         {"internalType": "address", "name": "to", "type": "address"},
  //         {"internalType": "uint256", "name": "amount", "type": "uint256"}
  //       ],
  //       "name": "transferTokens",
  //       "outputs": [],
  //       "stateMutability": "nonpayable",
  //       "type": "function"
  //     },
  //     {
  //       "inputs": [],
  //       "name": "unpause",
  //       "outputs": [],
  //       "stateMutability": "nonpayable",
  //       "type": "function"
  //     },
  //     {
  //       "inputs": [
  //         {
  //           "internalType": "contract IERC20",
  //           "name": "token",
  //           "type": "address"
  //         },
  //         {"internalType": "uint256", "name": "amount", "type": "uint256"}
  //       ],
  //       "name": "withdrawTokens",
  //       "outputs": [],
  //       "stateMutability": "nonpayable",
  //       "type": "function"
  //     }
  //   ];
  // }

  // void _initContract() {
  //   try {
  //     _contract = DeployedContract(
  //         ContractAbi.fromJson(_getFacadeABI() as String, 'PeliWalletFacade'),
  //         _contractAddr);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Future<void> transfer(String receiverAddr, double amt) async {
  //   final recipient = EthereumAddress.fromHex(receiverAddr);
  //   final amount = BigInt.from(amt);

  //   try {
  //     // Initialize Contract
  //     _initContract();

  //     // Send Tokens
  //     final txnHash = await _contract.send('transfer', [recipient, amount]);

  //     print('Transaction hash: $txnHash');
  //   } catch (e) {
  //     print(e.toString());
  //   }

  //   await client.sendTransaction(
  //     credentials,
  //     Transaction.callContract(
  //       contract: _contract,
  //       function: _contract.function('sendCoin'),
  //       parameters: [recipient, balance.first],
  //     ),
  //   );
  // }
}
