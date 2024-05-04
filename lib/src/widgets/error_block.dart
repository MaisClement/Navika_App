// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/api.dart';
import 'package:navika/src/icon.dart';
import 'package:navika/src/style.dart';
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

String getErrorText(BuildContext context, ApiStatus error) {
  switch (error) {
    case ApiStatus.socketException:
      return AppLocalizations.of(context)!.no_internet_connection;

    case ApiStatus.timeoutException:
      return 'Le serveur n’as pas repondu';

    case ApiStatus.serverException:
      return AppLocalizations.of(context)!.unable_to_retrieve_information;

    case ApiStatus.unknownException:
      return AppLocalizations.of(context)!.error;

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
          child: Text(getErrorText(context, error),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: fontFamily,
            ),
          ),
        ),
        const SizedBox(height: 25),
        if (retry != null && error != ApiStatus.unknownException)
          Center(
            child: IconElevatedButton(
              icon: refresh,
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
