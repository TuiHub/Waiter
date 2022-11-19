import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import '../common/client/client.dart';
import '../global.dart';
import '../routes.dart';
import '../widgets/icon_menu.dart';
import '../widgets/split_view.dart';

class AccountPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginStateProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 79, 148, 188),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconMenuItem(
            icon: icons['Login']!,
            selected: true,
            onPressed: () => {Navigator.pop(context)},
          ),
          Expanded(
            child: SplitView(
              menuWidth: 528,
              menu: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (loginState == LoginState.logged) Info() else Login(),
                  ],
                ),
              ),
              content: Container(),
            ),
          ),
        ],
      ),
    );
  }
}

enum LoginState {
  unLogged,
  logging,
  failed,
  logged,
}

final loginStateProvider = StateProvider<LoginState>((ref) {
  return LoginState.unLogged;
});

class Login extends ConsumerWidget {
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  Future<void> getToken(WidgetRef ref, String username, String password) async {
    ref.read(loginStateProvider.notifier).state = LoginState.logging;
    try {
      final resp = await ref
          .watch(grpcProvider)
          .getToken(GetTokenRequest(username: username, password: password));
      ref.read(accessTokenProvider.notifier).state = resp.accessToken;
      ref.read(loginStateProvider.notifier).state = LoginState.logged;
    } catch (e) {
      ref.read(loginStateProvider.notifier).state = LoginState.failed;
    }
    print(ref.read(loginStateProvider));
    print(ref.read(accessTokenProvider));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginStateProvider);

    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: <Widget>[
              Visibility(
                visible: loginState == LoginState.failed,
                child: const Text(
                  "LOGIN FAILED",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextFormField(
                controller: _unameController,
                decoration: const InputDecoration(
                  labelText: "Username",
                  hintText: "your username",
                  icon: Icon(Icons.person),
                ),
                validator: (v) {
                  return v!.trim().isNotEmpty ? null : "can not be empty";
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: "your password",
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (v) {
                  return v!.trim().isNotEmpty ? null : "can not be empty";
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        onPressed: loginState != LoginState.logging
                            ? () {
                                if ((_formKey.currentState as FormState)
                                    .validate()) {
                                  getToken(
                                    ref,
                                    _unameController.text,
                                    _pwdController.text,
                                  );
                                }
                              }
                            : null,
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text("Login"),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Info extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accessToken = ref.watch(accessTokenProvider);

    return Column(
      children: [
        const Text("Login Success"),
        Text("AccessToken: $accessToken"),
      ],
    );
  }
}
