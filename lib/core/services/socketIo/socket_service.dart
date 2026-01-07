// ignore_for_file: library_prefixes


import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:wave_drive/core/configs/app_config.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';

class SocketService {
  late IO.Socket socket;
  Map<String, dynamic> _token = {"token": ""};

  
  
  
  void setHeaderToken(String token) {
    _token = {"token": token};
  }

  void removeHeaderToken() {
    _token = {"token": ""};
  }

  void connect() {

    try {
      socket = IO.io(
        AppConfig.socketIoUrl,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .setAuth(_token)
            .build(),
      );

      socket.onConnect((_) {
        AppLogger.d("Connected to Socket.IO server");
      });

      socket.onDisconnect((_) {
        AppLogger.d("Disconnected from Socket.IO server");
      });
    } catch (error) {
      AppLogger.d("Error connecting to Socket.IO server: $error");
    }
  }

  void disconnect() {
    try {
      socket.disconnect();
      AppLogger.d("Socket disconnected successfully");
    } catch (error) {
      AppLogger.d("Error disconnecting from Socket.IO server: $error");
    }
  }

  void listenToMessages(String event, Function(dynamic) callback) {
    socket.on(event, callback);
  }

  void disposeMessageListener(String event, [Function(dynamic)? callback]) {
    if (callback != null) {
      socket.off(event, callback); 
    } else {
      socket.off(event); 
    }
  }


  void emitEvent(String event, dynamic data) {
  try {
    socket.emit(event, data);
    AppLogger.d("Emitted $event with data: $data");
  } catch (error) {
    AppLogger.d("Error emitting event $event: $error");
  }
}


}




