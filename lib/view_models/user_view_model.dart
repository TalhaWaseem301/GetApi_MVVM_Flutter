import 'package:get/get.dart';
import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/data/response/api_response.dart';
import 'package:getx_mvvm/models/user_list_model.dart';

class UserViewModel extends GetxController {
  var userList = ApiResponse<UserListModel>.loading().obs;

  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<void> fetchUsers() async {
    userList.value = ApiResponse.loading();

    try {
      var response = await _apiServices.getApi('https://reqres.in/api/users?page=2');
      UserListModel userListModel = UserListModel.fromJson(response);
      userList.value = ApiResponse.completed(userListModel);
    } catch (e) {
      userList.value = ApiResponse.error(e.toString());
    }
  }
}
