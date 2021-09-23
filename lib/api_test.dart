import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class APITest extends StatefulWidget {
  @override
  _APITestState createState() => _APITestState();
}

class _APITestState extends State<APITest> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // getTransactionHistory();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTransactionHistory(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (!snapshot.hasData){
          return Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: CircularProgressIndicator(),
          );
        }
        else if (snapshot.hasData){
          print(snapshot.data);
          return Container();
        }
        else if(snapshot.hasError){
          print(snapshot.error);
          return Container();
        }
        else return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index){
                // print(snapshot.data!.transactionType);
                // final items = transactionHistories![index]['date'];
                // print(transactionHistories![index]['date']);
                // String date = items.date!; // this will get the data of the transaction from the list of returned items
                // String transactionType = items.transactionType!; // this will get the type of transaction
                // String description = items.description!; // this will get the details of the transaction
                // String amount = items.amount!; // this will get the details of the transaction amount
                //  print("hello");
                // print("date $date");
                return Card(
                  elevation: 3,
                  color: Colors.white,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "date",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              SizedBox(height: 20,),
                              Text(
                                "description",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  Text(
                                    "Amount: ",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text(
                                    "amount",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Text(
                            "transactionType",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                                fontWeight: FontWeight.w700
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
          );
      },
    );
  }
  Future getTransactionHistory() async {
    var queryParams = {
      'Destination': 'ABUJA',

    };
    var url = Uri.https("fmnapi.fmnplc.website","/api/fetchfreightcharges", queryParams);
    var response = await http.get(url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );
    var responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(responseData);
     // return jsonDecode(response.body);
    }
    // else {
    //   throw Exception('Failed to load data');
    // }
    return responseData;
  }
}
