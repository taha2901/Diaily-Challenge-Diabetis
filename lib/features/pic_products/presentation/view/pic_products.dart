import 'dart:io';
import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:easy_localization/easy_localization.dart';

class PicProductsView extends StatefulWidget {
  const PicProductsView({super.key});

  @override
  _PicProductsViewState createState() => _PicProductsViewState();
}

class _PicProductsViewState extends State<PicProductsView> {
  late GenerativeModel _model;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String _generatedText = LocaleKeys.press_to_generate.tr();
  bool _isSuitable = false;

  @override
  void initState() {
    super.initState();
    _initializeAIModel();
  }

  Future<void> _initializeAIModel() async {
    const apiKey = 'AIzaSyDsN-tbFeESwYRXP_X59F7F1hXE8HYRjgs';
    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
      generationConfig: GenerationConfig(maxOutputTokens: 300),
    );
  }

  Future<void> _pickImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);

    if (!mounted) return;

    setState(() {
      _image = image;
      _generatedText = LocaleKeys.generating.tr();
      _isSuitable = false;
    });

    if (_image != null) {
      await _generateText();
    }
  }

  Future<void> _generateText() async {
    if (_image == null) {
      setState(() {
        _generatedText = LocaleKeys.please_pick_image.tr();
        _isSuitable = false;
      });
      return;
    }

    final imageBytes = await _image!.readAsBytes();

    final prompt = TextPart(
      context.locale.languageCode == "ar"
          ? "بصفتك خبيرًا متخصصًا في تقييم ملاءمة الفواكه والأطعمة للأفراد المصابين بمرض السكري، "
                "مهمتك تتضمن تحليل الصور الواردة المتعلقة بأصناف مختلفة من الأطعمة. "
                "الهدف الأول هو تحديد نوع الفاكهة أو الطعام المتواجد في الصورة. "
                "بعد ذلك، يجب عليك تحديد المؤشر الغلايسيمي (GI) للعنصر المحدد. "
                "بناءً على هذا المؤشر، قدم توصيات حول ما إذا كان بإمكان الأفراد المصابين بالسكري أن يدخلوا الطعام المكتشف في نظامهم الغذائي. "
                "إذا كان الطعام مناسبًا، فحدد الكمية الموصى بها للاستهلاك. "
                "إذا لم يكن مناسبًا، فأوصي ببديل."
          : "As an expert specialized in evaluating the suitability of fruits and foods for people with diabetes, "
                "your task is to analyze the provided food images. "
                "First, identify the type of fruit or food shown in the picture. "
                "Then, determine its Glycemic Index (GI). "
                "Based on this index, provide recommendations on whether the identified food can be included in the diet of diabetic individuals. "
                "If it is suitable, specify the recommended portion size. "
                "If it is not suitable, suggest an alternative option.",
    );

    final imagePart = DataPart('image/jpeg', imageBytes);

    try {
      final response = await _model.generateContent([
        Content.multi([prompt, imagePart]),
      ]);

      if (!mounted) return;

      setState(() {
        _generatedText = response.text.toString();
        _isSuitable = _checkIfSuitable(response.text.toString());
      });
    } catch (e) {
      setState(() {
        _generatedText = LocaleKeys.error_generating.tr();
        _isSuitable = false;
      });
    }
  }

  bool _checkIfSuitable(String generatedText) {
    return generatedText.toLowerCase().contains('suitable') ||
        generatedText.contains("مناسب");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              Text(
                LocaleKeys.check_food_suitability.tr(),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.mainBlue,
                  letterSpacing: 1.1,
                ),
              ),
              verticalSpace(18),
              Expanded(
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _image != null
                        ? Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.file(
                                  File(_image!.path),
                                  height: 180,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              verticalSpace(18),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Text(
                                    _generatedText,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16.5,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image_outlined,
                                  size: 80,
                                  color: Colors.grey[300],
                                ),
                                verticalSpace(12),
                                Text(
                                  LocaleKeys.no_image.tr(),
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              ),
              verticalSpace(18),
              if (_isSuitable)
                Card(
                  color: Colors.green.shade600,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 16,
                    ),
                    child: Text(
                      LocaleKeys.suitable_message.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.5,
                      ),
                    ),
                  ),
                ),
              verticalSpace(16),
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorsManager.mainBlue,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: ColorsManager.mainBlue.withOpacity(0.18),
                          blurRadius: 12,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(18),
                    child: const Icon(
                      Iconsax.camera,
                      size: 38,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              verticalSpace(12),
            ],
          ),
        ),
      ),
    );
  }
}
