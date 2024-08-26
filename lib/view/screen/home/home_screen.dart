import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:latlong2/latlong.dart';
import 'package:rideshare/controllers/hub_controller.dart';
import 'package:rideshare/view/screen/home/offer_screen.dart';
import 'package:rideshare/view/screen/home/profile_page.dart';
import 'package:rideshare/view/screen/home/select_transport.dart';
import 'package:rideshare/view/widgets/drawer.dart';
import 'package:rideshare/view/widgets/footer.dart';
import 'package:get/get.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController _mapController = MapController();
  final List<Marker> _markers = [];
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  LatLng? _startPosition;
  LatLng? _endPosition;
  int _selectedIndex = 0;
  final HubController _hubController = Get.put(HubController());
  bool _showHubList = false;
  bool _isSearchingStart = true;

  Future<void> _searchLocation(String query, bool isStart) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=1');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      if (data.isNotEmpty) {
        final double lat = double.parse(data[0]['lat']);
        final double lon = double.parse(data[0]['lon']);
        final LatLng position = LatLng(lat, lon);

        setState(() {
          if (isStart) {
            _startPosition = position;
            _startController.text = data[0]['display_name'];
            _isSearchingStart = true;
            _hubController.fetchNearbyHubs(lat, lon);
          } else {
            _endPosition = position;
            _endController.text = data[0]['display_name'];
            _isSearchingStart = false;
            _hubController.fetchNearbyHubs(lat, lon);
          }

          _markers.add(
            Marker(
              point: position,
              width: 80,
              height: 80,
              child: Icon(
                isStart ? Icons.location_on : Icons.flag,
                color: isStart ? Colors.green : Colors.red,
                size: 40,
              ),
            ),
          );

          _mapController.move(position, 14.0);
          _showHubList = true;
        });
      } else {
        _showSnackBar("Location not found. Try a different query.");
      }
    } else {
      _showSnackBar("Failed to search location. Please try again.");
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 2) {
      Get.to(() => const Offer());
    } else if (index == 3) {
      Get.to(() => const Profile(showLogout: true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),  
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: LatLng(33.510414, 36.278336),
              initialZoom: 14,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              if (_markers.isNotEmpty) MarkerLayer(markers: _markers),
              if (_startPosition != null && _endPosition != null)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: [_startPosition!, _endPosition!],
                      strokeWidth: 4.0,
                      color: Colors.blue,
                    ),
                  ],
                ),
              RichAttributionWidget(
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap contributors',
                  ),
                ],
              ),
            ],
          ),
          Obx(() {
            if (_hubController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (_hubController.hubs.isEmpty) {
              return const Center(child: Text('No hubs found nearby.'));
            } else if (_showHubList) {
              return Positioned(
                bottom: 150,
                left: 15,
                right: 15,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _hubController.hubs.length,
                    itemBuilder: (context, index) {
                      final hub = _hubController.hubs[index];
                      return ListTile(
                        title: Text(hub.name,
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(hub.description),
                        trailing: const Icon(Icons.place,
                            color: Colors.blueAccent),
                        onTap: () {
                          if (_isSearchingStart) {
                            _startController.text = hub.name;
                            _startPosition =
                                LatLng(hub.latitude, hub.longitude);
                            _hubController.selectFromHub(hub.id);
                          } else {
                            _endController.text = hub.name;
                            _endPosition =
                                LatLng(hub.latitude, hub.longitude);
                            _hubController.selectToHub(hub.id);
                          }

                          _markers.add(
                            Marker(
                              point: LatLng(hub.latitude, hub.longitude),
                              width: 80,
                              height: 80,
                              child: const Icon(
                                Icons.location_city,
                                color: Colors.purple,
                                size: 40,
                              ),
                            ),
                          );

                          _mapController.move(
                              LatLng(hub.latitude, hub.longitude), 14.0);

                          setState(() {
                            _showHubList = false;
                          });
                        },
                      );
                    },
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
          Positioned(
            top: 40,
            left: 16,
            child: Builder(
              builder: (context) => Container(
                decoration: BoxDecoration(
                  color: Colors.green, 
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); 
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 15,
            right: 15,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => SelectTransport());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Rental'),
                ),
                const SizedBox(height: 10),
                _buildLocationField(
                  controller: _startController,
                  hintText: 'Enter start location',
                  icon: Icons.location_on,
                  onSubmitted: (value) => _searchLocation(value, true),
                ),
                const SizedBox(height: 10),
                _buildLocationField(
                  controller: _endController,
                  hintText: 'Enter destination',
                  icon: Icons.flag,
                  onSubmitted: (value) => _searchLocation(value, false),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const HexagonButton(),
    );
  }

  Widget _buildLocationField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required Function(String) onSubmitted,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ),
      textInputAction: TextInputAction.search,
      onSubmitted: onSubmitted,
      onTap: () {
        setState(() {
          _isSearchingStart = (controller == _startController);
        });
      },
    );
  }
}
