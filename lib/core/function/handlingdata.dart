import 'package:admin/core/class/statusrequest.dart';

handlingData(response){
  if(response is StatuesRequest){
    return response;
  }else{
    return StatuesRequest.success;
  }
}