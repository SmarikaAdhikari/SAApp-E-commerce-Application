import 'package:flutter/material.dart';
import 'package:app/widgets/searchwidget.dart';

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
              
            
              
              decoration: const InputDecoration(
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
          const SizedBox(
            height: 20,
          ),
      
          Stack(
            children: [
               Padding(
                 padding: const EdgeInsets.only(top: 20),
                 child: Container(
                               height: 200,
                               color: Colors.green[400],
                             ),
               ),
                Positioned(
               bottom:10 ,
               right: 10,
                
                

                 
                  child: Image.asset(
                    'view/kitabalaya.png',
                    fit: BoxFit.cover,
                    height: 150,
                    width: 180,
                          
                          
                        
                    ),
                  
                ),
           
            ],
          
          ),
           const SizedBox(
            height: 20,
          ),
        SizedBox(
          height: 120,
          
          child: ListView.builder(
            
            scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 20,
                          width: 20,
                          color: Colors.blue,
                        ),
                      );
                     
                    },
                    
                    ),
        ), 
        
      SizedBox(
          // height: 200,
          
          child: GridView.builder(
            // scrollDirection: Axis.vertical,
          // height: 200,
          shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
              
              ),
          itemBuilder: (context, index) {
            return searchWidget();
          },
          itemCount: 6,
          
        ),

      ),
        
      
      ]),
      ),
    )
    
    
    );
  }
}
