import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import '../../common/client/client.dart';
import '../../global.dart';
import '../../widgets/data_table.dart';

class UserSettingPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    listUser(ref);

    return Scaffold(body: UserSettingPageInner());
  }
}

class UserSettingPageInner extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cells = ref.watch(cellsProvider);

    return MyDataTable(
      columns: columns,
      dataSource: MyDataTableSource(context, cells),
      header: const Center(
        child: Text("User Settings"),
      ),
    );
  }
}

Future<void> listUser(WidgetRef ref) async {
  try {
    final token = ref.read(accessTokenProvider);
    final resp = await ref
        .watch(grpcProvider)
        .listUser(ListUserRequest(), options: withAuth(token));
    final List<List<DataCell>> cells = [];
    for (var user in resp.userList) {
      cells.add([
        DataCell(Text(user.username)),
        DataCell(Text(user.type.toString())),
        DataCell(Text(user.status.toString())),
      ]);
    }
    ref.read(cellsProvider.notifier).state = cells;
  } catch (e) {
    print(e);
  }
}

final cellsProvider = StateProvider<List<List<DataCell>>>((ref) {
  return [];
});

const columns = [
  DataColumn(label: Text("Username")),
  DataColumn(label: Text("Type")),
  DataColumn(label: Text("Status")),
];

const cells = [
  [
    DataCell(Text("user1")),
    DataCell(Text("user1")),
    DataCell(Text("user1")),
  ],
  [
    DataCell(Text("user2")),
    DataCell(Text("user1")),
    DataCell(Text("user1")),
  ],
  [
    DataCell(Text("user3")),
    DataCell(Text("user1")),
    DataCell(Text("user1")),
  ],
  [
    DataCell(Text("user4")),
    DataCell(Text("user1")),
    DataCell(Text("user1")),
  ],
];
