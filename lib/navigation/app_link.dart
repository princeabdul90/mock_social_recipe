/*
* Developer: Abubakar Abdullahi
* Date: 29/06/2022
*/
class AppLink {
  static const String kHomePath = '/home';
  static const String kOnboarding = '/onboarding';
  static const String kLoginPath = '/login';
  static const String kProfilePath = '/profile';
  static const String kItemPath = '/item';

  static const String kTabParam = 'tab';
  static const String kIdParam = 'id';

  String? location;
  int? currentTab;
  String? itemId;

  AppLink({
    this.location,
    this.currentTab,
    this.itemId,
});

  //todo: Add fromLocation
  static AppLink fromLocation(String? location){
    location = Uri.decodeFull(location ?? '');
    final uri = Uri.parse(location);
    final params = uri.queryParameters;

    final currentTab = int.tryParse(params[AppLink.kTabParam] ?? '');
    final itemId = params[AppLink.kIdParam];
    final link = AppLink(
        location: uri.path,
      currentTab: currentTab,
      itemId: itemId,
    );

    return link;
  }

  //todo: Add toLocation
  String toLocation() {
    String addKeyValPair({
      required String key,
      String? value,
    }) => value == null ? '' : '${key}=$value&';

    switch (location) {
      case kLoginPath:
        return kLoginPath;

      case kOnboarding:
        return kOnboarding;

      case kProfilePath:
        return kProfilePath;

      case kItemPath:
       var loc = '$kItemPath?';
       loc += addKeyValPair(
           key: kIdParam,
           value: itemId,
       );
       return Uri.encodeFull(loc);

      default:
        var loc = '$kHomePath?';
        loc += addKeyValPair(
            key: kTabParam,
            value: currentTab.toString(),
        );
        return Uri.encodeFull(loc);
    }
  }
}