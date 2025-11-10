// import 'dart:async';
// import 'dart:convert';
// import 'package:web_socket_channel/web_socket_channel.dart';

// import 'package:wave_drive/core/shared/utils/app_logger.dart';

// class MexcWebSocketService {
//   static const String _baseUrl = 'wss://wbs-api.mexc.com/ws';

//   WebSocketChannel? _channel;
//   Timer? _pingTimer;
//   final StreamController<List<MexcTicker>> _tickerController =
//       StreamController<List<MexcTicker>>.broadcast();
//   final StreamController<Map<String, dynamic>> _klineController =
//       StreamController<Map<String, dynamic>>.broadcast();
//   final StreamController<Map<String, dynamic>> _bookTickerController =
//       StreamController<Map<String, dynamic>>.broadcast();
//   final StreamController<Map<String, dynamic>> _depthController =
//       StreamController<Map<String, dynamic>>.broadcast();

//   bool _isConnected = false;
//   bool _isSubscribed = false;
//   bool _isKlineSubscribed = false;
//   bool _isBookTickerSubscribed = false;
//   bool _isDepthSubscribed = false;

//   // Track active channels to resubscribe on reconnect
//   final Set<String> _activeChannels = <String>{};

//   Stream<List<MexcTicker>> get tickerStream => _tickerController.stream;
//   Stream<Map<String, dynamic>> get klineStream => _klineController.stream;
//   Stream<Map<String, dynamic>> get bookTickerStream =>
//       _bookTickerController.stream;
//   Stream<Map<String, dynamic>> get depthStream => _depthController.stream;
//   bool get isConnected => _isConnected;

//   // new start

//   // new end

//   /// Connect to MEXC WebSocket
//   Future<void> connect() async {
//     try {
//       if (_isConnected && _channel != null) return;

//       _channel = WebSocketChannel.connect(Uri.parse(_baseUrl));

//       _channel!.stream.listen(
//         _handleMessage,
//         onError: _handleError,
//         onDone: _handleDisconnection,
//       );

//       _isConnected = true;
//       _startPingTimer();

//       AppLogger.d('MEXC WebSocket connected successfully');

//       // Resubscribe previously active channels
//       if (_activeChannels.isNotEmpty) {
//         await subscribeChannels(_activeChannels.toList());
//       }
//     } catch (e) {
//       AppLogger.d('Failed to connect to MEXC WebSocket: $e');
//       _isConnected = false;
//       rethrow;
//     }
//   }





//   /// Subscribe to tickers data
//   Future<void> subscribeToTickers() async {
//     if (!_isConnected || _channel == null) {
//       throw Exception('WebSocket not connected');
//     }

//     final subscriptionMessage = {
//       "method": "sub.tickers",
//       "param": {"symbol": "USDT"},
//       "gzip": false,
//     };

//     _channel!.sink.add(jsonEncode(subscriptionMessage));
//     _isSubscribed = true;
//     _activeChannels.add('legacy:sub.tickers@USDT');

//     AppLogger.d('Subscribed to MEXC tickers');
//   }

//   /// Generic Spot v3 subscription helper
//   Future<void> subscribeChannels(List<String> channels) async {
//     if (!_isConnected || _channel == null || channels.isEmpty) return;
//     final msg = {
//       "method": "SUBSCRIPTION",
//       "params": channels,
//     };
//     _channel!.sink.add(jsonEncode(msg));
//     _activeChannels.addAll(channels);
//     AppLogger.d('Subscribed channels: $channels');
//   }

//   Future<void> unsubscribeChannels(List<String> channels) async {
//     if (!_isConnected || _channel == null || channels.isEmpty) return;
//     final msg = {
//       "method": "UNSUBSCRIPTION",
//       "params": channels,
//     };
//     _channel!.sink.add(jsonEncode(msg));
//     _activeChannels.removeAll(channels);
//     AppLogger.d('Unsubscribed channels: $channels');
//   }

//   /// Subscribe to K-line (candlestick) data for a symbol and interval
//   /// interval examples: 'Min1','Min5','Min15','Min30','Min60','Hour4','Day1'
//   Future<void> subscribeToKline({
//     required String symbol,
//     required String interval,
//   }) async {
//     if (!_isConnected || _channel == null) {
//       throw Exception('WebSocket not connected');
//     }

//     final subscriptionMessage = {
//       "method": "sub.kline",
//       "param": {"symbol": symbol, "interval": interval},
//       "gzip": false,
//     };

//     _channel!.sink.add(jsonEncode(subscriptionMessage));
//     _isKlineSubscribed = true;

