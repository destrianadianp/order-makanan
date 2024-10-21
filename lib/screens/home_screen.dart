import 'package:flutter/material.dart';
import 'package:order2/app/bloc/authentication_state.dart';
import 'package:order2/ui/shared_view/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order2/app/bloc/authentication_bloc.dart';
import '../app/bloc/authentication_event.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Food Order App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome, User!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state is AuthenticationLoadingState) {
                   const CircularProgressIndicator();
                } else if (state is AuthenticationFailureState){
                    showDialog(context: context, builder: (context){
                          return const AlertDialog(
                            content: Text('error'),
                          );
                        });
                }
              },
              builder: (context, state) {
                return CustomButton(
                    onPressed: () {
                      BlocProvider.of<AuthenticationBloc>(context)
                      .add(SignOut());
                    }, child: const Text(
                      'logOut'
                      ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
