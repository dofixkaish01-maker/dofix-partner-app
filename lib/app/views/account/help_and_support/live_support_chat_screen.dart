import 'package:flutter/material.dart';

const Color primaryAppColor = Color(0xff227fa8);

class SupportChatScreen extends StatefulWidget {
  const SupportChatScreen({super.key});

  @override
  State<SupportChatScreen> createState() => _SupportChatScreenState();
}

class _SupportChatScreenState extends State<SupportChatScreen> {
  final ScrollController _scroll = ScrollController();
  final TextEditingController _text = TextEditingController();
  final FocusNode _focus = FocusNode();
  final ValueNotifier<bool> _canSend = ValueNotifier(false);

  final List<ChatMessage> _messages = [
    ChatMessage(
      id: "1",
      text: "Hi! Support team here. Kaise help kar sakte hain?",
      isMe: false,
      createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
    ),
    ChatMessage(
      id: "2",
      text: "Booking accept karne ke baad address open nahi ho raha.",
      isMe: true,
      createdAt: DateTime.now().subtract(const Duration(minutes: 9)),
    ),
  ];

  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();

    _text.addListener(() {
      _canSend.value = _text.text.trim().isNotEmpty;
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    _text.dispose();
    _focus.dispose();
    _canSend.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final text = _text.text.trim();
    if (text.isEmpty) return;

    _text.clear();
    _focus.requestFocus();

    final msg = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      isMe: true,
      createdAt: DateTime.now(),
      status: MessageStatus.sending,
    );

    setState(() {
      _messages.insert(0, msg);
    });

    _scroll.animateTo(
      0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );

    await Future.delayed(const Duration(milliseconds: 600));

    final index = _messages.indexWhere((m) => m.id == msg.id);
    if (index != -1) {
      setState(() {
        _messages[index] =
            _messages[index].copyWith(status: MessageStatus.sent);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [primaryAppColor, Color(0xff2f93bd)],
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const _ChatAppBarTitle(),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF4F8FB), Color(0xFFEAF3F9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scroll,
                  reverse: true,
                  padding: const EdgeInsets.all(16),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return _ChatBubble(message: _messages[index]);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 12, right: 12, bottom: bottom > 0 ? 12 : 16),
                child: _ChatInputBar(
                  controller: _text,
                  focusNode: _focus,
                  canSend: _canSend,
                  onSend: _send,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* ---------------- APP BAR ---------------- */

class _ChatAppBarTitle extends StatelessWidget {
  const _ChatAppBarTitle();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.support_agent, color: Colors.white),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "AI Help & Support",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
            Text(
              "Online • Replies in seconds",
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        )
      ],
    );
  }
}

/* ---------------- INPUT BAR ---------------- */

class _ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueNotifier<bool> canSend;
  final Future<void> Function() onSend;

  const _ChatInputBar({
    required this.controller,
    required this.focusNode,
    required this.canSend,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.08),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: "Type your message…",
                  border: InputBorder.none,
                ),
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: canSend,
              builder: (_, ok, __) {
                return AnimatedScale(
                  scale: ok ? 1 : 0.9,
                  duration: const Duration(milliseconds: 150),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: ok ? () => onSend() : null,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: ok
                            ? primaryAppColor
                            : primaryAppColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:
                          const Icon(Icons.send, color: Colors.white, size: 18),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

/* ---------------- CHAT BUBBLE ---------------- */

class _ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const _ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;

    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 250),
      tween: Tween(begin: 0.95, end: 1.0),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          constraints: const BoxConstraints(maxWidth: 300),
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 8),
          decoration: BoxDecoration(
            color: isMe ? primaryAppColor : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(18),
              topRight: const Radius.circular(18),
              bottomLeft: Radius.circular(isMe ? 18 : 6),
              bottomRight: Radius.circular(isMe ? 6 : 18),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 8,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  message.text,
                  style: TextStyle(
                    color: isMe ? Colors.white : Colors.black87,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                _time(message.createdAt),
                style: TextStyle(
                  fontSize: 11,
                  color: isMe ? Colors.white70 : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _time(DateTime dt) {
    final h = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final m = dt.minute.toString().padLeft(2, '0');
    final ap = dt.hour >= 12 ? "PM" : "AM";
    return "$h:$m $ap";
  }
}

/* ---------------- MODELS ---------------- */

enum MessageStatus { sending, sent, failed }

class ChatMessage {
  final String id;
  final String text;
  final bool isMe;
  final DateTime createdAt;
  final MessageStatus status;

  const ChatMessage({
    required this.id,
    required this.text,
    required this.isMe,
    required this.createdAt,
    this.status = MessageStatus.sent,
  });

  ChatMessage copyWith({MessageStatus? status}) {
    return ChatMessage(
      id: id,
      text: text,
      isMe: isMe,
      createdAt: createdAt,
      status: status ?? this.status,
    );
  }
}
