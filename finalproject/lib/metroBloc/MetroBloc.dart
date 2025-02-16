// metro_event.dart
abstract class MetroEvent {}

class FetchTicketLogs extends MetroEvent {}

class SaveTicket extends MetroEvent {
  final Map<String, dynamic> ticketData;

  SaveTicket(this.ticketData);
}
