part of 'sanctum_bloc.dart';

abstract class SanctumState extends Equatable {
  const SanctumState();

  @override
  List<Object?> get props => [];
}

class Empty extends SanctumState {}

class Loading extends SanctumState {}

class Loaded extends SanctumState {
  final Sanctum sanctum;

  const Loaded({required this.sanctum});

  @override
  List<Object> get props => [sanctum];
}

class Error extends SanctumState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}

// STATES
//  level 0: empty: space to create the element gets $50: gets XP tap: create environment overlay
//  loading: from repo
//  loaded: [
//  level 1, startup: buttons not activated, restricted by XP level, (create environm first_
//  XP reached, eligible: shinning around, button to build $100 coins com timer 5s,
//  coin spent: building with timer, offer to finish building FREE/Watch ads,
//  time passed or AD wathed: ready as gift: tap for overlay celebration
//  not XP for next level, harvesting rate/hour: GET(x/350) buttom, update not activated)
//  ]
//  error: on failure
// selection [
// selected, arrow on top, ground highlighted,
// not selected: no arrow, ground not highlighted
