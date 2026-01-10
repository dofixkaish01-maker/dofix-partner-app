import 'package:dofix_technichian/app/widgets/custom_button_widget.dart';
import 'package:dofix_technichian/app/widgets/custom_textfield.dart';
import 'package:dofix_technichian/widgets/common_loading.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:intl/intl.dart';
import '../../../../controllers/dashboard_controller.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/images.dart';
import '../../../../utils/sizeboxes.dart';
import '../../../../utils/styles.dart';
import '../../../widgets/HtmlToFlutter.dart';
import '../../widgets/custom_buttons.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (controller) {
      return Material(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  backgroundColor: Colors.white,
                  expandedHeight: 135.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSizeDefault),
                      child: Column(
                        children: [
                          sizedBox65(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(Images.iclogo, height: 70, width: 70),
                              CustomNotificationButton(
                                icon: Icons.shopping_cart,
                                tap: () {},
                                color: Theme.of(context).primaryColor,
                              )
                            ],
                          ),
                          InkWell(
                            splashColor: Colors.grey.withOpacity(0.5),
                            onTap: () => Get.back(),
                            child: Row(
                              children: [
                                Icon(Icons.arrow_back,
                                    color: Colors.black,
                                    size: Dimensions.fontSize18),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    controller.serviceModel.name ?? "",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: albertSansRegular.copyWith(
                                        fontSize: Dimensions.fontSize14,
                                        color: Theme.of(context).hintColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom:
                            80), // Add padding to avoid overlapping the button
                    child: Column(
                      children: [
                        SizedBox(height: 25),
                        Container(
                            width: Get.size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Container()
                            //ServiceContainer(serviceModel: controller.serviceModel),
                            ),
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'About the Service',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: HtmlToFlutter(
                              htmlText:
                                  controller.serviceModel.description ?? ""),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Floating Button at Bottom
            Positioned(
              bottom: 20,
              left: 16,
              right: 16,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Perform action (e.g., navigate or add to cart)
                    showBookingSheet(context, controller.serviceModel.id ?? "");
                    print("Button Clicked");
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Book Now",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

void showBookingSheet(BuildContext context, String serviceId) {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController mapController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final FocusNode addressFocus = FocusNode();
  final FocusNode mapFocus = FocusNode();

  DateTime selectedDate = DateTime.now().add(Duration(days: 1));
  TimeOfDay? selectedTime;

  LatLng _selectedLatLng = LatLng(28.7041, 77.1025); // Default location (Delhi)
  GoogleMapController? _mapController;

  Future<void> _getCurrentLocation() async {
    showLoading();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _selectedLatLng = LatLng(position.latitude, position.longitude);

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        Get.find<DashBoardController>().updateLatLong(
          position.latitude.toString(),
          position.longitude.toString(),
        );
        Get.find<DashBoardController>().getzoneIdForRegisteration();
      }
      _mapController?.animateCamera(CameraUpdate.newLatLng(_selectedLatLng));
      hideLoading();
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  showModalBottomSheet(
    context: context,
    isDismissible: true,
    enableDrag: false,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          // **Fetch location on first load**
          if (_mapController == null) {
            _getCurrentLocation();
          }

          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 16,
              right: 16,
              top: 16,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 50),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back,
                              size: 30, color: Theme.of(context).primaryColor)),
                      Spacer(),
                      Text("Book Service",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 35),
                  CustomTextField(
                    controller: nameController,
                    hintText: "Name",
                    inputType: TextInputType.name,
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    controller: mobileController,
                    hintText: "Mobile Number",
                    inputType: TextInputType.number,
                    isPhone: true,
                    isNumber: true,
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    controller: emailController,
                    hintText: "Email",
                    inputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 15),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime.now().add(Duration(days: 1)),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        setState(() => selectedDate = picked);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child:
                                Text("Select Date: ${selectedDate.toLocal()}")),
                        Icon(Icons.calendar_today),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () async {
                      TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime:
                            TimeOfDay(hour: DateTime.now().hour + 1, minute: 0),
                      );
                      if (picked != null) {
                        setState(() => selectedTime = picked);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(selectedTime != null
                                ? "Select Time: ${selectedTime!.format(context)}"
                                : "Select Time")),
                        Icon(Icons.access_time),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),

                  // **Map Container**
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Stack(
                                children: [
                                  GoogleMap(
                                    initialCameraPosition: CameraPosition(
                                        target: _selectedLatLng, zoom: 14),
                                    onMapCreated: (controller) {
                                      _mapController = controller;
                                      _getCurrentLocation(); // Fetch location when the map is ready
                                    },
                                    onCameraMove: (position) {
                                      setState(() =>
                                          _selectedLatLng = position.target);
                                    },
                                    onCameraIdle: () async {
                                      List<Placemark> placemarks =
                                          await placemarkFromCoordinates(
                                              _selectedLatLng.latitude,
                                              _selectedLatLng.longitude);
                                      Placemark place = placemarks[0];
                                      debugPrint(
                                          "Place: ${place.name} ${place.street}, ${place.locality}, ${place.country} , ${place.administrativeArea}");
                                      setState(() {
                                        mapController.text =
                                            "${place.street!}, ${place.locality!}, ${place.country!}";
                                        Get.find<DashBoardController>()
                                            .updateLatLong(
                                          _selectedLatLng.latitude.toString(),
                                          _selectedLatLng.longitude.toString(),
                                        );
                                        Get.find<DashBoardController>()
                                            .getzoneIdForRegisteration();
                                      });
                                    },
                                  ),
                                  Center(
                                    child: Icon(Icons.location_pin,
                                        size: 40, color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            // **Address Input with Autocomplete**
                            GooglePlaceAutoCompleteTextField(
                              focusNode: mapFocus,
                              textEditingController: mapController,
                              googleAPIKey:
                                  "AIzaSyBLI5I6o95GqluNuRh0YT3zRj5yqoix8zA",
                              inputDecoration: InputDecoration(
                                hintText: "Search location",
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              debounceTime: 600,
                              itemClick: (prediction) {
                                double lat =
                                    double.parse(prediction.lat ?? "0.0");
                                double lng =
                                    double.parse(prediction.lng ?? "0.0");
                                setState(() {
                                  _selectedLatLng = LatLng(lat, lng);
                                });
                                _mapController?.animateCamera(
                                    CameraUpdate.newLatLng(_selectedLatLng));
                              },
                              getPlaceDetailWithLatLng: (prediction) async {
                                double lat =
                                    double.parse(prediction.lat ?? "0.0");
                                double lng =
                                    double.parse(prediction.lng ?? "0.0");
                                setState(() {
                                  _selectedLatLng = LatLng(lat, lng);
                                });
                                _mapController?.animateCamera(
                                    CameraUpdate.newLatLng(_selectedLatLng));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),
                  CustomTextField(
                    controller: addressController,
                    hintText: "Address",
                    focusNode: addressFocus,
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    controller: messageController,
                    hintText: "Message",
                  ),
                  SizedBox(height: 10),

                  // **Book Button**
                  CustomButtonWidget(
                    onPressed: () {
                      if (mobileController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          addressController.text.isEmpty ||
                          nameController.text.isEmpty) {
                        Get.snackbar("Error", "All fields are required!",
                            backgroundColor: Colors.red,
                            colorText: Colors.white);
                        return;
                      }
                      // Get.find<DashBoardController>().postOrder({
                      //   "service_id": serviceId,
                      //   "name": nameController.text,
                      //   "mobile_number": mobileController.text,
                      //   "email": emailController.text,
                      //   "address": addressController.text,
                      //   "lat": _selectedLatLng.latitude,
                      //   "lng": _selectedLatLng.longitude,
                      //   "zoneID": Get.find<DashBoardController>().zoneIdForRegisteration,
                      //   "message": messageController.text,
                      //   "date": DateConverter.dateTimeForCoupon(selectedDate).toString(),
                      //   "time": formatTimeOfDay24Hour(selectedTime ?? TimeOfDay.now()).toString(),
                      // });
                    },
                    buttonText: 'Book Now',
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

String formatTimeOfDay24Hour(TimeOfDay time) {
  final now = DateTime.now();
  final dateTime =
      DateTime(now.year, now.month, now.day, time.hour, time.minute);
  return DateFormat('HH:mm').format(dateTime);
}
