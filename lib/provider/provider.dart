import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import '../model/example1.dart';
import '../model/example2.dart';
import '../service/service.dart';

class ServiceProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _error;
  String? get error => _error;

  Example1? _example1;
  Example1? get example1 => _example1;

  Future<void> getServiceTypes() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await ApiService.fetchServiceTypes();
      if (result != null) {
        _example1 = result;
      } else {
        _example1 = null;
      }
    } catch (e) {
      log(e.toString());
    }
    finally{
      _isLoading = false;
      notifyListeners();
    }
  }

  //example 2
   Example2? _example2;
  Example2? get example2 => _example2;

  Future<void> getCoveredAreas() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final response = await ApiService.fetchCoveredAreas();
      if (response!.statusCode == 200 ) {
        final data = jsonDecode(response.body);
        _example2 = Example2.fromJson(data);
        notifyListeners();
      } else {
        _example2 = null;
      }
    } catch (e) {
      log(e.toString());
    }
    finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}
