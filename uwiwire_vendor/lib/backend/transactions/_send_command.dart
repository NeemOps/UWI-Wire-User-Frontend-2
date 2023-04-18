import '_transactions_command.dart';
import '_transactions.dart';

class SendCommand implements TransactionsCommand {
  late Transactions _transactionsInstance;

  SendCommand() {
    _transactionsInstance = Transactions();
  }

  @override
  void execute() {
    // _transactionsInstance.transferTokens(receiver, amount);
  }
}
