import 'package:flutter/material.dart';
import 'package:news_app_api/model/card_model.dart';
import 'package:news_app_api/service/web_view.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key, required this.cardModel});
  final CardModel cardModel;
  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context)=>WebView(url:widget.cardModel.url)));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(139, 81, 52, 77),
          ),
          padding: const EdgeInsets.all(20),
          width:double.infinity,
          height: 500, // Adjust as needed
          child: Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        widget.cardModel.img,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  ListTile(
                    title: Text(widget.cardModel.author,style:const TextStyle(fontSize: 20,color: Color(0xAAe7ebc5)),maxLines:1 ,
                      overflow: TextOverflow.clip,
                    ),
                    subtitle:
                        Text("${widget.cardModel.date}   ${widget.cardModel.time}",style:const TextStyle(fontSize: 12,
                            color: Color.fromARGB(255, 173, 166, 70))),
                    trailing: Text("By ${widget.cardModel.name}",style:const TextStyle(fontSize: 18,color: Color(0xAAe7ebc5)),),
                  ),
                  const SizedBox(height: 5),
                  Text(widget.cardModel.title,style:const TextStyle(fontSize: 17.5,color:Color.fromARGB(255, 173, 166, 70))),
                  Text(widget.cardModel.description,style:const TextStyle(fontSize: 15,color:Color(0xAA989788)),maxLines:7,overflow: TextOverflow.ellipsis,),
                ],
              ),]
            ),
          ),
        ),
      ),
    );
  }
}
