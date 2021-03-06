part of 'pages.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": "Nusa Penida",
      "imageUrl": 'assets/image_product1.png',
      "rating": 4.8.toDouble(),
      "price": 27.toDouble(),
    },
    {
      "id": 2,
      "name": "Panglipuran",
      "imageUrl": 'assets/image_product4.jpg',
      "rating": 4.9.toDouble(),
      "": 12.toDouble(),
    },
    {
      "id": 3,
      "name": "Garuda Wisnu Kencana",
      "imageUrl": 'assets/image_product2.jpg',
      "rating": 4.8.toDouble(),
      "price": 17.toDouble(),
    },
    {
      "id": 4,
      "name": "Pura Besakih",
      "imageUrl": 'assets/image_product3.jpg',
      "rating": 4.8.toDouble(),
      "price": 9.toDouble(),
    },
    {
      "id": 5,
      "name": "Tirta Gangga",
      "imageUrl": 'assets/image_des_gangga.png',
      "rating": 4.5.toDouble(),
      "price": 8.toDouble(),
    },
    {
      "id": 6,
      "name": "Tanah Lot",
      "imageUrl": 'assets/image_des_lot.png',
      "rating": 4.3.toDouble(),
      "price": 21.toDouble(),
    },
    {
      "id": 7,
      "name": "Canggu",
      "imageUrl": 'assets/image_des_canggu.png',
      "rating": 4.5.toDouble(),
      "price": 18.toDouble(),
    },
    {
      "id": 8,
      "name": "Bedugul",
      "imageUrl": 'assets/image_des_bedegul.png',
      "rating": 4.7.toDouble(),
      "price": 7.toDouble(),
    },
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
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
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) => _runFilter(value),
                      style: greyTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Find a Magical Place',
                        hintStyle: greyTextStyle,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    imageUrl: _foundUsers[index]['imageUrl'],
                                    name: _foundUsers[index]['name'],
                                    rating: _foundUsers[index]["rating"],
                                    price: _foundUsers[index]['price'],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(top: 14),
                              decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    margin: EdgeInsets.only(right: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          _foundUsers[index]['imageUrl'],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _foundUsers[index]['name'],
                                          style: blackTextStyle.copyWith(
                                            fontSize: 18,
                                            fontWeight: medium,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Bali',
                                          style: greyTextStyle.copyWith(
                                            fontWeight: light,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        margin: EdgeInsets.only(
                                          right: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/icon_star.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '4.8',
                                        style: blackTextStyle.copyWith(
                                          fontWeight: medium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ))
                  : Center(
                      child: Text(
                        'No results found',
                        style: greyTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
