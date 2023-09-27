import 'package:awesome_base/net/base_service.dart';

import 'http.dart';

class CommonService extends BaseService {
  CommonService(String api) : super(api + '/');

  Future test(String mobile, String event) async {
    final params = {'mobile': mobile, 'event': event};
    return await Http.instance.post(api + 'sms/send-code', parameters: params);
  }

}
