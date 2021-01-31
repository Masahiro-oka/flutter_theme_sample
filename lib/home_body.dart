import 'package:flutter/material.dart';
//import 'package:flutterthemesample/provider/count_provider.dart';
import 'package:flutterthemesample/provider/count_value_notifier.dart';
import 'package:flutterthemesample/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({@required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {

    final changeTheme = Provider.of<ThemeProvider>(context);
//    final count = Provider.of<CountProvider>(context);
    final countValue = CountNotifier();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        notchMargin: 6.0,
        shape: AutomaticNotchedShape(
          RoundedRectangleBorder(),
          StadiumBorder(
            side: BorderSide(),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: changeTheme.flag ? Icon(Icons.wb_sunny,color: Colors.redAccent,) : Icon(Icons.nightlight_round,color: Colors.yellow,),
            onPressed: () => changeTheme.flag ? changeTheme.increment() : changeTheme.increment(),
          )
        ],
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
//              style: TextStyle(
//                color: Theme.of(context).textTheme.bodyText2.color
//              ),
            ),
            ValueListenableBuilder<int>(
              valueListenable: countValue,
              builder: (context, value, child) => Text('${countValue.count}',
              style: Theme.of(context).textTheme.bodyText1,),
            ),
//            ValueListenableProvider.value(
//              value: countValue,
//              child: Text(countValue.value.toString(),
//                style: Theme.of(context).textTheme.bodyText1,),
//              builder: (context, child) => Text('${countValue.value.toString()}',
//                style: Theme.of(context).textTheme.bodyText1,),
//            ),
//            StreamBuilder(
//                stream: count.count,
//                initialData: 0,
//                builder: (context, snapshot) {
//                  return Text(
//                    '${snapshot.data}',
//                    style: Theme.of(context).textTheme.bodyText1,
//                  );
//                }
//            ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                child: const Text('Reset'),
                onPressed: () => countValue.increment(false),
              ),
//            Align(
//              alignment: Alignment.bottomRight,
//              child: GestureDetector(
//                onTap: () =>countValue.increment(),
//                child: Container(
//                  width: 56,
//                  height: 56,
//                  margin: EdgeInsets.all(16),
//                  decoration: BoxDecoration(
//                    color: Theme.of(context).accentColor,
//                    shape: BoxShape.circle,
//                  ),
//                  child: Icon(Icons.add, color: Colors.white),
//                ),
//              ),
//            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () => countValue.increment(true),
//            count.increment.add(null),
        child: Icon(Icons.add),
      ),
    );
  }
}
