
import 'package:flutter/material.dart';

class Bands {
  String id;
  String name;
  int votes;

Bands({
this.id,
  this.name,
  this.votes
});

factory Bands.fromMap(Map<String , dynamic> obj)
=> Bands(
  id: obj['id'],
  name: obj ['name'],
  votes:  obj ['votes']
);
  }

