import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

String getErrorImg(error) {
  if (error == 'SocketException')  {
    return 'assets/img/cloud_off.svg';
  }
  if (error == 'TimeoutException') {
    return 'assets/img/cloud_sad.svg';
  }
  return 'assets/img/cancel.svg';
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

class ErrorMessage extends StatelessWidget {
  final String error;

  const ErrorMessage({
    required this.error,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 15),
              SvgPicture.asset(
                  getErrorImg(error),
                  color: Colors.grey[600],
                  height: 18,
                ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  getErrorText(error),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Segoe Ui',
                  ),
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      );
}
