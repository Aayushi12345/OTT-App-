// import 'package:flutter/cupertino.dart';
// import 'package:ott_app/data/models/movie_model.dart';
// import 'package:provider/provider.dart';
//
// class FavoriteProvider extends ChangeNotifier{
//   List<Results> _title =[];
//   List<Results> get title => _title;
//
//   void toggleFavorites(Results title)
//   {
//     final isExist =_title.contains(title);
//     if(isExist){
//       _title.remove(title);
//     }else{
//       _title.add(title);
//     }
//     notifyListeners();
//   }
//   bool isExist(Results title)
//   {
//     final isExist =_title.contains(title);
//     return isExist;
//   }
//   void clearFavorite(){
//     _title=[];
//     notifyListeners();
//   }
//   static FavoriteProvider of(
//       BuildContext context, {
//         bool listen = true,
//       }) {
//     return Provider.of<FavoriteProvider>(
//       context,
//       listen: listen,
//     );
//   }
// }