part of 'pages.dart';

class DetailPage extends StatefulWidget {
  final String imageUrl;
  final String name;
  final double rating;
  final double price;
  final String address;

  DetailPage({
    this.imageUrl,
    this.name,
    this.rating,
    this.address,
    this.price,
  });
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.asset(
              widget.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                    color: kBackgroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: defaultMargin,
                          right: defaultMargin,
                          top: 30,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.name,
                                    style: blackTextStyle.copyWith(
                                      fontSize: 24,
                                      fontWeight: medium,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'Bali',
                                    style: greyTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: light,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 28,
                                  width: 28,
                                  margin: EdgeInsets.only(
                                    right: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/icon_star.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 2,
                                  ),
                                  child: Text(
                                    widget.rating.toString(),
                                    style: blackTextStyle.copyWith(
                                      fontWeight: medium,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          top: 18,
                          left: defaultMargin,
                          right: defaultMargin,
                        ),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: kGrey2Color,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Price starts from',
                              style: blackTextStyle,
                            ),
                            Text(
                             '\$'+ widget.price.toString(),
                              style: blueTextStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: defaultMargin),
                        child: Text(
                          'Main Facilities',
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultMargin,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              name: 'Restaurant',
                              imageUrl: 'assets/icon_restaurant.png',
                            ),
                            FacilityItem(
                              name: 'Hotel',
                              imageUrl: 'assets/icon_hotel.png',
                            ),
                            FacilityItem(
                              name: 'Masjid',
                              imageUrl: 'assets/icon_mosque.png',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 18,
                          left: defaultMargin,
                          right: defaultMargin,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Popular Spot',
                              style: blackTextStyle.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  PopularSpot(
                                    imageUrl: 'assets/image_product1.png',
                                  ),
                                  PopularSpot(
                                    imageUrl: 'assets/image_product2.jpg',
                                  ),
                                  PopularSpot(
                                    imageUrl: 'assets/image_product3.jpg',
                                  ),
                                  PopularSpot(
                                    imageUrl: 'assets/image_product4.jpg',
                                  ),
                                  PopularSpot(
                                    imageUrl: 'assets/image_des_lot.jfif',
                                  ),
                                  PopularSpot(
                                    imageUrl: 'assets/image_des_gangga.jfif',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 18,
                          left: defaultMargin,
                          right: defaultMargin,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Loacation',
                              style: blackTextStyle.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Row(children: [
                              Expanded(
                                child: Text(
                                  'Nusapenida, Kabupaten\nKlungkung, Bali',
                                  style: greyTextStyle.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Container(
                                height: 42,
                                width: 42,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/icon_location.png'),
                                  ),
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.all(defaultMargin),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 54,
                                height: 54,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/button_chat.png'))),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Container(
                                height: 54,
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    backgroundColor: kBlueColor,
                                  ),
                                  child: Text(
                                    'Add to Chart',
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: 18,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 46,
                      height: 40,
                    ),
                  ),
                  // Image.asset(
                  //   'assets/btn_wishlist.png',
                  //   width: 40,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
