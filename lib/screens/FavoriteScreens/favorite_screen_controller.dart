import 'package:get/get.dart';

import 'package:ra7alah/Services/favorite_services.dart';
import 'package:ra7alah/models/fav_model.dart';

class favoriteScreenController extends GetxController{

  final FavoriteServices fav =  FavoriteServices();
  var loadIng = false;
  var noDataToShow = false;

  List<Favorite> favs= [];
  List<String> ids= [];
  @override
  Future<void> onInit() async {
    checker();
    super.onInit();
  }


  checker() async {
    var check = await fav.checkIfThereIsFavoritesToTHisUser();
    if(check!=null){
      getData();
    }else{
      loadIng = false;
      noDataToShow = true;
      update();
    }
  }
  getData() async {
    noDataToShow = false;
    loadIng = true;
   favs =  await fav.getFavoriteData();
   ids = fav.getFavoriteID();
   loadIng = false;
    update();
  }

}