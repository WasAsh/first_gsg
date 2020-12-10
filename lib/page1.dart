import 'package:flutter/material.dart';
import 'package:flutter_app/task_mock.dart';
import 'models/task.dart';

class TabBar1 extends StatefulWidget {
  @override
  _TabBar1State createState() => _TabBar1State();
}

class _TabBar1State extends State<TabBar1> with SingleTickerProviderStateMixin {

  bool isAccepted = false;
  TabController tabController;
  int bnbIndex = 0 ;

  defineTaskStatus(Task task , bool val){
    int index = tasks.indexOf(task) ;
    tasks[index].isComplete = val ;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.done),
              onPressed: () {
                tabController.animateTo(1);
              })
        ],
        title: Text('ToDo'),
        bottom: TabBar(controller: tabController, tabs: [
          Tab(
            child: Text('All Tasks'),
          ),
          Tab(
            child: Text('Complete Tasks'),
          ),
          Tab(
            child: Text('InComplete Tasks'),
          )
        ]),
      ),
      body: TabBarView(controller: tabController, children: [
        Column(
          children: tasks.map((e) => TodoWidget(e , defineTaskStatus)).toList(),
        ),
        Column(
          children: tasks
              .where((element) => element.isComplete == true)
              .map((e) => TodoWidget(e , defineTaskStatus))
              .toList(),
        ),
        Column(
          children: tasks
              .where((element) => !element.isComplete)
              .map((e) => TodoWidget(e , defineTaskStatus))
              .toList(),
        )
      ]),
      // bottomNavigationBar: BottomNavigationBar(
      //     type: BottomNavigationBarType.fixed,
      //     currentIndex: tabController.index,
      //     onTap: (value) {
      //       tabController.animateTo(value);
      //       setState(() {});
      //     },
      //     items: [
      //       BottomNavigationBarItem(
      //           title: Text('AllTasks'), icon: Icon(Icons.menu)),
      //       BottomNavigationBarItem(
      //           title: Text('CompleteTasks'), icon: Icon(Icons.done)),
      //       BottomNavigationBarItem(
      //           title: Text('InComplete tasks'), icon: Icon(Icons.close)),
      //     ]),
    );
  }
}

class TodoWidget extends StatefulWidget {

  Task task;
  Function fun;
  TodoWidget(this.task, this.fun);

  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.task.taskName),
          Checkbox(
              value: widget.task.isComplete,
              onChanged: (value) {
                widget.task.isComplete = value;
                widget.fun(widget.task , value) ;
                setState(() {});
              })
        ],
      ),
    );
  }
}
