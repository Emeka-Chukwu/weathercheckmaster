import 'package:flutter/material.dart';
import 'package:weather_checker_master/services/auths_services.dart';

class DashBaord extends StatefulWidget {
  DashBaord({Key? key}) : super(key: key);

  @override
  _DashBaordState createState() => _DashBaordState();
}

class _DashBaordState extends State<DashBaord> {
  final TextEditingController controller = TextEditingController();
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Center(child: Text("home")),
              SizedBox(height: 20),
              TextField(
                controller: controller,
              ),
              SizedBox(height: 20),
              GestureDetector(
                  onTap: () async {
                    Map value = await authService.getUserLocationTemp();
                    print(value);
                    setState(() {});
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Text("get Location temp"),
                  )),
              FutureBuilder(
                future: authService.getUserLocationTemp(),
                builder: (BuildContext context,
                    AsyncSnapshot<Map<String, dynamic>> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        // Text(snapshot.data.toString()),
                        // Text(" coord : ${snapshot.data!["coord"].toString()}"),
                        Text(
                            " Temp : ${snapshot.data!["main"]["temp"].toString()}"),
                        Text(
                            "Feels : Temp ${snapshot.data!["main"]["feels_like"].toString()}"),
                        Text(
                            "Highest : Temp ${snapshot.data!["main"]["temp_max"].toString()}"),
                        Text(
                            "Lowest : Temp ${snapshot.data!["main"]["temp_min"].toString()}"),
                        Text(
                            "Lowest : Temp ${snapshot.data!["main"]["temp_min"].toString()}"),
                        Text(
                            "Description : ${snapshot.data!["weather"][0]["description"].toString()}"),
                        Text("Name : ${snapshot.data!["name"].toString()}"),
                      ],
                    );
                  }
                  if (snapshot.hasError) {
                    Text("Error");
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
