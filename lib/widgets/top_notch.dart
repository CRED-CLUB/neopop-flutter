/// Copyright 2022 Dreamplug Technologies Private Limited
///
/// Use of this source code is governed by the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License in the LICENSE file or at
/// http://www.apache.org/licenses/LICENSE-2.0

import 'package:flutter/material.dart';

/// A widget to draw a top notch on a bottomsheet or other
/// widget
class TopNotch extends StatelessWidget {
  final Color color;
  const TopNotch({
    this.color = const Color.fromRGBO(255, 255, 255, 0.5),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 60,
        child: Divider(
          thickness: 2,
          color: color,
          height: 0,
        ),
      );
}
