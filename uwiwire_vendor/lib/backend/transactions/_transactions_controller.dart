import '_transactions_command.dart';

class TransactionsController {
  late TransactionsCommand _command;

  void setCommand(TransactionsCommand command) {
    _command = command;
  }

  void transact() {
    return _command.execute();
  }
}
