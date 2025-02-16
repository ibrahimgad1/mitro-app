// metro_state.dart
abstract class MetroState {}

class MetroInitial extends MetroState {}

class TicketLogsLoading extends MetroState {}

class TicketLogsLoaded extends MetroState {
  final List<Map<String, dynamic>> ticketLogs;

  TicketLogsLoaded(this.ticketLogs);
}

class MetroError extends MetroState {
  final String message;

  MetroError(this.message);
}
