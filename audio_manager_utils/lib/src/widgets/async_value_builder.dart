import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/utils.dart';
import 'indicators.dart';

abstract class AsyncValueBuilderBase<T> extends StatelessWidget {
  const AsyncValueBuilderBase({
    super.key,
    required this.value,
    required this.builder,
    this.errorBuilder,
    this.loadingBuilder,
    this.onTryAgain,
    this.isCompact = false,
    this.emptyBuilder,
    this.emptyMsg,
  });
  final AsyncValue<T> value;
  final Widget Function(BuildContext context, T data) builder;
  final Widget Function(BuildContext context, Object error, StackTrace? stackTrace)? errorBuilder;
  final Widget Function(BuildContext context)? loadingBuilder;
  final bool isCompact;
  final FutureCallback? onTryAgain;
  final WidgetBuilder? emptyBuilder;
  final String? emptyMsg;

  static Widget _defaultLoadingBuilder(BuildContext context) => const AppLoadingIndicator();

  Widget _defaultErrorBuilder(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  ) {
    if (isCompact) {
      return Center(
          child: AppExceptionIndicatorCompact(message: error.toString(), onTryAgain: onTryAgain));
    } else {
      return Center(
          child: AppExceptionIndicator(message: error.toString(), onTryAgain: onTryAgain));
    }
  }

  Widget defaultEmptyBuilder(BuildContext context) {
    return Center(
      child: AppExceptionIndicator(
        title: emptyMsg ?? 'Nothing to show',
        onTryAgain: onTryAgain,
      ),
    );
  }
}

class AsyncValueBuilder<T> extends AsyncValueBuilderBase<T> {
  const AsyncValueBuilder({
    super.key,
    required super.value,
    required super.builder,
    super.errorBuilder,
    super.loadingBuilder,
    super.onTryAgain,
    super.isCompact = false,
    super.emptyBuilder,
    super.emptyMsg,
  });

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: (data) {
        if (data is List) {
          if (data.isEmpty) {
            return emptyBuilder?.call(context) ?? defaultEmptyBuilder(context);
          }
        }
        return builder(context, data);
      },
      loading: () => loadingBuilder?.call(context) ?? const AppLoadingIndicator(),
      error: (error, stackTrace) {
        return errorBuilder?.call(context, error, stackTrace) ??
            _defaultErrorBuilder(context, error, stackTrace);
      },
    );
  }
}

class SliverAsyncValueBuilder<T> extends AsyncValueBuilderBase<T> {
  const SliverAsyncValueBuilder({
    super.key,
    required super.value,
    required super.builder,
    super.errorBuilder,
    super.loadingBuilder,
    super.onTryAgain,
    super.isCompact = false,
    super.emptyBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return AsyncValueBuilder<T>(
      value: value,
      builder: (context, data) {
        if (data is List) {
          if (data.isEmpty) {
            return emptyBuilder?.call(context) ??
                SliverFillRemaining(child: defaultEmptyBuilder(context));
          }
        }
        return builder(context, data);
      },
      errorBuilder: (context, error, stackTrace) {
        if (errorBuilder != null) {
          return errorBuilder!(context, error, stackTrace);
        } else {
          return SliverFillRemaining(child: _defaultErrorBuilder(context, error, stackTrace));
        }
      },
      loadingBuilder: (context) {
        if (loadingBuilder != null) {
          return loadingBuilder!(context);
        } else {
          return const SliverFillRemaining(child: AppLoadingIndicator());
        }
      },
      onTryAgain: onTryAgain,
      isCompact: isCompact,
    );
  }
}
