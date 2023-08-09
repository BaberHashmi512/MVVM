

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/route.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';

class AUthViewModel with ChangeNotifier{

  final _myRepo = AuthRepository();

  bool _loading = false;

  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signupLoading => _signUpLoading;

  setLoading(bool value){
    _loading = true;
    notifyListeners();
  }
  setSignUpLoading(bool value){
    _signUpLoading = true;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data , BuildContext context) async{
    setLoading(true);
    _myRepo.loginApi(data).then((value){
      setLoading(false);
      if(kDebugMode){
        Utils.flushBarErrorMessage('Login Successfully', context);
        Navigator.pushNamed(context,
        RoutesName.home);
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });

  }


  Future<void> signUpApi(dynamic data , BuildContext context) async{
    setSignUpLoading(true);
    _myRepo.signUpApi(data).then((value){
      setSignUpLoading(false);
      if(kDebugMode){
        Utils.flushBarErrorMessage('Signup Successfully', context);
        Navigator.pushNamed(context,
            RoutesName.home);
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });

  }

}