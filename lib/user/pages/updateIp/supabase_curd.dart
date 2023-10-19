
import 'package:flutter_riverpod/flutter_riverpod.dart' as p;
import 'package:nb_utils/nb_utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// class SupaBaseRepos {
//   static SupabaseClient sinstance = SupabaseClient( 
//       'https://utwbbhhdnyozpybawkgv.supabase.co',
//       '');

//   Future getUserIP() async {
//     try {
//       final response = await sinstance.from('IP Address').select();
//       Fluttertoast.showToast(msg: response[0]['address']);
//     } catch (e) {
//       // print(e);
//     }
//   }

//   Future updateUserIP(String adddress) async {
//     try {
//       final response = await sinstance
//           .from('Address')
//           .update({'address': adddress}).eq('id', '1');

//       if (response == null)
//        {
//         Fluttertoast.showToast(msg: "Updated Successfully");
//       }
//     } catch (e) 
//     {
//       // print(e);
//     }
//   }
// }

// final crudIpServiceProvider = p.Provider<SupaBaseRepos>((ref) => SupaBaseRepos());

class SupaBaseRepos {
  static SupabaseClient sinstance = SupabaseClient( 
      'https://utwbbhhdnyozpybawkgv.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV0d2JiaGhkbnlvenB5YmF3a2d2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExNTAwNDEsImV4cCI6MjAwNjcyNjA0MX0.1VbHXixwf5mWMh9cVg1Bb8pQwyZCObONYJxWUoJ46-4');

  Future getUserIP() async {
    try {
      final response = await sinstance.from('Address').select();
      Fluttertoast.showToast(msg: response[0]['address']);
    } catch (e) {
      // print(e);
    }
  }

  Future updateUserIp(String addderss) async {
    try {
      final response = await sinstance
          .from('Address')
          .update({'address': addderss}).eq('id', '1');

      if (response == null)
       {
        Fluttertoast.showToast(msg: "Updated Successfully");
      }
    } catch (e) 
    {
      // print(e);
    }
  }
}

final crudIpServiceProvider = p.Provider<SupaBaseRepos>((ref) => SupaBaseRepos());

