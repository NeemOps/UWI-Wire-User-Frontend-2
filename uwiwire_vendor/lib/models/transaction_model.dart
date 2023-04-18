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
}
