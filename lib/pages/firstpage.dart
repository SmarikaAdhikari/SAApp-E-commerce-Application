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
  Padding(
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

        Container(
          height: 300,
          color: Colors.red,
          child: Stack(
            children: [
               Container(
              height: 200,
              color: Colors.blue,
            ),
                Card(child:
                  
            Positioned(
              top: 0,
              left: 50,
              right: 50,
              bottom: 0,
              child: Image.asset(
              'view/books.jpg',
              fit: BoxFit.cover,
              height: 100,
                    
                    
                  
              ),
            )),
           
            ],
        
          ),
        
        
        
        
        
        
          
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
    ]),
  )


    );
  }
}