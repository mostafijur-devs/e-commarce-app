import 'package:e_commarce_app/models/dashborad_model.dart';
import 'package:flutter/material.dart';

class DashboradItemView extends StatelessWidget {
  const DashboradItemView({super.key, required this.model});
  final DashboradItemModels model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, model.routeName),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(model.iconData, color: Colors.grey,size: 30,),
              const SizedBox(height: 10.0,),
              Text(model.title,style: const TextStyle(fontWeight: FontWeight.bold,),)
            ],
          ),
        ),
      ),
    );
  }
}
