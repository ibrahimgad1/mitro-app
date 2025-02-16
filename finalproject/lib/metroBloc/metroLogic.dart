// metrologic.dart
import 'package:finalproject/metroBloc/MetroBloc.dart';
import 'package:finalproject/metroBloc/metroState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MetroBloc extends Bloc<MetroEvent, MetroState> {
  MetroBloc() : super(MetroInitial());

  @override
  Stream<MetroState> mapEventToState(MetroEvent event) async* {
    if (event is FetchTicketLogs) {
      yield TicketLogsLoading();
      try {
        // Simulate fetching ticket logs from an API or database
        await Future.delayed(Duration(seconds: 2)); // Simulated delay
        List<Map<String, dynamic>> ticketLogs = [
          {'line': 'Line 1', 'departure': 'Station A', 'destination': 'Station B', 'price': 2.5},
          {'line': 'Line 2', 'departure': 'Station C', 'destination': 'Station D', 'price': 3.0},
        ];
        yield TicketLogsLoaded(ticketLogs);
      } catch (e) {
        yield MetroError("Failed to fetch ticket logs.");
      }
    } else if (event is SaveTicket) {
      // Implement ticket saving logic here
      // After saving, yield a new state or handle according to your needs
      yield MetroInitial(); // or another state if needed
    }
  }
}
