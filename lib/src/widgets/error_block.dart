import 'package:flutter/material.dart';
import 'package:navika/src/api.dart';
import 'package:navika/src/data/global.dart' as globals;

String getErrorImg(ApiStatus error) {
  switch (error) {
    case ApiStatus.socketException:
      return 'assets/img/cloud_off.png';

    case ApiStatus.timeoutException:
      return 'assets/img/cloud_sad.png';

    default:
      return 'assets/img/maintenance.png';
  }
}

String getErrorIcon(ApiStatus error) {
  switch (error) {
    case ApiStatus.socketException:
      return 'assets/img/cloud_off.svg';

    case ApiStatus.timeoutException:
      return 'assets/img/cloud_sad.svg';

    default:
      return 'assets/img/cancel.svg';
  }
}

String getErrorText(ApiStatus error) {
  switch (error) {
    case ApiStatus.socketException:
      return 'Aucune connexion internet';

    case ApiStatus.timeoutException:
      return 'Le serveur n’as pas repondu';

    case ApiStatus.serverException:
      return 'Récupération des informations impossible';

    case ApiStatus.unknownException:
      return 'Une erreur s’est produite';

    default:
      return '';
  }
}

class ErrorBlock extends StatelessWidget {
  final ApiStatus error;

  const ErrorBlock({
    required this.error,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: globals.hiveBox.get('useSerin')
            ? Column(
                children: [
                  const Image(
                    image: AssetImage(
                      'assets/img/serin/serin_work.png',
                    ),
                    height: 140,
                  ),
                  Text(
                    'Pas de panique, notre meilleur ingénieur est sur le coup !',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Segoe Ui',
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : Column(
                children: [
                  const SizedBox(height: 15),
                  Image(image: AssetImage(getErrorImg(error)), width: 120),
                  Container(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Text(
                      getErrorText(error),
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
