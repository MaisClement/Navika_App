// Copyright (c) 2022 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//

import 'dart:io';
import 'internet_address.dart';

class InternetAddressConverter {
  static InternetAddress convertFromInternal(
          InternetAddressInternal internalIP) =>
      InternetAddress(internalIP.address);

  static InternetAddressInternal convertToInternal(InternetAddress system) =>
      InternetAddressInternal(system.address);
}
