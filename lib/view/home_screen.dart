import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/response/status.dart';
import '../view_models/user_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserViewModel userViewModel = Get.put(UserViewModel());

  @override
  void initState() {
    super.initState();
    userViewModel.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('User Data'),
      ),
      body: Obx(() {
        switch (userViewModel.userList.value.status) {
          case Status.LOADING:
            return Center(child: CircularProgressIndicator());
          case Status.ERROR:
            return Center(child: Text(userViewModel.userList.value.message ?? 'Error'));
          case Status.COMPLETED:
            return ListView.builder(
              itemCount: userViewModel.userList.value.data?.data?.length ?? 0,
              itemBuilder: (context, index) {
                final user = userViewModel.userList.value.data?.data?[index];
                return ListTile(
                  leading: Image.network(user?.avatar ?? ''),
                  title: Text('${user?.firstName} ${user?.lastName}'),
                  subtitle: Text(user?.email ?? ''),
                );
              },
            );
          default:
            return Container();
        }
      }),
      backgroundColor: Colors.cyan,
    );
  }
}
