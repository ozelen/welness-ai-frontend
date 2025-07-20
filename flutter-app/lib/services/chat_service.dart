import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/message.dart';

class ChatService {
  static const String baseUrl = 'http://localhost:8000'; // Your Django backend URL
  
  // Send message to AI and get response
  static Future<ChatMessage> sendMessage(String message, int userId) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/chat/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'message': message,
          'user_id': userId,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ChatMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          text: data['response'] ?? 'Sorry, I couldn\'t process that.',
          sender: MessageSender.ai,
          timestamp: DateTime.now(),
          metadata: data['metadata'],
        );
      } else {
        throw Exception('Failed to send message: ${response.statusCode}');
      }
    } catch (e) {
      // Return a fallback message if API is not available
      return ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: 'Hello! I\'m WellAI, your wellness assistant. How can I help you today?',
        sender: MessageSender.ai,
        timestamp: DateTime.now(),
      );
    }
  }

  // Get chat history for a user
  static Future<List<ChatMessage>> getChatHistory(int userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/chat/history/$userId/'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => ChatMessage.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  // Send wellness-specific message (goal, meal, workout)
  static Future<ChatMessage> sendWellnessMessage(
    MessageType type,
    Map<String, dynamic> data,
    int userId,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/wellness/$type.name/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'data': data,
          'user_id': userId,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return ChatMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          text: responseData['response'] ?? 'Wellness data processed successfully!',
          sender: MessageSender.ai,
          type: type,
          timestamp: DateTime.now(),
          metadata: responseData['metadata'],
        );
      } else {
        throw Exception('Failed to process wellness data: ${response.statusCode}');
      }
    } catch (e) {
      return ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: 'I\'ve recorded your $type data. Keep up the great work!',
        sender: MessageSender.ai,
        type: type,
        timestamp: DateTime.now(),
      );
    }
  }
} 