import 'package:flutter/cupertino.dart';

class ChatInput extends StatefulWidget {
  final Function(String) onSendMessage;
  final Function()? onGoalTap;
  final Function()? onMealTap;
  final Function()? onWorkoutTap;

  const ChatInput({
    super.key,
    required this.onSendMessage,
    this.onGoalTap,
    this.onMealTap,
    this.onWorkoutTap,
  });

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController _controller = TextEditingController();
  bool _isTyping = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final message = _controller.text.trim();
    if (message.isNotEmpty) {
      widget.onSendMessage(message);
      _controller.clear();
      setState(() {
        _isTyping = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        border: Border(
          top: BorderSide(
            color: CupertinoColors.separator,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        children: [
          // Quick action buttons
          if (!_isTyping) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _QuickActionButton(
                  icon: CupertinoIcons.flag,
                  label: 'Goal',
                  onTap: widget.onGoalTap,
                  color: CupertinoColors.systemBlue,
                ),
                _QuickActionButton(
                  icon: CupertinoIcons.cart,
                  label: 'Meal',
                  onTap: widget.onMealTap,
                  color: CupertinoColors.systemGreen,
                ),
                _QuickActionButton(
                  icon: CupertinoIcons.heart_fill,
                  label: 'Workout',
                  onTap: widget.onWorkoutTap,
                  color: CupertinoColors.systemOrange,
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
          // Message input
          Row(
            children: [
              Expanded(
                child: CupertinoTextField(
                  controller: _controller,
                  onChanged: (value) {
                    setState(() {
                      _isTyping = value.isNotEmpty;
                    });
                  },
                  onSubmitted: (_) => _sendMessage(),
                  placeholder: 'Type your message...',
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey6,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  maxLines: null,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                decoration: const BoxDecoration(
                  color: CupertinoColors.systemGreen,
                  shape: BoxShape.circle,
                ),
                child: CupertinoButton(
                  padding: const EdgeInsets.all(12),
                  onPressed: _sendMessage,
                  child: const Icon(
                    CupertinoIcons.arrow_up,
                    color: CupertinoColors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Color color;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 