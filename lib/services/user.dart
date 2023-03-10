import 'package:lentera_ilmu/services/service.dart';

class UserService extends ServiceAPI {
  Future<List<dynamic>> getAddress() async {
    try {
      final result = await get("$baseUrlUser/address");
      return result["items"].map((json) => json).toList();
    } catch (e) {
      throw '$e';
    }
  }

  Future<String> setAddress({
    required int userId,
    required String phone,
    required int provinceId,
    required String provinceName,
    required int cityId,
    required String cityName,
    required String postalCode,
    required String detail,
  }) async {
    try {
      final Map<String, dynamic> newData = {
        'user_id': userId,
        'phone': phone,
        'province_id': provinceId,
        'province_name': provinceName,
        'city_id': cityId,
        'city_name': cityName,
        'postal_code': postalCode,
        'detail': detail
      };

      await post(
        "$baseUrlUser/address",
        data: newData,
      );

      return "alamat berhasil ditambahkan!";
    } catch (e) {
      throw '$e';
    }
  }

  Future<String> updateAddress({
    required int id,
    int? userId,
    String? phone,
    int? provinceId,
    String? provinceName,
    int? cityId,
    String? cityName,
    String? postalCode,
    String? detail,
  }) async {
    try {
      final Map<String, dynamic> newData = {
        'id': id,
        'user_id': userId,
        'phone': phone,
        'province_id': provinceId,
        'province_name': provinceName,
        'city_id': cityId,
        'city_name': cityName,
        'postal_code': postalCode,
        'detail': detail
      };

      await patch(
        "$baseUrlUser/address",
        data: newData,
      );
      return "alamat berhasil diperbaharui!";
    } catch (e) {
      throw '$e';
    }
  }

  Future<String> deleteAddress({required int id}) async {
    try {
      await delete(
        "$baseUrlUser/address",
        queryParameters: {"id": id},
      );
      return "alamat berhasil dihapus!";
    } catch (e) {
      throw '$e';
    }
  }
}
