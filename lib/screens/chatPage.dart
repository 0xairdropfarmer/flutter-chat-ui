import 'package:ChatUI/models/chatUsersModel.dart';
import 'package:ChatUI/widgets/conversationList.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Kriss Benwat", messageText: "Good to know", imageURL: "https://randomuser.me/api/portraits/men/5.jpg", time: "Today"),
    ChatUsers(name: "Rezi Makarov", messageText: "its been a while", imageURL: "https://randomuser.me/api/portraits/women/13.jpg", time: "Today"),
    ChatUsers(name: "Gustav Lemelo", messageText: "Hey, where are you?", imageURL: "https://randomuser.me/api/portraits/men/50.jpg", time: "Yesterday"),
    ChatUsers(name: "Bob Ryder", messageText: "Its over!", imageURL: "https://randomuser.me/api/portraits/men/82.jpg", time: "28 Jan"),
    ChatUsers(name: "Ken Simada", messageText: "Your Welcome!", imageURL: "https://randomuser.me/api/portraits/men/90.jpg", time: "24 Jan"),
    ChatUsers(name: "Emma Walkins", messageText: "I am going out!", imageURL: "https://randomuser.me/api/portraits/women/43.jpg", time: "19 Jan"),
    ChatUsers(name: "Gilbert Hamminway", messageText: "Just attach the Image and send it.", imageURL: "https://randomuser.me/api/portraits/men/3.jpg", time: "12 Jan"),
    ChatUsers(name: "Bella Hammers", messageText: "The UI is sexy", imageURL: "https://randomuser.me/api/portraits/women/22.jpg", time: "5 Jan"),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                    Container(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add,color: Colors.pink,size: 20,),
                          SizedBox(width: 2,),
                          Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3)?true:false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}