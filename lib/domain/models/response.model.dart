class ApiResponse {
  String? _message;
  int? _status;
  dynamic? _payload;

  ApiResponse({String? message, int? status, dynamic? payload}) {
    if (message != null) {
      this._message = message;
    }
    if (status != null) {
      this._status = status;
    }
    if (payload != null) {
      this._payload = payload;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;
  int? get status => _status;
  set status(int? status) => _status = status;
  dynamic? get payload => _payload;
  set payload(dynamic? payload) => _payload = payload;

  ApiResponse.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _status = json['status'];
    _payload = json['payload'] != null ? json['payload'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    data['status'] = this._status;
    if (this._payload != null) {
      data['payload'] = this._payload!.toJson();
    }
    return data;
  }
}
