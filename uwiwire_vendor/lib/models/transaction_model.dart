class TransactionModel {
  String? sender;
  String? receiver;
  double? amount;
  bool? isReceiver;
  bool? isPurchase;

  TransactionModel(
      {required this.sender,
      required this.receiver,
      required this.amount,
      required this.isReceiver,
      required this.isPurchase});

  static List<TransactionModel> transactionsList() {
    String myAddr = 'my address';
    return [
      TransactionModel(
        sender: myAddr,
        receiver: 'receiver_1',
        amount: 100,
        isReceiver: false,
        isPurchase: true,
      ),
      TransactionModel(
        sender: myAddr,
        receiver: 'receiver_2',
        amount: 50,
        isReceiver: false,
        isPurchase: false,
      ),
      TransactionModel(
        sender: 'sender_1',
        receiver: myAddr,
        amount: 75,
        isReceiver: true,
        isPurchase: false,
      ),
    ];
  }
}
