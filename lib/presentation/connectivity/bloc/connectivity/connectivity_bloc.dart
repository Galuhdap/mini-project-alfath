import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';
part 'connectivity_bloc.freezed.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  ConnectivityBloc(this._connectivity)
    : super(const ConnectivityState.initial()) {
    on<_CheckConnection>(_onCheckConnection);
    on<_ConnectionChanged>(_onConnectionChanged);

    // Listen perubahan koneksi
    _subscription = _connectivity.onConnectivityChanged.listen((results) {
      // ambil elemen pertama dari list (biasanya hanya satu)
      final result = results.isNotEmpty
          ? results.first
          : ConnectivityResult.none;

      add(
        ConnectivityEvent.connectionChanged(result != ConnectivityResult.none),
      );
    });
  }

  Future<void> _onCheckConnection(
    _CheckConnection event,
    Emitter<ConnectivityState> emit,
  ) async {
    final result = await _connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      emit(const ConnectivityState.disconnected());
    } else {
      emit(const ConnectivityState.connected());
    }
  }

  void _onConnectionChanged(
    _ConnectionChanged event,
    Emitter<ConnectivityState> emit,
  ) {
    if (event.isConnected) {
      emit(const ConnectivityState.connected());
    } else {
      emit(const ConnectivityState.disconnected());
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
