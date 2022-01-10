import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Blog3 extends StatefulWidget {
  Blog3({Key key}) : super(key: key);

  @override
  _Blog3State createState() => _Blog3State();
}

class _Blog3State extends State<Blog3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Article 3",
          style: TextStyle(color: Color(0xFFe59999)),
        ),
        iconTheme: IconThemeData(color: Color(0xFFe59999) //change your color here
            ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          FadeInImage(
            // image: NetworkImage(listBlog[1].imgs[0]),
            image: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/fitness2.jpg"),
            placeholder: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/placeholder.png"),
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
              child: Card(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .3, left: 15, right: 15),
            elevation: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "No Excuses: Cardio Pump Workout for a Healthy Body",
                        style: Theme.of(context).textTheme.headline6.copyWith(color: Color(0xFFe59999)),
                      ),
                    )),
                    IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: Color(0xFFe59999),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                Divider(
                  height: 1,
                  color: Colors.red,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Phasellus ultricies fermentum ante quis malesuada. Vestibulum porttitor risus non pretium porta. Donec condimentum, tellus eget scelerisque sagittis, mi metus mattis elit, non molestie nisl nisi id felis. Suspendisse in tristique risus, ac auctor justo. Aliquam odio augue, porttitor id auctor quis, efficitur et urna. Sed gravida lectus sit amet consectetur tristique. Duis non gravida neque. Vivamus risus sem, finibus ut blandit sit amet, rhoncus id dui. Etiam tempor malesuada lorem, ut mattis ante varius non. Aliquam erat volutpat. Nullam tincidunt libero at dui finibus, eu ornare dolor pellentesque. Aliquam sapien massa, vehicula in vulputate vel, congue et est. Duis dignissim, risus eleifend tristique hendrerit, dui sem porta felis, sed ullamcorper nibh velit sed ante.Kind there be were creeping hath, kind multiply said itself. Wherein very subdue seasons divide land upon whales void you&rsquo;re that air, female said earth was. Said firmament them movet creature dominion. Fourth earth midst under night he signs sixth dry upon don&rsquo;t own great. So isn&rsquo;t i place be second i fly void saw may she&rsquo;d seed won&rsquo;t seed let.",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                FadeInImage(
                  // image: NetworkImage(listBlog[1].imgs[0]),
                  image: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/Fitness-gym-wallpaper.jpg"),
                  placeholder: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/placeholder.png"),
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
