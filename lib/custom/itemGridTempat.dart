import 'package:flutter/material.dart';
import 'package:spotegal/models/model_tempat.dart';
import 'package:spotegal/utils/constans_util.dart';

class ItemGridTempatWisata extends StatelessWidget {
  final ModelTempat model;
  ItemGridTempatWisata(this.model);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Hero(
              tag: "${model.idTempat}",
              child: Container(
                // color: Colors.black.withOpacity(0.8),
                child: Image.network(
                  "${ConstantsUtil.imgUrlTmpt}/${model.imgTempat}",
                  fit: BoxFit.cover,
                  height: 180,
                ),
              ),
            ),
          ),
          Text(
            "${model.nmTempat}",
            style: TextStyle(
              fontFamily: ("FontFavoritBold"),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.asset(
                        "assets/img/ic_lokasi.png",
                        height: 15,
                        width: 15,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(model.lokTempat,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontFamily: ("FontBiasa"),
                          fontSize: 13,
                        )),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.asset(
                        "assets/img/ic_rupiah.png",
                        height: 15,
                        width: 15,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(model.tktTempat,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontFamily: ("FontBiasa"),
                          fontSize: 13,
                        )),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
