import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:spotegal/custom/dynamicLinkServices.dart';
import 'package:spotegal/models/model_spot.dart';
import 'package:spotegal/utils/constans_util.dart';

import 'feedBySpot.dart';
import 'informasiSpot.dart';

class DetailSpot extends StatefulWidget {
  final ModelSpot model;

  DetailSpot({
    this.model,
  });

  @override
  _DetailSpotState createState() => _DetailSpotState();
}

class _DetailSpotState extends State<DetailSpot> {
  DynamicLinkService _dynamicLinkService = DynamicLinkService();
  var url;
  shareLink() async {
    url = await _dynamicLinkService.createFirstPostLink(widget.model.idSpot);
    Share.share("Kunjungi link berikut untuk mengetahui detail spot kami $url");
    print(url);
  }

  @override
  void initState() {
    super.initState();
  }

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
                  "${ConstantsUtil.imgUrlSpot}/${widget.model.imgSpot}",
                  fit: BoxFit.cover,
                )),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.share),
                    tooltip: 'Share',
                    onPressed: () {
                      shareLink();
                    },
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
            InformasiSpot(widget.model),
          ]),
        ),
      ),
    );
  }
}
