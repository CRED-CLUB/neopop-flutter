// Copyright 2022 Dreamplug Technologies Private Limited
//
// Use of this source code is governed by the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License in the LICENSE file or at
// http://www.apache.org/licenses/LICENSE-2.0

part of 'neopop_tilted_button.dart';

/// An immutable description of how a neopop tilted button is
/// painted.
///
/// The [NeoPopTiltedButtonDecoration] class provides a variety of ways
/// to draw a neopop tilted button.
///
/// The tilted button is painted in layers. The top-most layer after child is composed
/// of shimmer. Shimmer is painted if [showShimmer] is set to true,
///
/// After painting shimmer, the [color] layer is painted.
///
/// The [border] paints over the body; the shadow, naturally, paints below it.
///
/// {@tool snippet}
///
/// The following applies a [NeoPopTiltedButtonDecoration] to a [NeoPopTiltedButton]
///  widget with a shimmer.
///
/// ![](https://d2tecn3vwkchpd.cloudfront.net/fabrik/patterns/neopop_tilted_button)
///
/// ```dart
/// NeoPopTiltedButton(
///   decoration: NeoPopTiltedButtonDecoration(
///     color: Colors.white,
///     plunkColor: Colors.grey,
///     showShimmer: true,
///     border: Border.all(color: Colors.black, width: 0.5),
///   ),
///   child: Padding(
///     padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 45),
///     child: Text('Pay Now'),
///   ),
/// )
/// ```
/// {@end-tool}
class NeoPopTiltedButtonDecoration {
  /// Creates a neopop tilted button decoration object.
  ///
  /// * If [plunkColor] is null, [color] is used to derive the color of the plunk.
  /// * [shadowColor] is the color of the shadow. This is painted incase
  /// of a floating button.
  /// * By default, shimmer is not painted. To paint shimmer, set [showShimmer]
  /// to `true`.
  /// * If [shimmerPlunkColor] is null, [shimmerColor] is used instead.
  const NeoPopTiltedButtonDecoration({
    this.color = const Color(0xFF0D0D0D),
    this.disabledColor = kDisabledButtonColor,
    this.disabledPlunkColor = kDisabledButtonPlunkColor,
    this.shadowColor = kTiltedButtonShadowColor,
    this.shimmerWidth = kTiltedButtonShimmerWidth,
    this.shimmerColor = kTiltedButtonShimmerColor,
    this.shimmerDuration = kTiltedButtonShimmerDuation,
    this.shimmerDelay = kTiltedButtonShimmerDelay,
    this.showShimmer = false,
    this.shimmerPlunkColor,
    this.plunkColor,
    this.border,
  });

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  NeoPopTiltedButtonDecoration copyWith({
    Color? color,
    Color? disabledColor,
    Color? disabledPlunkColor,
    Color? shadowColor,
    double? shimmerWidth,
    Color? shimmerColor,
    Duration? shimmerDuration,
    Duration? shimmerDelay,
    bool? showShimmer,
    Color? shimmerPlunkColor,
    Border? border,
  }) {
    return NeoPopTiltedButtonDecoration(
      color: color ?? this.color,
      disabledColor: disabledColor ?? this.disabledColor,
      disabledPlunkColor: disabledPlunkColor ?? this.disabledPlunkColor,
      shadowColor: shadowColor ?? this.shadowColor,
      shimmerWidth: shimmerWidth ?? this.shimmerWidth,
      shimmerColor: shimmerColor ?? this.shimmerColor,
      shimmerDuration: shimmerDuration ?? this.shimmerDuration,
      shimmerDelay: shimmerDelay ?? this.shimmerDelay,
      showShimmer: showShimmer ?? this.showShimmer,
      shimmerPlunkColor: shimmerPlunkColor ?? this.shimmerPlunkColor,
      border: border ?? this.border,
    );
  }

  /// Color of the button
  final Color color;

  /// Color of the button in disabled state
  ///
  /// Defaults to [kDisabledButtonColor]
  final Color disabledColor;

  /// Color of the plunk of the button in disabled state
  ///
  /// Defaults to [kDisabledButtonPlunkColor]
  final Color? disabledPlunkColor;

  /// Color of the bottom plunk of the button
  ///
  /// If null, it will be derived from the [color] of the button
  final Color? plunkColor;

  /// Color of the shadow of the button
  ///
  /// Shadow is shown in case of a floaring button
  /// and defaults to [kTiltedButtonShadowColor]
  final Color shadowColor;

  /// The border to be painted around the button.
  final Border? border;

  /// Whether to show the shimmer over the button
  ///
  /// Defaults to `false`
  final bool showShimmer;

  /// Width of the larger shimmer line
  /// The width of the smaller line is calculated as
  /// `shimmerWidth / 2`.
  ///
  /// Defaults to [kTiltedButtonShimmerWidth]
  final double shimmerWidth;

  /// Color of the shimmer
  ///
  /// Defauls to [kTiltedButtonShimmerColor]
  final Color shimmerColor;

  /// Color of the plunk of the shimmer
  ///
  /// If null, `shimmerColor` is used instead.
  final Color? shimmerPlunkColor;

  /// Duration of one shimmer cycle
  ///
  /// Defaults to [kTiltedButtonShimmerDuration]
  final Duration shimmerDuration;

  /// Delay between two shimmer cycles
  ///
  /// Defaults to [kTiltedButtonShimmerDelay]
  final Duration shimmerDelay;
}
