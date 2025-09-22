// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _ApiServices implements ApiServices {
  _ApiServices(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'http://diabetesapp.runasp.net/api/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<LoginResponseBody> login(LoginRequestBody loginRequestBody) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginRequestBody.toJson());
    final _options = _setStreamType<LoginResponseBody>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'Auth/Login',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late LoginResponseBody _value;
    try {
      _value = LoginResponseBody.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<RegisterResponseBody> register(FormData formData) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = formData;
    final _options = _setStreamType<RegisterResponseBody>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'Auth/register',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late RegisterResponseBody _value;
    try {
      _value = RegisterResponseBody.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<DoctorResponseBody>> getDoctors() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<DoctorResponseBody>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'Doctors/SelectDoctors',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<DoctorResponseBody> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                DoctorResponseBody.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<MedicineResponseBody>> getMedicine() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<MedicineResponseBody>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'Medicine/Get medicines for user',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<MedicineResponseBody> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                MedicineResponseBody.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<AddMedicineResponseBody> addMedicine(
    AddMedicineRequestBody addMedicineRequestBody,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(addMedicineRequestBody.toJson());
    final _options = _setStreamType<AddMedicineResponseBody>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'Medicine/AddMedicines',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late AddMedicineResponseBody _value;
    try {
      _value = AddMedicineResponseBody.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DeleteMedicineResponse> deleteMedicine(int id) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<DeleteMedicineResponse>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'Medicine/Deletemedicine',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DeleteMedicineResponse _value;
    try {
      _value = DeleteMedicineResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ReservationResponseBody> addReservation(
    int id,
    ReservationRequestBody reservationRequestBody,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(reservationRequestBody.toJson());
    final _options = _setStreamType<ReservationResponseBody>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'Doctors/Reservation',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ReservationResponseBody _value;
    try {
      _value = ReservationResponseBody.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DeleteReservaionResponse> cancelReservation(int id) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<DeleteReservaionResponse>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'profiles/DeleteResrvation',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DeleteReservaionResponse _value;
    try {
      _value = DeleteReservaionResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BloodSugerResponseBody> addBloodSugar(
    BloodSugerRequestBody addMedicineRequestBody,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(addMedicineRequestBody.toJson());
    final _options = _setStreamType<BloodSugerResponseBody>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'Measurements/blood sugar level',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BloodSugerResponseBody _value;
    try {
      _value = BloodSugerResponseBody.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BloodPressureResponseBody> addBloodPressure(
    BloodPressureRequestBody addMedicineRequestBody,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(addMedicineRequestBody.toJson());
    final _options = _setStreamType<BloodPressureResponseBody>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'Measurements/blood pressure',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BloodPressureResponseBody _value;
    try {
      _value = BloodPressureResponseBody.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<WeightResponseBody> addWeight(
    WeightRequestBody addMedicineRequestBody,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(addMedicineRequestBody.toJson());
    final _options = _setStreamType<WeightResponseBody>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'Measurements/weight',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late WeightResponseBody _value;
    try {
      _value = WeightResponseBody.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<SugarMeasurement>> getBloodSuger(String specificDate) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'specificDate': specificDate};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<SugarMeasurement>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'Selecting_data/user\'s sugar_data',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<SugarMeasurement> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) => SugarMeasurement.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<WeightMeasurement>> getWeight(String specificDate) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'specificDate': specificDate};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<WeightMeasurement>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'Selecting_data/user\'s weight_data',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<WeightMeasurement> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                WeightMeasurement.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<BloodPressureMeasurement>> getPressure(
    String specificDate,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'specificDate': specificDate};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<BloodPressureMeasurement>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'Selecting_data/user\'s presure_data',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<BloodPressureMeasurement> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                BloodPressureMeasurement.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<AvailableTimesResponse> getAvailableTime(int id, String date) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id, r'date': date};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<AvailableTimesResponse>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'Doctors/AvailableTime',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late AvailableTimesResponse _value;
    try {
      _value = AvailableTimesResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<UserReservationsResponseBody> getUserReservations() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<UserReservationsResponseBody>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'profiles/UserReservations',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserReservationsResponseBody _value;
    try {
      _value = UserReservationsResponseBody.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<UserDetailsResponse> getProfile() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<UserDetailsResponse>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'Auth/Get User Details',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserDetailsResponse _value;
    try {
      _value = UserDetailsResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<UpdateUserResponse> updateProfile(
    UpdateUserRequest updateProfileRequestModel,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateProfileRequestModel.toJson());
    final _options = _setStreamType<UpdateUserResponse>(
      Options(method: 'PUT', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'Auth/UpdateUser',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UpdateUserResponse _value;
    try {
      _value = UpdateUserResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<Exercise>> gerExercise() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<Exercise>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'Sports/DisplaySports',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<Exercise> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => Exercise.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
