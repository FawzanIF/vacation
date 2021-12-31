part of 'pages.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor2)));

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: defaultMargin,
          bottom: 14,
        ),
        child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
          if (userState is UserLoaded) {
            if (imageFileToUpload != null) {
              uploadImage(imageFileToUpload).then((downloadURL) { 
                imageFileToUpload = null;
                context
                    .bloc<UserBloc>()
                    .add(UpdateData(profileImage: downloadURL));
              });
            }

            return Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        child: Text(
                          "Hello, \n" + userState.user.name,
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Where’re you on vacation today?',
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Stack(
                    children: <Widget>[
                      SpinKitFadingCircle(
                        color: kBlueColor,
                        size: 70,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.bloc<PageBloc>().add(GoToEditProfilePage(
                              (userState as UserLoaded).user));
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: kWhiteColor,
                              width: 4,
                            ),
                            image: DecorationImage(
                                image: (userState.user.profilePicture == ""
                                    ? AssetImage("assets/user_pic.png")
                                    : NetworkImage(
                                        userState.user.profilePicture)),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return SpinKitFadingCircle(
              color: kBlueColor,
              size: 50,
            );
          }
        }),
      );
    }

    Widget searchDestination() {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchPage(),
            ),
          );
        },
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kWhiteColor,
          ),
          child: Row(
            children: [
              Icon(
                Icons.search_rounded,
                color: kGreyColor,
                size: 36.0,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'Find a Magical Place',
                style: greyTextStyle,
              ),
            ],
          ),
        ),
      );
    }

    Widget recommendedTitle() {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 14, defaultMargin, 14),
        child: Text(
          'Recommended',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget recommendedProduct() {
      return Container(
        margin: EdgeInsets.only(left: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              RecommemdedTile(
                name: 'Nusa Penida',
                imageUrl: 'assets/image_product1.png',
                rating: 4.9,
                price: 27,
                gmaps: 'https://goo.gl/maps/f39DqS5sBuGmkfUq6',
              ),
              RecommemdedTile(
                name: 'Panglipuran',
                imageUrl: 'assets/image_product4.jpg',
                rating: 4.9,
                price: 12,
                gmaps: 'https://goo.gl/maps/tQNCxVocQA6T1kX26'
              ),
              RecommemdedTile(
                name: 'Garuda Wisnu Kencana',
                imageUrl: 'assets/image_product2.jpg',
                rating: 4.8,
                price: 17,
                gmaps: 'https://g.page/gwkbali?share',
              ),
              RecommemdedTile(
                name: 'Pura Besakih',
                imageUrl: 'assets/image_product3.jpg',
                rating: 4.8,
                price: 9,
                gmaps: 'https://goo.gl/maps/hxNE2EkgBz65oboK6',
              ),
            ],
          ),
        ),
      );
    }

    Widget vacationSpotTitle() {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 14, defaultMargin, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(
                'Vacation Spot',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 18,
                ),
              ),
            ),
            Icon(
              Icons.fiber_manual_record,
              size: 26,
              color: kBlueColor,
            ),
            Icon(
              Icons.fiber_manual_record,
              size: 26,
              color: kBlueColor,
            ),
          ],
        ),
      );
    }

    Widget vacationProduct() {
      return Container(
          margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin),
          child: Column(
            children: [
              DestinationTile(
                name: 'Tirta Gangga',
                imageUrl: 'assets/image_des_gangga.jfif',
                rating: 4.5,
                price: 8,
                gmaps: 'https://g.page/Taman-Tirtagangga?share',
              ),
              DestinationTile(
                name: 'Tanah Lot',
                imageUrl: 'assets/image_des_lot.jfif',
                rating: 4.3,
                price: 21,
                gmaps: 'https://goo.gl/maps/1vfkg2aVRRnWDqb99'
              ),
              DestinationTile(
                name: 'Canggu',
                imageUrl: 'assets/image_des_canggu.jfif',
                rating: 4.5,
                price: 18,
                gmaps: 'https://goo.gl/maps/xzVR3cduKLg76U5T9'
              ),
              DestinationTile(
                name: 'Bedugul',
                imageUrl: 'assets/image_des_bedegul.jfif',
                rating: 4.7,
                price: 7,
                gmaps: 'https://goo.gl/maps/HJf6cFkZjZ9QfNiE9'
              ),
            ],
          ));
    }

    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToStartMenu());

        return;
      },
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                searchDestination(),
                recommendedTitle(),
                recommendedProduct(),
                vacationSpotTitle(),
                vacationProduct(),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
