import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

part 'available_time_response.g.dart';

@JsonSerializable()
class AvailableTimesResponse {
  final List<String> availableTimes; 

  AvailableTimesResponse({required this.availableTimes});

  factory AvailableTimesResponse.fromJson(Map<String, dynamic> json) =>
      _$AvailableTimesResponseFromJson(json);
  
  List<DateTime> get availableTimesAsDateTime {
    return availableTimes.map((time) {
      return DateFormat('HH:mm:ss').parse(time); 
    }).toList();
  }
}
