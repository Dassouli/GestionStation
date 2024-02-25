import 'package:flutter/material.dart';

class CitySearchWidget extends StatefulWidget {
  final Function(String) onSearch;

  const CitySearchWidget({Key? key, required this.onSearch}) : super(key: key);

  @override
  _CitySearchWidgetState createState() => _CitySearchWidgetState();
}

class _CitySearchWidgetState extends State<CitySearchWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter a city name',
              ),
            ),
          ),
          SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              String cityName = _controller.text.trim();
              if (cityName.isNotEmpty) {
                widget.onSearch(cityName);
              }
            },
            child: Text('Search'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
