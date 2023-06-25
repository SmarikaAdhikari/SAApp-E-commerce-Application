import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    body: 
    SingleChildScrollView(
      child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
           
            decoration: BoxDecoration(
               color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(40)
            ),
            child: TextFormField(
              
            
              
              decoration:  InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size:30 ,
                  color: Colors.black,
                ),
               
                                           hintText: "what are you looking for?",
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18
          
                                        ),
                                       
                                     border: InputBorder.none
                                      ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
      
          Stack(
            children: [
               Padding(
                 padding: const EdgeInsets.only(top: 20),
                 child: Container(
                               height: 200,
                               color: Colors.blue,
                             ),
               ),
                Positioned(
               top: 0,
               right: 0,

                

                 
                  child: Image.asset(
                    'view/bookl.png',
                    fit: BoxFit.cover,
                    height: 180,
                    width: 180,
                          
                          
                        
                    ),
                  
                ),
           
            ],
          
          ),
           SizedBox(
            height: 20,
          ),
        Container(
          height: 80,
          
          child: ListView.builder(
            
            scrollDirection: Axis.horizontal,
            
                  
                    itemCount: 20,
                    
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 20,
                          width: 20,
                          color: Colors.red,
                        ),
                      );
                     
                    },
                    
                    ),
        ), 
        
      Container(
          // height: 200,
          
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) => FlutterLogo(),
      itemCount: 6,
      ),
        ),
        
      
      ]),
      ),
    )
    
    
    );
  }
}