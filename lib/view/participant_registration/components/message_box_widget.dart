import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:think_ai/utils/app_colors/app_colors.dart';
import 'package:think_ai/view/participant_ai_assistant/Participant_Ai_Assistant.dart';

import '../provider/speech_provider.dart';

class MessageBoxWidget extends StatelessWidget {
  const MessageBoxWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SpeechProvider>(
      builder: (context, provider, child) {
        if (!provider.isListening) {
          provider.initializeSpeech();
        }
        return Container(
          height: 0.15.sh,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(5.0.w),
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.r),
                child: TextField(
                  controller:
                      TextEditingController(text: provider.recognizedText),
                  cursorColor: AppColors.textColor2,
                  // style: AppTextStyles.paragraphStyle,
                  maxLines: null, // Allow multiple lines of input
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {
                        provider.isListening
                            ? provider.stopListening()
                            : provider.startListening();
                      },
                      icon: Icon(
                        Icons.keyboard_voice_outlined,
                      ),
                    ),
                    hintText: 'Enter your Message',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ParticipantAiAssistant(),
                      ),
                    );
                  },
                  icon: Icon(Icons.send),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
