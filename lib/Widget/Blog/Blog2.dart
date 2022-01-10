import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Blog2 extends StatefulWidget {
  Blog2({Key key}) : super(key: key);

  @override
  _Blog2State createState() => _Blog2State();
}

class _Blog2State extends State<Blog2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFe59999) //change your color here
            ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          "News Blog",
          style: TextStyle(color: Color(0xFFe59999)),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.share,
                color: Color(0xFFe59999),
              ),
              onPressed: null),
          IconButton(
              icon: Icon(
                Icons.bookmark_border,
                color: Color(0xFFe59999),
              ),
              onPressed: null)
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Discover the Most Magical Sunset in Santorini",
                style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.grey),
              ),
            ),
            FadeInImage(
              image: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/sunset.jpg"),
              placeholder: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/placeholder.png"),
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .35,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla posuere luctus ante quis consectetur. Sed porta nulla sit amet nisl finibus vehicula. Ut vitae arcu ut odio hendrerit venenatis. Nulla non odio maximus, faucibus libero at, dapibus velit. Ut eu porttitor lorem. Fusce eget euismod lacus. Cras ligula enim, pulvinar ut nulla in, faucibus suscipit diam.Phasellus cursus ligula ac augue eleifend egestas. Nunc in volutpat odio. In interdum orci fringilla enim rhoncus, vel venenatis tortor convallis. Nulla cursus blandit est. Curabitur convallis ipsum in mauris efficitur, nec pharetra sem lobortis. Suspendisse faucibus porta facilisis. Mauris fringilla elit quam, ut tempor est egestas a. Suspendisse potenti. Phasellus vel arcu velit. Mauris a nunc quam. Praesent rutrum rutrum turpis sed tempus. Aliquam sed mauris lacinia, pharetra odio sit amet, dapibus neque.Etiam interdum elit erat, sit amet dictum ligula vehicula in. Vestibulum imperdiet ornare tristique. Donec id magna quis augue gravida ornare. Nunc erat lacus, suscipit sed semper vitae, auctor et ante. Pellentesque ornare tincidunt velit, eget fermentum velit interdum a. Pellentesque consectetur, ante sed pulvinar blandit, leo orci posuere ante, pellentesque mattis odio erat nec orci. Integer euismod tristique metus. Nam consectetur ipsum elit, quis tempus lacus convallis et.Phasellus non fringilla sapien. Aenean eget nisl euismod, congue massa vitae, cursus nisi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus ultricies eget urna ac imperdiet. Donec eleifend ut libero quis tincidunt. Etiam malesuada tempor lorem, a tempor nibh eleifend et. Praesent condimentum dui vitae lectus interdum cursus.Phasellus ultricies fermentum ante quis malesuada. Vestibulum porttitor risus non pretium porta. Donec condimentum, tellus eget scelerisque sagittis, mi metus mattis elit, non molestie nisl nisi id felis. Suspendisse in tristique risus, ac auctor justo. Aliquam odio augue, porttitor id auctor quis, efficitur et urna. Sed gravida lectus sit amet consectetur tristique. Duis non gravida neque. Vivamus risus sem, finibus ut blandit sit amet, rhoncus id dui. Etiam tempor malesuada lorem, ut mattis ante varius non. Aliquam erat volutpat. Nullam tincidunt libero at dui finibus, eu ornare dolor pellentesque. Aliquam sapien massa, vehicula in vulputate vel, congue et est. Duis dignissim, risus eleifend tristique hendrerit, dui sem porta felis, sed ullamcorper nibh velit sed ante.",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(
          Icons.thumb_up,
          color: Color(0xFFe59999),
        ),
        backgroundColor: Colors.white70,
      ),
    );
  }
}
