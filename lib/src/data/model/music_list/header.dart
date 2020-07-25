class Header {
  int status_code;
  double execute_time;

  Header.fromJsonMap(Map<String, dynamic> map)
      : status_code = map["status_code"],
        execute_time = map["execute_time"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = status_code;
    data['execute_time'] = execute_time;
    return data;
  }
}
