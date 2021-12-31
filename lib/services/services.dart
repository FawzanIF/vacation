import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:vacation/models/models.dart';
import 'package:vacation/shared/shared.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:vacation/extensions/extensions.dart';
import 'package:http/http.dart' as http;

part 'auth_services.dart';
part 'user_services.dart';
