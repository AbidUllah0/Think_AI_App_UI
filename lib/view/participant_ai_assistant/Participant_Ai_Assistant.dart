import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:think_ai/utils/app_text_styles/text_styles.dart';
import 'package:think_ai/view/participant_ai_assistant/model/messages.dart';
import 'package:think_ai/view/participant_registration/components/registration_textField.dart';
import 'package:think_ai/widget/custom_app_bar/app_bar.dart';
import 'package:think_ai/widget/custom_text/custom_text.dart';

import '../../utils/app_colors/app_colors.dart';

class ParticipantAiAssistant extends StatefulWidget {
  @override
  State<ParticipantAiAssistant> createState() => _ParticipantAiAssistantState();
}

class _ParticipantAiAssistantState extends State<ParticipantAiAssistant> {
  TextEditingController _sendMessageController = TextEditingController();
  ScrollController _continousScrollController = ScrollController();
  final List<Messages> messages = [];

  void continuousScroll() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_continousScrollController.hasClients) {
        _continousScrollController.animateTo(
            _continousScrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut);
      }
    });
  }

  void sendMessage(String message) {
    setState(() {
      messages.add(Messages(text: message, isSend: true));
      _sendMessageController.clear();
      Future.delayed(Duration(seconds: 2), () {
        receiveMessage('Reply: Got it!');
      });
    });
  }

  void receiveMessage(String message) {
    setState(() {
      messages.add(Messages(text: message, isSend: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        toolbarHeight: 60.h,
        leading: CustomAppBar(
          text: "Ai Assistant",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        leadingWidth: double.infinity,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: AppColors.borderColor,
                  ),
                ),
                child: ListView.builder(
                  itemCount: messages.length,
                  controller: _continousScrollController,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    continuousScroll();
                    return Align(
                      alignment: messages[index].isSend == true
                          ? Alignment.bottomLeft
                          : Alignment.bottomRight,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        margin: EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xffFAFAFA),
                          border: Border.all(
                            color: AppColors.borderColor,
                          ),
                        ),
                        child: CustomText(
                          textAlign: TextAlign.start,
                          text: messages[index].text,
                          style: AppTextStyles.texfFieldLabel.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: CustomTextField(
                  controller: _sendMessageController,
                  // scrollController: _scrollController,
                  hintText: 'Enter Your Promt',
                  labelText: '',
                  sIcon: IconButton(
                    onPressed: () {
                      final message = _sendMessageController.text;
                      if (message.isNotEmpty) {
                        sendMessage(message);
                      } else {
                        // Handle empty message
                        print('Message is empty');
                      }
                    },
                    icon: Icon(Icons.send),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
