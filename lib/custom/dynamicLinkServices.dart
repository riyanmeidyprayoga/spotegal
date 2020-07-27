// import 'package:cybereyecommunity/screen/tutorial/tutorialDetailFirebase.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class DynamicLinkService {
  Future handleDynamicLinks(BuildContext context) async {
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();

    _handleDeepLink(context, data);

    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      _handleDeepLink(context, dynamicLink);
    }, onError: (OnLinkErrorException e) async {
      print('Link Failed: ${e.message}');
    });
  }

  void _handleDeepLink(BuildContext context, PendingDynamicLinkData data) {
    final Uri deepLink = data?.link;
    if (deepLink != null) {
      print('_handleDeepLink | deeplink: $deepLink');

      var isPost = deepLink.pathSegments.contains('tutorial-detail.php');
      print(deepLink.pathSegments);
      if (isPost) {
        var title = deepLink.queryParameters['id'];
        print(title);

        if (title != null) {
          print("execute");
          // Route route = MaterialPageRoute(
          //     builder: (context) => TutorialDetailFirebaseDynamicLink(
          //           slug: title,
          //         ));
          // Navigator.push(context, route);
        }
      }
    }
  }

  Future<Uri> createFirstPostLink(String title) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://spottegal.page.link',
      link: Uri.parse(
          'https://cybereye-community.id/tutorial-detail.php?id=$title'),
      androidParameters: AndroidParameters(
        packageName: 'com.spottegal.android',
      ),
      // iosParameters: IosParameters(
      //   bundleId: 'id.cybereyecommunity.ios',
      //   minimumVersion: '1.0.1',
      //   appStoreId: '123456789',
      // ),
      // googleAnalyticsParameters: GoogleAnalyticsParameters(
      //   campaign: 'example-promo',
      //   medium: 'social',
      //   source: 'orkut',
      // ),
      // itunesConnectAnalyticsParameters: ItunesConnectAnalyticsParameters(
      //   providerToken: '123456',
      //   campaignToken: 'example-promo',
      // ),
      // socialMetaTagParameters: SocialMetaTagParameters(
      //   title: 'Example of a Dynamic Link',
      //   description: 'This link works whether app is installed or not!',
      // ),
    );

    final link = await parameters.buildUrl();
    final ShortDynamicLink shortenedLink =
        await DynamicLinkParameters.shortenUrl(
      link,
      DynamicLinkParametersOptions(
          shortDynamicLinkPathLength: ShortDynamicLinkPathLength.unguessable),
    );
    return shortenedLink.shortUrl;
    // return dynamicUrl.toString();
  }
}
