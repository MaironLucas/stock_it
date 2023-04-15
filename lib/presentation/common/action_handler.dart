import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stock_it/common/subscription_holder.dart';

class ActionHandler<T> extends StatefulWidget {
  const ActionHandler({
    required this.child,
    required this.actionStream,
    required this.onReceived,
    super.key,
  });

  final Widget child;
  final Stream<T> actionStream;
  final void Function(T action) onReceived;

  @override
  _ActionHandlerState<T> createState() => _ActionHandlerState<T>();
}

class _ActionHandlerState<T> extends State<ActionHandler<T>>
    with SubscriptionHolder {
  @override
  void initState() {
    widget.actionStream
        .listen(
          widget.onReceived,
        )
        .addTo(subscriptions);

    super.initState();
  }

  @override
  void dispose() {
    disposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
