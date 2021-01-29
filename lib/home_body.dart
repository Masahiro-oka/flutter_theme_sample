import 'package:flutter/material.dart';
import 'package:flutterthemesample/provider/count_provider.dart';
import 'package:flutterthemesample/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  HomeBody({@required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final changeTheme = Provider.of<ThemeProvider>(context);
    final count = Provider.of<CountProvider>(context);
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
            icon: changeTheme.flag ? Icon(Icons.wb_sunny) : Icon(Icons.nightlight_round),
            onPressed: () => changeTheme.flag ? changeTheme.increment() : changeTheme.increment(),
          )
        ],
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText2.color
              ),
            ),
            StreamBuilder(
                stream: count.count,
                initialData: 0,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.bodyText1,
                  );
                }
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Reset'),
              onPressed: () => count.reset.add(null),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () => count.increment.add(null),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
