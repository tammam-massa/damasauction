// controllers/profile_controller.dart
import 'package:damasauction/models/profile/profile_model.dart';
import 'package:damasauction/services/api_profile.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  // Observable variables for profile data and loading state
  var isLoading = true.obs;
  var profile = Rxn<ProfileModel>();

  // Method to fetch profile data
  Future<void> fetchProfile(String token) async {
    isLoading.value = true;

    final fetchedProfile = await ApiProfileService.fetchUserProfile(token);

    if (fetchedProfile != null) {
      profile.value = fetchedProfile;
    }

    isLoading.value = false;
  }

  // Method to get profile link using username or client_id
  String getProfileLink() {
    if (profile.value != null) {
      // Check if username is available, otherwise fall back to client_id
      String usernameOrId = profile.value!.username.isNotEmpty
          ? profile.value!.username
          : profile.value!.clientId.toString();

      return 'https://www.mazaddimashq.com/profile/$usernameOrId';
    } else {
      return 'https://www.mazaddimashq.com/profile';
    }
  }
}
