import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task6/Models/PropertyModel.dart';
import 'package:task6/Models/SpaceModel.dart';
import 'package:task6/Navigation/Navigation.dart';
import 'package:task6/Provider/PropertyProvider.dart';
import 'package:task6/Provider/UserProvider.dart';
import '../Shared_widgets/Carousel.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    initiate();
  }

  void initiate() async {
    await Provider.of<PropertyProvider>(context, listen: false)
        .loadAvailableProperties();
  }
void _showLogoutConfirmationDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Logout Confirmation'),
        content: Text('Are you sure you want to logout?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context); 
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
               Navigator.pop(context);
               Provider.of<UserProvider>(context, listen: false).signout();
               Provider.of<PropertyProvider>(context, listen: false).setSelectedProperty(null);
            },
            child: Text('Logout'),
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(390, 160),
        child: Consumer<PropertyProvider>(
          builder: (context, propertyProvider, child) {
            List<PropertyModel> properties = propertyProvider.properties;
            PropertyModel? selectedProperty =
                propertyProvider.selectedProperty;
            return SafeArea(
              child: AppBar(
                backgroundColor: Color(0xFF3C4955),
                toolbarHeight: 160,
                automaticallyImplyLeading: false,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                title: Column(
                  children: [
                    SizedBox(height: 5),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(10, 0, 14.0, 0),
                            child: SvgPicture.asset(
                              'assets/burger.svg',
                              color: Colors.white,
                              width: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFF9F9F9),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 8),
                                Expanded(
                                  child: DropdownButton<PropertyModel>(
                                    value: selectedProperty,
                                    items: properties
                                        .map(
                                          (prop) =>
                                              DropdownMenuItem<PropertyModel>(
                                            value: prop,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      16.0, 0, 24.0, 0),
                                              child: Text(
                                                prop.propertyName,
                                                style: TextStyle(
                                                  color: Color(0xFF3C4955),
                                                  fontSize: 14.0,
                                                  fontFamily: 'Monserrat',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    icon: SvgPicture.asset(
                                      'assets/drop.svg',
                                      color: Color(0xFF3C4955),
                                      width: 20,
                                    ),
                                    onChanged: (prop) {
                                      propertyProvider.setSelectedProperty(prop!);
                                    },
                                    hint: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 0, 150.0, 0),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/property.svg',
                                            color: Color(0xFF3C4955),
                                            width: 18,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            'Select property',
                                            style: TextStyle(
                                              color: Color(0xFF3C4955),
                                              fontSize: 14.0,
                                              fontFamily: 'Montserrat',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 5.0, 0),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: DropdownButton<String>(
                                      value: null,
                                      items: [],
                                      icon: SvgPicture.asset(
                                        'assets/drop.svg',
                                        color: Color(0xFF3C4955),
                                        width: 20,
                                      ),
                                      onChanged: (value) {},
                                      hint: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            4.0, 0, 32, 0),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/date.svg',
                                              color: Color(0xFF3C4955),
                                              width: 16,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Select date',
                                              style: TextStyle(
                                                color: Color(0xFF3C4955),
                                                fontSize: 14.0,
                                                fontFamily: 'Montserrat',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color.fromRGBO(178, 187, 202, 1),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 8),
                                Expanded(
                                  child: DropdownButton<String>(
                                    value: null,
                                    items: [],
                                    icon: SvgPicture.asset(
                                      'assets/drop.svg',
                                      color: Color(0xFF3C4955),
                                      width: 20,
                                    ),
                                    onChanged: (value) {},
                                    hint: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          2.0, 0, 4, 0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.person_add_outlined,
                                            color: Color(0xFF3C4955),
                                            size: 20,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            'Guests & Rooms',
                                            style: TextStyle(
                                              color: Color(0xFF3C4955),
                                              fontSize: 14.0,
                                              fontFamily: 'Montserrat',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
       drawer: Drawer(
        child: Consumer<UserProvider>(
  builder: (context, userProvider, _) {
    bool isLoggedIn = userProvider.isLoggedIn;
    String? firstName = userProvider.user?.firstName;
    String? lastName = userProvider.user?.lastName;
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xFF3C4955),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              if (firstName != null && lastName != null)
                Text(
                  'Hello, $firstName $lastName',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
            ],
          ),
        ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  onTap: () {
                  },
                  enabled: !isLoggedIn,
                ),
                ListTile(
                  leading: Icon(Icons.login),
                  title: Text(isLoggedIn ? 'Logout' : 'Login'),
                  onTap: () {
                    if (isLoggedIn) {
                      _showLogoutConfirmationDialog();
                    } else {
                      //Provider.of<PropertyProvider>(context, listen: false).setSelectedProperty(null);

                      NavigationService.pushReplacement('/SignIn');
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
      body: Consumer<PropertyProvider>(
        builder: (context, propertyProvider, child) {
          PropertyModel? selectedProperty =
              propertyProvider.selectedProperty;
          if (selectedProperty == null) {
            return Center(child: Text('No property selected'));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Available Properties',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: selectedProperty.availableSpaces.length,
                  itemBuilder: (context, index) {
                    SpaceModel space =
                        selectedProperty.availableSpaces[index];
                    return Carousel(
                      spaceImages: space.spaceImages,
                      spaceTitle: space.spaceTitle,
                      spaceDescription: space.spaceDescription,
                      spaceRating: space.spaceRating,
                      spacePrice: space.spacePrice,
                      propertyName: selectedProperty.propertyName,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
