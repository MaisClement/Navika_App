import 'package:flutter/material.dart';
import 'package:navika/src/api.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';

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
  final Function? retry;

  const ErrorBlock({
    required this.error,
    this.retry,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      children: [
        const SizedBox(height: 15),
        Image(
          image: AssetImage(getErrorImg(error)),
          width: 120,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Text(getErrorText(error),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: 'Segoe Ui',
            ),
          ),
        ),
        const SizedBox(height: 25),
        if (retry != null && error != ApiStatus.unknownException)
          Center(
            child: IconElevatedButton(
              icon: Icons.refresh,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: const Color(0xffffffff),
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              text: 'Réssayer',
              onPressed: () => retry!(),
            ),
          ),
          
      ],
    ),
  );
}
