import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:summer_iub_app/screens/coffe_records_screen.dart';
import 'package:summer_iub_app/screens/create_coffee_record_screen.dart';
import 'package:summer_iub_app/state_management/coffee_state_management.dart';
import 'package:summer_iub_app/widgets/app_backgroud_design_widget.dart';
import 'package:summer_iub_app/screens/firebase_coffee_records.dart';



// ACM

class HomePage extends StatefulWidget {
  // Attribute
  final String pageTitle;

  // Constructor
  const HomePage({super.key, required this.pageTitle});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int _coffeeCount = 0;

  Future<void> incrememntCoffeeCount() async{
    _coffeeCount++;
    setState((){}); // For giving user some feedba
    print("Coffee Count: $_coffeeCount");

    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    Map<String, dynamic> data = {
      "coffee_count": _coffeeCount,
      "timestamp": Timestamp.now(),
      "Dummy_data": "This is a dummy data for testing purposes."
  };
  
  final response =await firestore.collection("count_collection").add(data);
  print("Data added to Firestore with ID: ${response.id}");
  final DocumentSnapshot dataCollected = await firestore.collection("count_collection").doc(response.id).get();
  print("Data Collected from Firestore: ${dataCollected.data()}");
  }

  void navigateToCoffeeRecordsScreen() {
   Navigator.of(context)
   .push(MaterialPageRoute(builder: (context) =>  CoffeRecordsScreen()));
  }

   void navigateToCreateCoffeeRecordScreen() {
   Navigator.of(context)
   .push(MaterialPageRoute(builder: (context) =>  CreateCoffeeRecordScreen()));
  }
  void navigateToFirebaseCoffeeRecordScreen() {
   Navigator.of(context)
   .push(MaterialPageRoute(builder: (context) =>  firebaseCoffeRecordsScreen()));
  }



  // Methods
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pageTitle,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.00,
          ),
        ),
        backgroundColor: Colors.brown,
      ),


      // * * * * -> Row

      // * 
      // * 
      // *
      // Column

      body: AppBackgroudDesignWidget(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.brown.shade600,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 10.00,
                  horizontal: 20.00,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 25.00,
                ),
                child: Column(
                  children: [
                    Text(
                      "Welcome To Coffe House",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.00,
                        fontWeight: FontWeight.bold,
                      )
                    ),
      
                    // ---------------------------------------------------------
                    SizedBox(height: 10.00),
                    // ---------------------------------------------------------
      
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Expanded(
                        //   flex: 3,
                        //   child: Icon(
                        //     Icons.local_cafe,
                        //     color: Colors.white,
                        //     size: 30.00,
                        //   ),
                        // ),
      
                        // Expanded(
                        //   flex: 3,
                        //   child: Icon(
                        //     Icons.sunny,
                        //     color: Colors.white,
                        //     size: 30.00,
                        //   ),
                        // ),
      
                        // Expanded(
                        //   flex: 3,
                        //   child: Icon(
                        //     Icons.map,
                        //     color: Colors.white,
                        //     size: 30.00,
                        //   ),
                        // ),
      
                        ElevatedButton.icon(
                          onPressed:(){
                            navigateToCreateCoffeeRecordScreen();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 50.00,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Colors.brown,
                          ),
                          label: Text(
                            "Order Now",
                            style: TextStyle(
                              color: Colors.brown,
                              fontSize: 18.00,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
      
                        SizedBox(width: 10.00),
      
                        IconButton.filled(
                          onPressed: (){
                            navigateToCoffeeRecordsScreen();
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.brown,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 30.00,
                          ),
                        ),
                       
                        
                      ],
                    ),
                    SizedBox(height: 10.00),
                    ElevatedButton.icon(
                          onPressed:(){
                            navigateToFirebaseCoffeeRecordScreen();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 50.00,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Colors.brown,
                          ),
                          label: Text(
                            "Check Firebase",
                            style: TextStyle(
                              color: Colors.brown,
                              fontSize: 18.00,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                  ],
                ),
              ),
      
              SizedBox(height: 30.00),
      
      
              // --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
              Text(
                  "How many coffee cups did you drink today?",
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 18.00,
                  )
                ),
        
              // --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
              Text(
                _coffeeCount.toString(),
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 36.00,
                  fontWeight: FontWeight.bold,
                )
              ),
            
            ],
          )
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          incrememntCoffeeCount();
        },
        child: Icon(Icons.local_cafe),
      ),
    );
  }
}
