class API
{
  static const hostConnect = "http://quanticasoft.com/api_mascotas";
  static const hostUser = "$hostConnect/users";
  static const hostSignals = "$hostConnect/signals";
  static const hostLost = "$hostConnect/lost";

  static const hostImagesSignals = "$hostConnect/signals_images/";
  static const hostImagesLost = "$hostConnect/lost_images/";
  //--------------------------------------------------------------

  //register-login users
  static const validateCelular = "$hostUser/validate_celular.php";
  static const register = "$hostUser/register.php";
  static const login = "$hostUser/login.php";

  //signals
  static const saveNewSignal = "$hostSignals/save.php";
  static const getAllSignals = "$hostSignals/all.php";
  static const getLogSignal = "$hostSignals/logsignal.php";
  static const searchSignal = "$hostSignals/search.php";
  static const editSignal = "$hostSignals/edit.php";

  //lost
  static const getAllLost = "$hostLost/all.php";
  static const saveNewLost = "$hostLost/save.php";
  static const getLogLost = "$hostLost/loglost.php";
  static const editLost = "$hostLost/edit.php";
}