//     AppLogger.d('Subscribed to MEXC kline for $symbol ($interval)');
//   }

//   Future<void> unsubscribeKline({
//     required String symbol,
//     required String interval,
//   }) async {
//     if (!_isConnected || _channel == null) return;
//     final unsub = {
//       "method": "unsub.kline",
//       "param": {"symbol": symbol, "interval": interval},
//       "gzip": false,
//     };
//     _channel!.sink.add(jsonEncode(unsub));
//     AppLogger.d('Unsubscribed kline: $symbol@$interval');
//   }

//   /// Subscribe to aggregate book ticker (best bid/ask) for a symbol
//   Future<void> subscribeToBookTicker({required String symbol, String interval = '100ms'}) async {
//     final s = symbol.toUpperCase();
//     if (!_isConnected || _channel == null) {
//       throw Exception('WebSocket not connected');
//     }
//     final channel = 'spot@public.aggre.bookTicker.v3.api.pb@$interval@$s';
//     await subscribeChannels([channel]);
//     _isBookTickerSubscribed = true;
//   }

//   /// Unsubscribe from aggregate book ticker
//   Future<void> unsubscribeFromBookTicker({required String symbol, String interval = '100ms'}) async {
//     if (!_isConnected || _channel == null || !_isBookTickerSubscribed) {
//       return;
//     }
//     final s = symbol.toUpperCase();
//     final channel = 'spot@public.aggre.bookTicker.v3.api.pb@$interval@$s';
//     await unsubscribeChannels([channel]);
//     _isBookTickerSubscribed = false;
//   }

//   /// Subscribe to Diff.Depth stream for a symbol
//   Future<void> subscribeToDepth({required String symbol, String interval = '100ms'}) async {
//     final s = symbol.toUpperCase();
//     if (!_isConnected || _channel == null) {
//       throw Exception('WebSocket not connected');
//     }
//     final channel = 'spot@public.aggre.depth.v3.api.pb@$interval@$s';
//     await subscribeChannels([channel]);
//     _isDepthSubscribed = true;
//   }

//   /// Unsubscribe from Diff.Depth
//   Future<void> unsubscribeFromDepth({required String symbol, String interval = '100ms'}) async {
//     if (!_isConnected || _channel == null || !_isDepthSubscribed) {
//       return;
//     }

//     final s = symbol.toUpperCase();
//     final channel = 'spot@public.aggre.depth.v3.api.pb@$interval@$s';
//     await unsubscribeChannels([channel]);
//     _isDepthSubscribed = false;
//   }

//   /// Unsubscribe from tickers data
//   Future<void> unsubscribeFromTickers() async {
//     if (!_isConnected || _channel == null || !_isSubscribed) {
//       return;
//     }

//     final unsubscriptionMessage = {
//       "method": "unsub.tickers",
//       "param": {"symbol": "BTCUSDT"},
//       "gzip": false,
//     };

//     _channel!.sink.add(jsonEncode(unsubscriptionMessage));
//     _isSubscribed = false;

//     AppLogger.d('Unsubscribed from MEXC tickers');
//   }

//   /// Handle incoming WebSocket messages
//   void _handleMessage(dynamic message) {
//     try {
//       // Check if message is binary (protobuf) or text (JSON)
//       if (message is List<int>) {
//         AppLogger.d(
//           'Received binary message (protobuf): ${message.length} bytes',
//         );
//         // TODO: Implement protobuf deserialization
//         // For now, we'll skip binary messages
//         return;
//       }

//       // Try to parse as JSON
//       final Map<String, dynamic> data = jsonDecode(message as String);

//       // Heartbeat handling
//       if (data.containsKey('ping')) {
//         final pong = {"pong": data['ping']};
//         _channel?.sink.add(jsonEncode(pong));
//         AppLogger.d('Received ping, sent pong');
//         return;
//       }
//       if (data['msg'] == 'PONG') {
//         AppLogger.d('Received PONG');
//         return;
//       }

//       final channel = data['channel'] as String?;
//       AppLogger.d('Channel: $channel');
//       AppLogger.d('Full message data: $data');

