// ignore_for_file: prefer_final_fields

class Transactions {
  String _transactionID = '';
  double _cost = 0;
  dynamic _walletAddr = 0;

  double getCost() {
    return _cost;
  }

  String getTransactionID() {
    return _transactionID;
  }

  dynamic getWalletAddr() {
    return _walletAddr;
  }
}
