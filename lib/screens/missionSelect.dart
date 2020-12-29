import 'package:flutter/material.dart';
import '../shared/shared.dart';
import '../services/services.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MissionSelectScreen extends StatefulWidget {
  createState() => MissionSelectScreenState();
}

class MissionSelectScreenState extends State<MissionSelectScreen> {
  Mission mission;
  @override
  void initState() {
    super.initState();
  }

  void callback(Mission selectedMission) {
    setState(() {
      this.mission = selectedMission;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Global.missionsRef.getData(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          List<Mission> missions = snap.data;
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.all(15),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                        child: FractionallySizedBox(
                      widthFactor: 1,
                      heightFactor: 1,
                      child: RaisedButton(
                          textColor: Theme.of(context).textTheme.button.color,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<String>(
                                builder: (BuildContext context) =>
                                    MissionSelect(callback, missions),
                                fullscreenDialog: true,
                              ),
                            );
                          },
                          child: Text('Mission')),
                    )),
                    Flexible(
                      child: FractionallySizedBox(
                        widthFactor: 1,
                        heightFactor: 1,
                        child: Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: (mission != null)
                                ? Text('${mission.name}',
                                    textAlign: TextAlign.center)
                                : Text('Mission'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return LoadingScreen();
        }
      },
    );
  }
}

class MissionSelect extends StatelessWidget {
  Function(Mission) callback;
  List<Mission> missions;
  MissionSelect(this.callback, this.missions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.color,
          title: Text('Mission'),
        ),
        body: Container(
            child: CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            aspectRatio: 3.0,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            autoPlay: false,
          ),
          items: missions
              .map((mission) => Container(
                  margin: EdgeInsets.only(top: 20, bottom:20),
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Card(
                    child: GestureDetector(
                      onTap: () {
                        this.callback(mission);
                      },
                      child: ListView(                        
                        children: [                      
                          Text(mission.name, style: Theme.of(context).textTheme.headline, textAlign: TextAlign.center,),
                          Text(mission.description, style: Theme.of(context).textTheme.body1),
                          Spacer(flex: 5),
                          Text('Secondary', style: Theme.of(context).textTheme.headline, textAlign: TextAlign.center,),
                          Text(mission.secondary, style: Theme.of(context).textTheme.body1),
                          Spacer(flex: 5),
                          Text('Scoring' ,style: Theme.of(context).textTheme.headline, textAlign: TextAlign.center,),
                          Text(mission.scoring, style: Theme.of(context).textTheme.body1),
                          Spacer(flex: 5),
                          Text('Deployment' ,style: Theme.of(context).textTheme.headline, textAlign: TextAlign.center,),
                          Image.network(mission.imageUrl),
                        ],
                      ))     
                  )))
              .toList(),
        )));
  }
}
