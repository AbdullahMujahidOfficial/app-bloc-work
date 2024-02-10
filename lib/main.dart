import 'package:counterappbloc/CounterBloc/counter_bloc.dart';
import 'package:counterappbloc/CounterBloc/counter_event.dart';
import 'package:counterappbloc/CounterBloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CounterBloc(),child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    ),);
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    debugPrint("Scaffold Build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App Bloc"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(
              height: 30,
            ),

            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Text(state.counter.toString(),style: const TextStyle(fontSize: 60,fontWeight: FontWeight.w600),);
            },),

            const SizedBox(
              height: 10,
            ),

            ElevatedButton(onPressed: (){
              debugPrint("Increment");
              context.read<CounterBloc>().add(IncrementEvent());
            }, child: const Text("Increment")),

            const SizedBox(
              height: 10,
            ),

            ElevatedButton(onPressed: (){
              debugPrint("Decrement");
              context.read<CounterBloc>().add(DecrementEvent());
            }, child: const Text("Decrement")),

          ],
        ),
      ),
    );
  }
}


