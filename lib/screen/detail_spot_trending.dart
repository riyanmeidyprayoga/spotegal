import 'package:flutter/material.dart';
import 'package:spotegal/models/trendingModel.dart';
import 'package:spotegal/screen/feedBySpot.dart';
import 'package:spotegal/utils/constans_util.dart';

// import 'feedBySpotTrending.dart';
import 'informasiSpotTrending.dart';

class DetailSpotTrending extends StatefulWidget {
  final TrendingModel model;

  DetailSpotTrending({
    this.model,
  });

  @override
  _DetailSpotTrendingState createState() => _DetailSpotTrendingState();
}

class _DetailSpotTrendingState extends State<DetailSpotTrending> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.lightBlue,
                  expandedHeight: 300.0,
                  floating: false,
                  pinned: true,
                  title: Text(
                    widget.model.nmSpot,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                    "${ConstantsUtil.imgUrlSpot}/${widget.model.photo}",
                    fit: BoxFit.cover,
                  )),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.share),
                      tooltip: 'Share',
                      onPressed: () {/* ... */},
                    ),
                  ],
                  bottom: TabBar(tabs: [
                    Tab(
                      text: "Feed",
                    ),
                    Tab(
                      text: "Detail",
                    ),
                  ]),
                ),
              ];
            },
            body: TabBarView(children: [
              FeedbySpot(widget.model.idSpot),
              InformasiSpotTrending(widget.model),
            ])),
      ),
    );
  }
}
