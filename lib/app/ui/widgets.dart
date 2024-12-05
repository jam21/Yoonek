import 'package:flutter/material.dart';
import 'package:yoonek/data/network/apis.dart';



typedef OnResponseLoading = Widget Function(BuildContext context);
typedef OnResponseError = void Function(
    BuildContext context, Exception exception);
typedef OnResponseSuccess<T> = void Function(BuildContext context, T data);

class ResponseListenableBuilder<T> extends StatelessWidget {
  const ResponseListenableBuilder(
      {super.key,
      required this.listenable,
      required this.child,
      this.onResponseLoading = _onLoading,
      this.onResponseSuccess,
      this.onResponseError = _onError});

  final ResponseNotifier listenable;
  final Widget child;
  final OnResponseLoading? onResponseLoading;
  final OnResponseError? onResponseError;
  final OnResponseSuccess<T>? onResponseSuccess;

  static Widget _onLoading(BuildContext context) {
    return const CircularProgressIndicator();
  }

  static void _onError(BuildContext context, Exception exception) {
        Future.delayed(Duration.zero, () {
      if (context.mounted) {
        showDialog(context: context, builder: (context){return AlertDialog(
      title: Text("Error"),
      content: Text(exception.toString()),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("OK"))
      ],
    );});
      }
    });

    
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: listenable,
        child: child,
        builder: (context, child) {
          if (listenable.response is Error && onResponseError != null) {
            onResponseError!(context, (listenable.response as Error).exception);
          }

          if (listenable.response is Success && onResponseSuccess != null) {
            Future.delayed(Duration.zero, () {
              if (context.mounted) {
                onResponseSuccess!(
                    context, (listenable.response as Success).data);
              }
            });
          }
          return Stack(alignment: Alignment.center, children: [
            child ?? SizedBox.shrink(),
            if (listenable.response is Loading && onResponseLoading != null)
              onResponseLoading!(context)
          ]);
        });
  }
}
