import 'package:smartkit/FullApp/CryptoTech/helper/Constant.dart';

class Transaction {
  String id,
      user_id,
      trade_type,
      payment_type,
      from_wallet_address,
      to_wallet_address,
      crypto_currency_type,
      account_number,
      account_name,
      narration,
      crypto_amount,
      amount_paid,
      naira_amount,
      dollar_amount,
      crypto_transaction_id,
      transaction_id,
      qr_code,
      currency_code,
      bank_name,
      bank_code,
      crypto_status,
      status,
      is_credited,
      created_on,
      last_updated,
      type,
      message,
      first_name,
      last_name,
      email,
      amount,
      reference,
      final_amount,
      fee;
  Transaction({
    this.id,
    this.from_wallet_address,
    this.to_wallet_address,
    this.crypto_currency_type,
    this.account_number,
    this.account_name,
    this.bank_code,
    this.user_id,
    this.crypto_amount,
    this.amount_paid,
    this.naira_amount,
    this.dollar_amount,
    this.fee,
    this.currency_code,
    this.bank_name,
    this.trade_type,
    this.crypto_transaction_id,
    this.transaction_id,
    this.qr_code,
    this.amount,
    this.reference,
    this.final_amount,
    this.narration,
    this.payment_type,
    this.crypto_status,
    this.status,
    this.is_credited,
    this.created_on,
    this.last_updated,
    this.type,
    this.message,
    this.first_name,
    this.last_name,
    this.email,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json["id"].toString(),
      user_id: json["user_id"] ?? '',
      amount: json["amount"] ?? '',
      trade_type: json["trade_type"] ?? '',
      payment_type: json["payment_type"] ?? '',
      from_wallet_address: json["from_wallet_address"] ?? '',
      to_wallet_address: json["to_wallet_address"] ?? '',
      crypto_currency_type: json["crypto_currency_type"] ?? '',
      crypto_amount: json["crypto_amount"] ?? '',
      amount_paid: json["amount_paid"] ?? '',
      naira_amount: json["naira_amount"] ?? '',
      dollar_amount: json["dollar_amount"] ?? '',
      crypto_transaction_id: json["crypto_transaction_id"] ?? '',
      transaction_id: json["transaction_id"] ?? '',
      qr_code: json["qr_code"] ?? '',
      crypto_status: json["crypto_status"] ?? '',
      status: json["status"] ?? '',
      is_credited: json["is_credited"] ?? '',
      created_on: json["created_on"] ?? '',
      last_updated: json["last_updated"] ?? '',
      first_name: json["first_name"] ?? '',
      last_name: json["last_name"] ?? '',
      email: json["email"] ?? '',
      type: json.containsKey("type") ? json["type"] ?? '' : "",
      message: json.containsKey("message") ? json["message"] : "",
    );
  }

  factory Transaction.fromHomeJson(Map<String, String> json) {
    return Transaction(
      id: json["id"].toString(),
      user_id: json["user_id"] ?? '',
      amount: json["amount"] ?? '',
      trade_type: json["trade_type"] ?? '',
      payment_type: json["payment_type"] ?? '',
      from_wallet_address: json["from_wallet_address"] ?? '',
      to_wallet_address: json["to_wallet_address"] ?? '',
      crypto_currency_type: json["crypto_currency_type"] ?? '',
      crypto_amount: json["crypto_amount"] ?? '',
      amount_paid: json["amount_paid"] ?? '',
      naira_amount: json["naira_amount"] ?? '',
      dollar_amount: json["dollar_amount"] ?? '',
      crypto_transaction_id: json["crypto_transaction_id"] ?? '',
      transaction_id: json["transaction_id"] ?? '',
      qr_code: json.containsKey("qr_code") ? json["qr_code"] : '',
      crypto_status: json["crypto_status"] ?? '',
      status: json["status"] ?? '',
      is_credited: json["is_credited"] ?? '',
      created_on: json["created_on"] ?? '',
      last_updated: json["last_updated"] ?? '',
      first_name: json["first_name"] ?? '',
      last_name: json["last_name"] ?? '',
      email: json["email"] ?? '',
      type: json.containsKey("type") ? json["type"] ?? '' : "",
      message: json.containsKey("message") ? json["message"] : "",
    );
  }

  factory Transaction.fromTradeJson(Map<String, String> json) {
    return Transaction(
      id: json["id"].toString(),
      user_id: json["user_id"] ?? '',
      trade_type: json["trade_type"] ?? '',
      payment_type: json["payment_type"] ?? '',
      from_wallet_address: json["from_wallet_address"] ?? '',
      to_wallet_address: json["to_wallet_address"] ?? '',
      crypto_currency_type: json["crypto_currency_type"] ?? '',
      crypto_amount: json["crypto_amount"] ?? '',
      amount_paid: json["amount_paid"] ?? '',
      naira_amount: json["naira_amount"] ?? '',
      dollar_amount: json["dollar_amount"] ?? '',
      crypto_transaction_id: json["crypto_transaction_id"] ?? '',
      transaction_id: json["transaction_id"] ?? '',
      qr_code: json.containsKey("qr_code") ? json["qr_code"] : '',
      crypto_status: json["crypto_status"] ?? '',
      status: json["status"] ?? '',
      is_credited: json["is_credited"] ?? '',
      created_on: json["created_on"] ?? '',
      last_updated: json["last_updated"] ?? '',
      first_name: json["first_name"] ?? '',
      last_name: json["last_name"] ?? '',
      email: json["email"] ?? '',
    );
  }

  factory Transaction.fromWalletJson(Map<String, dynamic> json) {
    return Transaction(
      id: json["id"].toString(),
      type: json["type"] ?? '',
      amount: json["amount"],
      final_amount: json["final_amount"],
      status: json["status"] ?? '',
      created_on: json["created_on"] ?? '',
    );
  }
}
