import 'package:flutter/material.dart';

String getErrorImg(error) {
  if (error == 'SocketException')  {
    return 'assets/img/cloud_off.png';
  }
  if (error == 'TimeoutException') {
    return 'assets/img/cloud_sad.png';
  }
  return 'assets/img/maintenance.png';
}


String getErrorText(error) {
  if (error == 'SocketException')  {
    return 'Aucune connexion internet';
  }
  if (error == 'TimeoutException') {
    return "Le serveur n'as pas repondu";
  }
  return error;
}

class ErrorBlock extends StatelessWidget {
	final String error;

	const ErrorBlock({
		required this.error,
		super.key,
	});

	@override
	Widget build(BuildContext context) => Center(
      child: Column(
     children: [
       const SizedBox(height: 15),
       Image(
         image: AssetImage(getErrorImg(error)),
         width: 120
       ),
       Container(
         padding: const EdgeInsets.only(left:20.0, right:20.0),
         child: Text(getErrorText(error),
           textAlign: TextAlign.center,
           style: TextStyle(
             color: Colors.grey[600],
             fontSize: 18,
             fontWeight: FontWeight.w700,
             fontFamily: 'Segoe Ui',
           ),
         ),
       ),
       const SizedBox(height: 15),
     ],
   ),
    );
}
