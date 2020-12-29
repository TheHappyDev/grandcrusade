import 'package:flutter/material.dart';
import '../shared/shared.dart';
import '../services/services.dart';
import '../screens/screens.dart';

class DeploymentSelecyScreen extends StatefulWidget {
  createState() => DeploymentSelecyScreenState();
}

class DeploymentSelecyScreenState extends State<DeploymentSelecyScreen> {
  Deployment deployment;
  @override
  void initState() {
    super.initState();
  }

  void callback(Deployment selectedDeployment) {
    setState(() {
      this.deployment = selectedDeployment;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Global.deploymentsRef.getData(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          List<Deployment> deployments = snap.data;
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
                                    DeploymentSelect(callback, deployments),
                                fullscreenDialog: true,
                              ),
                            );
                          },
                          child: Text('Deployment')),
                    )),
                    Flexible(
                      child: FractionallySizedBox(
                        widthFactor: 1,
                        heightFactor: 1,
                        child: Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: (deployment != null)
                                ? Text('${deployment.name}',
                                    textAlign: TextAlign.center)
                                : Text('Deployment'),
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

class DeploymentSelect extends StatelessWidget {
  Function(Deployment) callback;
  List<Deployment> deployments;
  DeploymentSelect(this.callback, this.deployments);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.color,
          title: Text('Deployment Select'),
        ),
        body: ListView(
          primary: false,
          padding: const EdgeInsets.all(5.0),
          children: deployments
              .map((deployment) => Card(
                    child: ListTile(
                      title: Text(deployment.name),
                      subtitle: Text(deployment.description),
                      isThreeLine: true,
                      trailing: Icon(Icons.check),
                      onTap: () {
                        this.callback(deployment);
                      },
                    ),
                  ))
              .toList(),
        ));
  }
}
