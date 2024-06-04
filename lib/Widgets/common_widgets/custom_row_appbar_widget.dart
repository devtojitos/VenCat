import 'package:flutter/material.dart';

class CustomRowAppbarWidget extends StatelessWidget {
  const CustomRowAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Row(
          children: [
            Icon(Icons.schedule),
            Text("VenCat"),
          ],
        ),
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(color: Colors.red,shape: BoxShape.circle,),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  radius: 20,
                  child: Icon(Icons.message),
                ),
              ),
            ),
            SizedBox(width: 5,),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(color: Colors.green,shape: BoxShape.circle,),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  radius: 20,
                  child: Icon(Icons.person),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
