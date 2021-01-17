import 'package:flutter/material.dart';
import 'package:loadjson/model/user.dart';
import 'package:loadjson/api/user_api.dart';

class UserNetworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color(0xFFf2f6f9),
        body: FutureBuilder<List<User>>(
          future: UsersApi.getUser(),
          builder: (context, snapshot) {
            final users = snapshot.data;

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(child: Text('Some error occurred!'));
                } else {
                  return buildUsers(users);
                }
            }
          },
        ),
      );

  Widget buildUsers(List<User> users) => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          return Column(
            children: [
              Container(
                alignment: Alignment(-0.5, 0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                color: Color(0xFFfd5a51),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 168),
                      child: Text("Indonesia, 2021",
                          style: new TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontFamily: 'PoppinsSMBold')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 14, top: 5.0),
                      child: Text("Corona Virus Cases",
                          style: new TextStyle(
                              fontSize: 26.0,
                              color: Colors.white,
                              fontFamily: 'PoppinsExBold')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: new Text("1.040,159",
                          style: new TextStyle(
                            fontSize: 50.0,
                            color: Colors.white,
                            fontFamily: 'PoppinsSMBold',
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Deaths",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontFamily: 'PoppinsExBold'),
                          ),
                          Text(
                            user.meninggal,
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.red,
                              fontFamily: 'PoppinsSMBold',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Recovered",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontFamily: 'PoppinsExBold'),
                          ),
                          Text(
                            user.sembuh,
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.green,
                              fontFamily: 'PoppinsSMBold',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Active Case",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontFamily: 'PoppinsExBold'),
                          ),
                          Text(
                            user.positif,
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.black,
                                fontFamily: 'PoppinsSMBold'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Treated Cases",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontFamily: 'PoppinsExBold'),
                          ),
                          Text(
                            user.dirawat,
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.black,
                                fontFamily: 'PoppinsSMBold'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
}
