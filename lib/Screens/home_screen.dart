import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {



  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {


  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: height * 0.6,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.grey[300],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Current Task", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        // hintText: 'Email',
                        label: Text('Name'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),

                        suffixIcon: nameController.text.isEmpty
                            ? Container(
                          width: 0,
                        )
                            : IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            nameController.clear();
                          },
                        ),
                        //email input decoration
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        // hintText: 'Email',
                        label: Text('Address'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),

                        suffixIcon: addressController.text.isEmpty
                            ? Container(
                          width: 0,
                        )
                            : IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            addressController.clear();
                          },
                        ),
                        //email input decoration
                      ),
                      keyboardType: TextInputType.streetAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: mobileController,
                      decoration: InputDecoration(
                        // hintText: 'Email',
                        label: Text('Mobile No.'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),

                        suffixIcon: mobileController.text.isEmpty
                            ? Container(
                          width: 0,
                        )
                            : IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            mobileController.clear();
                          },
                        ),
                        //email input decoration
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("From: Krishna Ojha",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        Container(
                          height: 35,
                          width: 85,
                          child: Center(
                              child: Text(
                                'Status',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Colors.orange[300],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
            child: Text("Upcoming Task", style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 5),
            child: Container(
              height: height * 0.15,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.grey[300],
              ),
              child: Column(
                children: [
                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Text("Tilak Nagar, Bikaner",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                           Icon(Icons.arrow_downward,size: 30,),
                           Text("Mp colony, Bikaner",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                         ],
                       ),
                       GestureDetector(
                         onTap: (){


                         },
                         child: Container(
                           height: 35,
                           width: 85,
                           child: Center(
                               child: Text(
                                 'Start',
                                 style: TextStyle(
                                     fontSize: 15,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.white),
                               )),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(15)),
                             color: Colors.orange[300],
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
