import 'package:flutter/material.dart';
import 'package:smartkit/integration/helper/ColorsRes.dart';

class PaginationDesktop extends StatefulWidget {
  PaginationDesktop({Key key, this.title}) : super(key: key);
  final String title;

  @override
  PaginationStateDesktop createState() => new PaginationStateDesktop();
}

class PaginationStateDesktop extends State<PaginationDesktop> {

  int offset = 0;
  int perPageLimit = 12;

  final itemList = List<String>.generate(1000, (i) => "Item $i");
  List<String> tempList = [];
  ScrollController controller = new ScrollController();


  @override
  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
    setState(() {
      tempList.addAll(itemList.getRange(offset, offset + perPageLimit));
      offset = offset + perPageLimit;
    });
  }
  @override
  void dispose() {
    controller.removeListener(() {});
    super.dispose();
  }
  _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent && !controller.position.outOfRange) {
      if (this.mounted) {
        setState(() {
          if (perPageLimit < itemList.length)
            loadMore();
        });
      }
    }
  }

  void loadMore() {
    setState(() {
      if((offset + perPageLimit )> itemList.length) {
        tempList.addAll(
            itemList.getRange(offset, itemList.length));
      } else {
        tempList.addAll(
            itemList.getRange(offset, offset + perPageLimit));
      }
      offset = offset + perPageLimit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Pagination",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
          color: Colors.black
      ),),
      body:ListView.builder(controller: controller,
          itemCount: (offset < itemList.length) ? tempList.length + 1 : tempList.length,
          itemBuilder: (context, index) {
            return (index == tempList.length ) ?
            Container(
              child: TextButton(
                child: Center(child: CircularProgressIndicator()),
                onPressed: () {
                  loadMore();
                },
              ),
            ) :
            ListTile(contentPadding: EdgeInsets.all(20),
              title: Text('${tempList[index]}'),
              leading: CircleAvatar(backgroundColor: ColorsRes.appcolor,child: Text(index.toString(),style: TextStyle(color: ColorsRes.white)),),
              trailing: IconButton(icon: Icon(Icons.arrow_forward_ios),onPressed: (){},),
            );
          },
        ),
    );
  }
}
