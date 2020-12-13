import 'package:flutter/material.dart';
import 'package:flutter_app/shared_uis/custom_drawer.dart';
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

  deleteTask(Task task){
    tasks.remove(task) ;
    setState(() {
    });
  }

  navigateFun(int val){
    tabController.animateTo(val) ;
    Navigator.pop(context);
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
      drawer: customDrawer(
        fun1: navigateFun(0),
        fun2: navigateFun(1),
        fun3: navigateFun(2),
      ),
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
        ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context , index){
            return TodoWidget(tasks[index] , defineTaskStatus , deleteTask);
          },
        ),
        Column(
          children: tasks
              .where((element) => element.isComplete == true)
              .map((e) => TodoWidget(e , defineTaskStatus , deleteTask))
              .toList(),
        ),
        Column(
          children: tasks
              .where((element) => !element.isComplete)
              .map((e) => TodoWidget(e , defineTaskStatus , deleteTask))
              .toList(),
        )
      ]),
    );
  }
}

class TodoWidget extends StatefulWidget {

  Task task;
  Function fun;
  Function removeTask ;
  TodoWidget(this.task, this.fun , this.removeTask);

  showMyDialog(BuildContext context){
    showDialog(
      context: context ,
      builder: (context){
        return AlertDialog(
          title: Text('Alert'),
          content: Text('Are You Sure ?'),
          actions: [
            FlatButton(
              child: Text('Ok'),
              onPressed: (){
                removeTask(task);
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text('No'),
              onPressed: (){
                Navigator.pop(context) ;
              },
            ),
          ],
        );
      }
    );
  }

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
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){
              widget.showMyDialog(context) ;
            },
          ),
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
