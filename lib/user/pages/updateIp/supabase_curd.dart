
import 'package:flutter_riverpod/flutter_riverpod.dart' as p;
import 'package:nb_utils/nb_utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBaseRepos {
  static SupabaseClient sinstance = SupabaseClient( 
      'https://utwbbhhdnyozpybawkgv.supabase.co',
      '');

  Future getUserIP() async {
    try {
      final response = await sinstance.from('IP Address').select();
      Fluttertoast.showToast(msg: response[0]['address']);
    } catch (e) {
      // print(e);
    }
  }

  Future updateUserIP(String adddress) async {
    try {
      final response = await sinstance
          .from('Address')
          .update({'address': adddress}).eq('id', '1');

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

// class SupaBaseRepos {
//   static SupabaseClient sinstance = SupabaseClient( 
//       'https://utwbbhhdnyozpybawkgv.supabase.co',
//       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImQ4MGQyM2YxLTMyYmYtNGYwNC1hODhmLTQ3OWJjNTMxYzNjZSIsImlhdCI6MTcwMDU4NzgwOCwiZXhwIjoxNzAzMTc5ODA4fQ.p_YE92C6aqu54rug_PGWTZqER2wJ6_QcRnisTRT5mpA');

//   Future getUserIP() async {
//     try {
//       final response = await sinstance.from('Address').select();
//       Fluttertoast.showToast(msg: response[0]['address']);
//     } catch (e) {
//       // print(e);
//     }
//   }

//   Future updateUserIp(String addderss) async {
//     try {
//       final response = await sinstance
//           .from('Address')
//           .update({'address': addderss}).eq('id', '1');

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

