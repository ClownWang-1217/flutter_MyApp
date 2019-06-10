import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      color: Colors.green,
      home:  Center(
      child: Container(
         height: 200.0,
        width: 200.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(
            color: Colors.black,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(150.0),
          image: DecorationImage(
              image: NetworkImage(
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559280429315&di=6fa6df33b5a88d3f9a2b61b1424b875b&imgtype=0&src=http%3A%2F%2Fimg1.2345.com%2Fduoteimg%2FqqTxImg%2F11%2F20126617171111586736.jpg')),
        ),
      ),
    ),
    ); 
  }
}

// class stateHomePage extends State<homePage> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Center(
//       child: Container(
//         padding: EdgeInsets.all(80.0),
//         color: Colors.green,
//         decoration: BoxDecoration(
//           color: Colors.blue,
//           border: Border.all(
//             color: Colors.black,
//             width: 3.0,
//           ),
//           borderRadius: BorderRadius.circular(150.0),
//           image: DecorationImage(
//               image: NetworkImage(
//                   'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559280429315&di=6fa6df33b5a88d3f9a2b61b1424b875b&imgtype=0&src=http%3A%2F%2Fimg1.2345.com%2Fduoteimg%2FqqTxImg%2F11%2F20126617171111586736.jpg')),
//         ),
//       ),
//     );
//   }
// }