//       if (channel == 'push.tickers') {
//         _handleTickerData(data);
//       } else if (channel == 'push.kline' || (channel?.contains('kline.v3') ?? false)) {
//         _klineController.add(data);
//       } else if (channel == 'push.bookTicker' || (channel?.contains('bookTicker') ?? false)) {
//         AppLogger.d('Received book ticker data (old format): $data');
//         _bookTickerController.add(data);
//       } else if (channel?.contains('depth') == true) {
//         AppLogger.d('Received depth data: $data');
//         _depthController.add(data);
//       } else if (channel == 'pong') {
//         // Handle pong response
//         AppLogger.d('Received pong: ${data['data']}');
//       } else if (channel?.startsWith('rs.') == true) {
//         // Handle subscription responses
//         AppLogger.d('Subscription response: $channel - ${data['data']}');
//         if (channel == 'rs.error') {
//           AppLogger.d('ERROR: Subscription failed - ${data['data']}');
//         } else if (channel == 'rs.success') {
//           AppLogger.d('SUCCESS: Subscription successful - ${data['data']}');
//         }
//       } else {
//         AppLogger.d('Unknown channel: $channel');
//         AppLogger.d('Full data structure: $data');

//         // Check if this might be book ticker data with a different structure
//         if (data.containsKey('bidPrice') ||
//             data.containsKey('askPrice') ||
//             data.containsKey('bid_price') ||
//             data.containsKey('ask_price') ||
//             data.containsKey('publicbookticker')) {
//           AppLogger.d('POTENTIAL BOOK TICKER DATA DETECTED: $data');
//           _bookTickerController.add(data);
//         }
//       }
//     } catch (e) {
//       AppLogger.d('Error parsing WebSocket message: $e');
//       AppLogger.d('Raw message was: $message');
//     }
//   }

//   /// Handle ticker data updates
//   void _handleTickerData(Map<String, dynamic> data) {
//     try {
//       final List<dynamic> tickerList = data['data'] as List<dynamic>;
//       final List<MexcTicker> tickers = tickerList
//           .map((ticker) => MexcTicker.fromJson(ticker as Map<String, dynamic>))
//           .toList();

//       _tickerController.add(tickers);

//       // Check if ticker data contains book ticker information
//       if (tickerList.isNotEmpty) {
//         final firstTicker = tickerList.first as Map<String, dynamic>;
//         if (firstTicker.containsKey('bidPrice') ||
//             firstTicker.containsKey('askPrice') ||
//             firstTicker.containsKey('bid_price') ||
//             firstTicker.containsKey('ask_price')) {
//           AppLogger.d('BOOK TICKER DATA FOUND IN TICKER STREAM: $firstTicker');
//           _bookTickerController.add(firstTicker);
//         }
//       }
//     } catch (e) {
//       AppLogger.d('Error processing ticker data: $e');
//     }
//   }

//   /// Send ping message to keep connection alive
//   void _sendPing() {
//     if (_channel != null && _isConnected) {
//       final pingMessage = {"method": "PING"};
//       _channel!.sink.add(jsonEncode(pingMessage));
//     }
//   }

//   /// Start ping timer (send ping every 20 seconds)
//   void _startPingTimer() {
//     _pingTimer = Timer.periodic(const Duration(seconds: 20), (_) {
//       _sendPing();
//     });
//   }

//   /// Handle WebSocket errors
//   void _handleError(error) {
//     AppLogger.d('MEXC WebSocket error: $error');
//     _isConnected = false;
//     _isSubscribed = false;

//     // Attempt to reconnect after a delay
//     Timer(const Duration(seconds: 5), () {
//       if (!_isConnected) {
//         reconnect();
//       }
//     });
//   }

//   /// Handle WebSocket disconnection
//   void _handleDisconnection() {
//     AppLogger.d('MEXC WebSocket disconnected');
//     _isConnected = false;
//     _isSubscribed = false;

//     // Attempt to reconnect after a delay
//     Timer(const Duration(seconds: 5), () {
//       if (!_isConnected) {
//         reconnect();
//       }
//     });
//   }

//   /// Reconnect to WebSocket
//   Future<void> reconnect() async {
//     AppLogger.d('Attempting to reconnect to MEXC WebSocket...');
//     await disconnect();
//     await connect();
//     // Subscriptions are re-applied in connect() via _activeChannels
//   }

//   /// Disconnect from WebSocket
//   Future<void> disconnect() async {
//     _pingTimer?.cancel();
//     _pingTimer = null;

//     // Keep _activeChannels for automatic resubscribe after reconnect

//     await _channel?.sink.close();
//     _channel = null;
//     _isConnected = false;
//     _isSubscribed = false;

//     AppLogger.d('MEXC WebSocket disconnected');
//   }

//   /// Dispose resources
//   void dispose() {
//     disconnect();
//     _tickerController.close();
//     _klineController.close();
//     _bookTickerController.close();
//     _depthController.close();
//   }
// }
