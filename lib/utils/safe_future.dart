/// Copyright 2022 Dreamplug Technologies Private Limited
///
/// Use of this source code is governed by the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License in the LICENSE file or at
/// http://www.apache.org/licenses/LICENSE-2.0

typedef SafeFutureFunction<T> = Future<T> Function();

Future<T?> safeFuture<T>(SafeFutureFunction<T?> func, {T? fallback}) async {
  T? generic;
  try {
    generic = await func.call();
  } catch (_) {
    generic = fallback;
  }
  return generic;
}
