import 'package:petrol_slice/app/shared/preferences/preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  signOut() async {
    final prefs = await _getSharedPreferenceInstance();
    return await prefs.clear();
  }

  setUsername(String value) async {
    final prefs = await _getSharedPreferenceInstance();
    await prefs.setString(PreferencesKey.userFullname, value);
  }

  setUserGasolineCityConsumption(double value) async {
    final prefs = await _getSharedPreferenceInstance();
    await prefs.setDouble(PreferencesKey.userGasolineCityConsumption, value);
  }

  setUserGasolineHighwayConsumption(double value) async {
    final prefs = await _getSharedPreferenceInstance();
    await prefs.setDouble(PreferencesKey.userGasolineHighwayConsumption, value);
  }

  setUserEthanolCityConsumption(double value) async {
    final prefs = await _getSharedPreferenceInstance();
    await prefs.setDouble(PreferencesKey.userEthanolCityConsumption, value);
  }

  setUserEthanolHighwayConsumption(double value) async {
    final prefs = await _getSharedPreferenceInstance();
    await prefs.setDouble(PreferencesKey.userEthanolHighwayConsumption, value);
  }

  Future<String?> getUsername() async {
    return (await _getSharedPreferenceInstance())
        .getString(PreferencesKey.userFullname);
  }

  Future<double?> getUserGasolineCityConsumption() async {
    return (await _getSharedPreferenceInstance())
        .getDouble(PreferencesKey.userGasolineCityConsumption);
  }

  Future<double?> getUserGasolineHighwayConsumption() async {
    return (await _getSharedPreferenceInstance())
        .getDouble(PreferencesKey.userGasolineHighwayConsumption);
  }

  Future<double?> getUserEthanolCityConsumption() async {
    return (await _getSharedPreferenceInstance())
        .getDouble(PreferencesKey.userEthanolCityConsumption);
  }

  Future<double?> getUserEthanolHighwayConsumption() async {
    return (await _getSharedPreferenceInstance())
        .getDouble(PreferencesKey.userEthanolHighwayConsumption);
  }

  Future<SharedPreferences> _getSharedPreferenceInstance() async {
    return await SharedPreferences.getInstance();
  }
}
