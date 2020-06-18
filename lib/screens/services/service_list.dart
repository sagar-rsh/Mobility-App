import 'package:mobility_services_app/models/service_model.dart';
import 'package:flutter/material.dart';
import 'package:mobility_services_app/screens/services/service_tile.dart';
import 'package:provider/provider.dart';

class ServiceList extends StatefulWidget {
  final int item;
  ServiceList({this.item});
  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  @override
  Widget build(BuildContext context) {
//    print(widget.item);
    final services = Provider.of<List<Service>>(context) ?? [];

    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {
        return ServiceTile(
            service: services[index], n: index, item: widget.item);
      },
    );
  }
}
