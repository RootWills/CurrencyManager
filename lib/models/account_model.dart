import 'package:tc/models/DAO/account_DAO.dart';

/// Model de contas
///
/// O id nunca deve ser inserido, somente recuperado
class AccountModel {
  final int idAccount;
  final String name;
  final double balance;

  AccountModel(
      {required this.idAccount, required this.name, required this.balance});

  AccountModel.fromMap(Map<String, dynamic> map)
      : idAccount = map[AccountModelForDb.idAccount],
        name = map[AccountModelForDb.name],
        balance = map[AccountModelForDb.balance];

  Map<String, Object?> toMap() {
    return {AccountModelForDb.name: name, AccountModelForDb.balance: balance};
  }
}