import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:santvani_app/theme/app_colors.dart';

class ChatInputWidget extends StatefulWidget {
  final ValueChanged<String> onSend;
  final ValueChanged<String>? onSendImage;
  final String? initialText;
  final ValueChanged<String>? onSendShare;

  const ChatInputWidget({
    super.key,
    required this.onSend,
    this.onSendImage,
    this.initialText,
    this.onSendShare,
  });

  @override
  State<ChatInputWidget> createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  final TextEditingController _controller = TextEditingController();
  bool _isWriting = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialText != null && widget.initialText!.isNotEmpty) {
      _controller.text = widget.initialText!;
      _isWriting = true;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSend() {
    final String text = _controller.text.trim();
    if (widget.onSendShare != null) {
      widget.onSendShare!(text);
      _controller.clear();
      setState(() {
        _isWriting = false;
      });
    } else if (text.isNotEmpty) {
      widget.onSend(text);
      _controller.clear();
      setState(() {
        _isWriting = false;
      });
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
      );
      if (image != null && widget.onSendImage != null) {
        widget.onSendImage!(image.path);
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 12, top: 8, bottom: 24),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
        border: const Border(
          top: BorderSide(
            color: Color(0xFFEEEEEE),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          // Gallery Image Picker Button
          IconButton(
            icon: const Icon(
              Icons.image_outlined,
              color: Color(0xFFE65100),
              size: 26,
            ),
            onPressed: _pickImage,
          ),

          // 1. Text Field Box
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: const Color(0xFFFF9933).withValues(alpha: 0.15),
                  width: 1.2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: TextField(
                  controller: _controller,
                  onChanged: (final String text) {
                    setState(() {
                      _isWriting = text.trim().isNotEmpty;
                    });
                  },
                  maxLines: 4,
                  minLines: 1,
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColors.primaryTextColor,
                    fontFamily: 'Inter',
                  ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    hintText: 'Type a spiritual message...',
                    hintStyle: TextStyle(
                      color: AppColors.hintTextColor,
                      fontSize: 14,
                      fontFamily: 'Inter',
                    ),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),

          // 2. Circular Send Button
          GestureDetector(
            onTap: (_isWriting || widget.onSendShare != null) ? _handleSend : null,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: (_isWriting || widget.onSendShare != null)
                    ? const LinearGradient(
                        colors: <Color>[
                          Color(0xFFE65100), // Rich Saffron
                          Color(0xFFFFB300), // Saffron Gold
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : LinearGradient(
                        colors: <Color>[
                          Colors.grey.shade300,
                          Colors.grey.shade400,
                        ],
                      ),
                boxShadow: (_isWriting || widget.onSendShare != null)
                    ? <BoxShadow>[
                        BoxShadow(
                          color: const Color(0xFFE65100).withValues(alpha: 0.25),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : null,
              ),
              child: Icon(
                Icons.send_rounded,
                color: (_isWriting || widget.onSendShare != null) ? AppColors.white : Colors.grey.shade600,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
