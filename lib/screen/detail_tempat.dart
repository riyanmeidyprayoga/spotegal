import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:spotegal/custom/dynamicLinkServices.dart';
import 'package:spotegal/models/model_tempat.dart';
import 'package:spotegal/screen/feedTempat.dart';
import 'package:spotegal/screen/informasi_tempat.dart';
import 'package:spotegal/utils/constans_util.dart';

class DetailTempat extends StatefulWidget {
  final ModelTempat model;

  DetailTempat({
    this.model,
  });

  @override
  _DetailTempatState createState() => _DetailTempatState();
}

class _DetailTempatState extends State<DetailTempat> {
  DynamicLinkService _dynamicLinkService = DynamicLinkService();
  var url;
  shareLink() async {
    url = await _dynamicLinkService.createFirstPostLink(widget.model.idTempat);
    Share.share("Kunjungi link berikut untuk mengetahui detail spot kami $url");
    print(url);
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
                    widget.model.nmTempat,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                      // centerTitle: true,

                      background: Hero(
                    tag: "${widget.model.idTempat}",
                    child: Image.network(
                      "${ConstantsUtil.imgUrlTmpt}/${widget.model.imgTempat}",
                      fit: BoxFit.cover,
                    ),
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
            body: TabBarView(
              children: [
                FeedTempat(
                  model: widget.model,
                ),
                InformasiDetailTempat(
                  model: widget.model,
                )
              ],
            )),
      ),
    );
  }
}
