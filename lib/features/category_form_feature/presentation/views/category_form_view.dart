import 'package:customer_service_realtime_chat/core/widgets/custom_appbar.dart';
import 'package:customer_service_realtime_chat/features/category_form_feature/presentation/views/widgets/logout_bloc_consumer_button.dart';
import 'package:customer_service_realtime_chat/features/category_form_feature/presentation/views/widgets/primary_introcuction_text.dart';
import 'package:customer_service_realtime_chat/features/category_form_feature/presentation/views/widgets/secoundary_introcuction_text.dart';
import 'package:customer_service_realtime_chat/features/category_form_feature/presentation/views/widgets/category_form_radio_button_list_view.dart';
import 'package:customer_service_realtime_chat/features/category_form_feature/presentation/views/widgets/start_chat_bloc_consumer_button.dart';
import 'package:flutter/material.dart';

class CategoryFormView extends StatefulWidget {
  const CategoryFormView({super.key});

  @override
  State<CategoryFormView> createState() => _CategoryFormViewState();
}

class _CategoryFormViewState extends State<CategoryFormView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: ""),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            PrimaryIntrocuctionText(),
            SecoundaryIntrocuctionText(),
            CategorySelectionRadioButton(),
            SizedBox(
              height: 20,
            ),
            StartChatBlocConsumerButton(),
            SizedBox(height: 20),
            LogoutBlocConsumerButton()
          ],
        ),
      ),
    );
  }
}
