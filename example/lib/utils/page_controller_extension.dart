import 'package:flutter/material.dart';
import 'package:neopop_example/utils/constants.dart';

/// Extension on [PageController] to make navigating to a page easier.
extension PageControllerX on PageController {
  Future<void> slideToNextPage() {
    return nextPage(
      duration: kPageNavigationDuration,
      curve: kPageNavigationCurve,
    );
  }

  Future<void> slideToPrevPage() {
    return previousPage(
      duration: kPageNavigationDuration,
      curve: kPageNavigationCurve,
    );
  }

  Future<void> slideToPage(int page) {
    return animateToPage(
      page,
      duration: kPageNavigationDuration,
      curve: kPageNavigationCurve,
    );
  }
}
