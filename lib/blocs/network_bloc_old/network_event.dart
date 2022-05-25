import '../network_bloc_old/network_state.dart';

abstract class NetworkEvent{}
class ConnectionChanged extends NetworkEvent{
  ConnectionChanged(this.connection);
  final NetworkState connection;

}
class ListenConnection extends NetworkEvent{}
