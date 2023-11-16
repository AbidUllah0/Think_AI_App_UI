import 'package:flutter/cupertino.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechProvider extends ChangeNotifier {
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = '';

  bool get isListening => _isListening;
  String get recognizedText => _text;

  void initializeSpeech() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        print('Speech recognition status: $status');
      },
      onError: (errorNotification) {
        print('Error: $errorNotification');
      },
    );
    if (available) {
      notifyListeners();
    } else {
      print('The user has denied the use of speech recognition.');
    }
  }

  void startListening() {
    if (!_isListening) {
      _speech.listen(
        onResult: (result) {
          _text = result.recognizedWords;
          notifyListeners();
        },
      );
      _isListening = true;
    } else {
      _speech.stop();
      _isListening = false;
    }
    notifyListeners();
  }

  void stopListening() {
    // Your implementation to stop listening
    _isListening = false;
    // Code to stop speech recognition
    // For example: Stop the speech-to-text engine
    notifyListeners();
  }
}
