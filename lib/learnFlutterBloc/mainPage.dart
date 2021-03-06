import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_flutter/bloc/counterbloc_bloc.dart';
import 'package:try_flutter/learnFlutterBloc/numberCard.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    CounterblocState counterState = context.watch<CounterblocBloc>().state;
    int number = context.select<CounterblocBloc, int>((counterBloc) =>
        (counterBloc.state is CounterBlocValue)
            ? (counterBloc.state as CounterBlocValue).value
            : null);

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter BLoC demo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterblocBloc, CounterblocState>(
                builder: (_, state) {
                  return CardNumber("Bloc\nBuilder",
                      (state is CounterBlocValue) ? state.value : null);
                },
              ),
              SizedBox(
                width: 40,
              ),
              CardNumber(
                  "Watch",
                  (counterState is CounterBlocValue)
                      ? counterState.value
                      : null),
              SizedBox(width: 40),
              CardNumber("Select", number)
            ],
          ),
          SizedBox(height: 40),
          TextButton(
              onPressed: () {
                context.read<CounterblocBloc>().add(Increment());
              },
              child: Text(
                "INCREMENT",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }
}
