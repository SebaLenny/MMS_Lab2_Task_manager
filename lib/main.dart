import 'package:flutter/material.dart';
import 'package:task_manager/Utility/dimens.dart';
import 'package:task_manager/task_controller.dart';

import 'Utility/strings.dart';
import 'create_task_view.dart';
import 'menu_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final TaskController _taskController = TaskController();

  @override
  Widget build(BuildContext rcontext) {
    return MaterialApp(
      title: Strings.mainTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: Strings.taskManagerHomePage,
        taskController: _taskController,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final TaskController taskController;

  MyHomePage({
    Key key,
    this.title,
    @required this.taskController,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollViewController;
  List<Widget> _widgetList;

  @override
  void initState() {
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _widgetList = widget.taskController.getTaskWidgetsList(update);
    super.initState();
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    super.dispose();
  }

  void update(){
    setState(() {
      _widgetList = widget.taskController.getTaskWidgetsList(update);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MenuDrawer(),
      body: Container(
        padding: EdgeInsets.all(Dimens.smallDistance),
        child: ListView(
            controller: _scrollViewController,
            children: _widgetList),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateTaskView(widget.taskController, update),
            ),
          );
        },
        tooltip: Strings.addTask,
        child: Icon(Icons.add),
      ),
    );
  }
}
