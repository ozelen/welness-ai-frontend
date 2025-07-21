import 'package:flutter/cupertino.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import '../models/message.dart';
import '../services/chat_service.dart';
import '../widgets/chat_input.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<ChatMessage> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadInitialMessage();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadInitialMessage() {
    // Add welcome message
    _messages.add(
      ChatMessage(
        id: 'welcome',
        text: 'Hello! I\'m WellAI, your wellness assistant. How can I help you today?',
        sender: MessageSender.ai,
        timestamp: DateTime.now(),
      ),
    );
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  Future<void> _sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    // Add user message
    final userMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      sender: MessageSender.user,
      timestamp: DateTime.now(),
    );

    setState(() {
      _messages.add(userMessage);
      _isLoading = true;
    });

    _scrollToBottom();

    // Get AI response
    try {
      final aiResponse = await ChatService.sendMessage(text, 1); // TODO: Use actual user ID
      
      setState(() {
        _messages.add(aiResponse);
        _isLoading = false;
      });
      
      _scrollToBottom();
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      
      // Show error message
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Error'),
          content: Text('Failed to send message: $e'),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }

  void _onGoalTap() {
    _sendMessage('I want to set a new wellness goal');
  }

  void _onMealTap() {
    _sendMessage('I want to log my meal');
  }

  void _onWorkoutTap() {
    _sendMessage('I want to log my workout');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('WellAI Chat'),
        backgroundColor: CupertinoColors.systemBackground,
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.person_2),
          onPressed: () {
            // TODO: Navigate to human chat
            showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: const Text('Coming Soon'),
                content: const Text('Human chat feature is coming soon!'),
                actions: [
                  CupertinoDialogAction(
                    child: const Text('OK'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            );
          },
        ),
              ),
        child: SafeArea(
          child: Column(
            children: [
              // Messages list
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: _messages.length + (_isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == _messages.length && _isLoading) {
                      // Loading indicator
                      return Padding(
                        padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemGrey5,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CupertinoActivityIndicator(),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'WellAI is typing...',
                                    style: TextStyle(
                                      color: CupertinoColors.systemGrey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    final message = _messages[index];
                    final isUser = message.sender == MessageSender.user;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: isUser 
                            ? MainAxisAlignment.end 
                            : MainAxisAlignment.start,
                        children: [
                          if (!isUser) ...[
                            Container(
                              width: 32,
                              height: 32,
                              decoration: const BoxDecoration(
                                color: CupertinoColors.systemGreen,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                CupertinoIcons.heart_fill,
                                color: CupertinoColors.white,
                                size: 16,
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                          Flexible(
                            child: BubbleSpecialThree(
                              text: message.text,
                              color: isUser 
                                  ? CupertinoColors.systemGreen
                                  : CupertinoColors.systemGrey5,
                              tail: true,
                              isSender: isUser,
                              textStyle: TextStyle(
                                color: isUser ? CupertinoColors.white : CupertinoColors.label,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          if (isUser) ...[
                            const SizedBox(width: 8),
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemGrey4,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                CupertinoIcons.person_fill,
                                color: CupertinoColors.white,
                                size: 16,
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Chat input
              ChatInput(
                onSendMessage: _sendMessage,
                onGoalTap: _onGoalTap,
                onMealTap: _onMealTap,
                onWorkoutTap: _onWorkoutTap,
              ),
            ],
          ),
        ),
    );
  }
} 