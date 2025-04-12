import 'package:customer_service_realtime_chat/core/util/app_router/app_router.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_appbar.dart';
import 'package:customer_service_realtime_chat/core/widgets/custom_material_button.dart';
import 'package:customer_service_realtime_chat/features/category_form_feature/presentation/views/widgets/primary_introcuction_text.dart';
import 'package:customer_service_realtime_chat/features/category_form_feature/presentation/views/widgets/secoundary_introcuction_text.dart';
import 'package:customer_service_realtime_chat/features/category_form_feature/presentation/views/widgets/category_form_radio_button_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            CustomMaterialButton(
              text: "start chat",
              onPressed: () async {
                await GoRouter.of(context).push(AppRouter.kchatView);
              },
            ),
            SizedBox(height: 20),
            CustomMaterialButton(
              text: "Logout",
              onPressed: () async {},
            )
          ],
        ),
      ),
    );
  }
}
