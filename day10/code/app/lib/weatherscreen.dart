import 'dart:convert';
import 'dart:ui';
import 'package:day1/Api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FrostedDemo extends StatefulWidget {


  @override
  State<FrostedDemo> createState() => _FrostedDemoState();
}

class _FrostedDemoState extends State<FrostedDemo> {

  // Temperatures?  weatherData;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    // fetchData();

    super.didChangeDependencies();

  }

  @override
  void initState() {
    // fetchData();
    
    
  }

     Temperatures?  weatherData  ;
  

   Future<void> fetchData() async {
    final response = await http.get(
       (Uri.parse( 'http://api.weatherstack.com/current?access_key=a48211c298b74828fe420f76d3b58db5&query=Goa%20india')));

    if (response.statusCode == 200) {
      setState(() {
        print(weatherData);
        weatherData =
            Temperatures.fromJson(json.decode(response.body) as Map<String, dynamic>);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.asset("assets/b4.jpg", fit: BoxFit.cover),
          ),
          Center(
            child: Container(
               decoration: BoxDecoration(
                    boxShadow: [
                     BoxShadow(
    color: Color.fromARGB(255, 184, 182, 182),
    // spreadRadius: 5,
    blurRadius: 1,
     blurStyle: BlurStyle.outer,
    // offset: const Offset(1,0),
  )
                    ],
                  ),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),




                  child: Container(
                    padding: EdgeInsets.all(30),
                    width: MediaQuery.of(context).size.width- 50,
                    height: 500.0,

                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          // spreadRadius: 5,
                          blurRadius: 30,
                          // blurStyle: BlurStyle.outer,
                          // offset: const Offset(1,0), 
                          )
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.2),
                        ],
                        stops: [0.0, 1.0],
                      )
                      // borderRadius: BorderRadius.circular(10.0),
                      // color: Colors.grey.shade200.withOpacity(0.5), 
                    ),
                   
                    // color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5)
            
                child: weatherData == null? CircularProgressIndicator():
                    
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("${weatherData!.location.name}, ${weatherData!.location.country}",
                            style: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 3.0,
                                color: const Color.fromARGB(255, 255, 255, 255))
                            ),
                         Text('${weatherData!.current.weatherDescriptions[0]}',
                            style: TextStyle(
                                fontSize: 20.0,
                                letterSpacing: 3.0,

                                // fontWeight: FontWeight.w100,
                                color: const Color.fromARGB(255, 255, 255, 255))
                            ),
                              Text('${weatherData!.current.temperature}°',
                            style: TextStyle(
                                fontSize: 70.0,
                                fontWeight: FontWeight.normal,
                                color: const Color.fromARGB(255, 255, 255, 255))
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text("Wind Speed",  style: TextStyle(
                                fontSize: 20.0,
                                letterSpacing: 3.0,

                                fontWeight: FontWeight.w100,
                                color: const Color.fromARGB(255, 255, 255, 255))
                          ),
                                    Text("${weatherData!.current.windSpeed}k/h",  style: TextStyle(
                                fontSize: 20.0,
                                letterSpacing: 3.0,

                                fontWeight: FontWeight.w100,
                                color: const Color.fromARGB(255, 255, 255, 255))
                          ),

                                  ],
                                ),
                                Container(
                                  height: 50,
                                  width: 2,
                                  color: const Color.fromARGB(255, 255, 255, 255),
                                )
                                ,
                                 Column(
                                  children: [
                                    Text("Humidity",  style: TextStyle(
                                fontSize: 20.0,
                                letterSpacing: 3.0,

                                fontWeight: FontWeight.w100,
                                color: const Color.fromARGB(255, 255, 255, 255))
                          ),
                                    Text("${weatherData!.current.humidity}%",  style: TextStyle(
                                fontSize: 20.0,
                                letterSpacing: 3.0,

                                fontWeight: FontWeight.w100,
                                color: const Color.fromARGB(255, 255, 255, 255))
                          ),

                                  ],
                                )
                              ],
                            )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
