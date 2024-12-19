import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';


//necesitamos hacer state, notifier y provider
//state notifier provider


//provider
final permissionsProvider =
StateNotifierProvider<PermissionsNotifier, PermissionsState>((ref) {
  return PermissionsNotifier();
});




//notifier  o controller
// El notifier es basicamente una clase que el estado es una instancia de
// nuestro state
// Es una clase, que internamente tiene una propiedad llamada state
// y ese state es de tipo es el state que uds quieran
// el estado de mismo que va a manejar es el: <PermissionsState>
class PermissionsNotifier extends StateNotifier<PermissionsState> {
  PermissionsNotifier() : super(PermissionsState());

  Future<void> checkPermissions() async {
    // futures array
    final permissionsArray = await Future.wait([
      Permission.camera.status,
      Permission.photos.status,

      Permission.location.status,
      Permission.locationAlways.status,
      Permission.locationWhenInUse.status,
    ]);

    state = state.copyWith(
      camera: permissionsArray[0],
      photoLibrary: permissionsArray[1],

      location: permissionsArray[2],
      locationAlways: permissionsArray[3],
      locationWhenInUse: permissionsArray[4],
    );
  }

  openSettinsScreen() {
    openAppSettings();
  }

  void _checkPerssionState( PermissionStatus status ) {
    if ( status == PermissionStatus.permanentlyDenied ) {
      openSettinsScreen();
    }
  }


  requestCameraAccess() async {
    final status = await Permission.camera.request();
    state = state.copyWith( camera: status );

    _checkPerssionState(status);
  }

  requestPhotoLibraryAccess() async {
    final status = await Permission.photos.request();
    state = state.copyWith(photoLibrary: status);

    _checkPerssionState(status);
  }

  requestLocationAccess() async {
    final status = await Permission.location.request();
    state = state.copyWith(location: status);

    _checkPerssionState(status);
  }

}




//state
//permission status
//enum PermissionStatus{denied,granted,restricted,limited,PermanentlyDenied}
class PermissionsState {
  final PermissionStatus camera;
  final PermissionStatus photoLibrary;

  final PermissionStatus location;
  final PermissionStatus locationAlways;
  final PermissionStatus locationWhenInUse;

  PermissionsState({
    this.camera = PermissionStatus.denied,
    this.photoLibrary = PermissionStatus.denied,
    this.location = PermissionStatus.denied,
    this.locationAlways = PermissionStatus.denied,
    this.locationWhenInUse = PermissionStatus.denied,
  });

  get cameraGranted {
    return camera == PermissionStatus.granted;
  }

  get photoLibraryGranted {
    return photoLibrary == PermissionStatus.granted;
  }

  get locationGranted {
    return location == PermissionStatus.granted;
  }

  get locationAlwaysGranted {
    return locationAlways == PermissionStatus.granted;
  }

  get locationWhenInUseGranted {
    return locationWhenInUse == PermissionStatus.granted;
  }

  PermissionsState copyWith({
    PermissionStatus? camera,
    PermissionStatus? photoLibrary,
    PermissionStatus? location,
    PermissionStatus? locationAlways,
    PermissionStatus? locationWhenInUse,
  }) =>
      PermissionsState(
        camera: camera ?? this.camera,
        photoLibrary: photoLibrary ?? this.photoLibrary,
        location: location ?? this.location,
        locationAlways: locationAlways ?? this.locationAlways,
        locationWhenInUse: locationWhenInUse ?? this.locationWhenInUse,
      );
}
