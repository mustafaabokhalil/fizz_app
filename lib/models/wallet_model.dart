class WalletResponse {
  WalletResponse({
    required this.wallet,
    required this.today,
    required this.thisWeek,
    required this.thisMonth,
  });
  late final String wallet;
  late final String today;
  late final String thisWeek;
  late final String thisMonth;

  WalletResponse.fromJson(Map<String, dynamic> json) {
    wallet = json['wallet'];
    today = json['today'];
    thisWeek = json['this_week'];
    thisMonth = json['this_month'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['wallet'] = wallet;
    _data['today'] = today;
    _data['this_week'] = thisWeek;
    _data['this_month'] = thisMonth;
    return _data;
  }
}
