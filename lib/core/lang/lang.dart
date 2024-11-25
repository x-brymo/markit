import 'package:get/get.dart';

class Lang extends  GetxController{
  RxString lang = 'ar'.obs;
  RxString langName = 'العربية'.obs;

  void changeLang(String newLang){
    lang.value = newLang;
    if(newLang == 'ar'){
      langName.value = 'العربية';
    }else{
      langName.value = 'English';
    }
  }
  
}
class MyLocalizations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'hello': 'Hello',
      'darkMode': 'Dark Mode',
      'lightMode': 'Light Mode',
      'arabic': 'Arabic',
      'english': 'English',
    },
    'ar': {
      'hello': 'مرحبا',
      'darkMode': 'وضع الوضع المظلم',
      'lightMode': 'وضع الوضع الفاتح',
      'arabic': 'العربية',
      'english': 'English',
      
    }
  };

}