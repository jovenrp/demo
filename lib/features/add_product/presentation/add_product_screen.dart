import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrd/features/add_product/bloc/add_product_bloc.dart';
import 'package:nrd/features/add_product/bloc/add_product_state.dart';

import '../../../application/utils/app_colors.dart';
import '../../../application/widgets/custom_appbar.dart';
import '../../../application/widgets/custom_button.dart';
import '../../../application/widgets/custom_textfield.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key, this.token});

  static const String routeName = '/addProduct';
  static const String screenName = 'addProductScreen';

  final String? token;

  static ModalRoute<AddProductScreen> route({String? token}) =>
      MaterialPageRoute<AddProductScreen>(
          settings: const RouteSettings(name: routeName),
          builder: (_) => AddProductScreen(
                token: token,
              ));

  @override
  AddProductScreenState createState() => AddProductScreenState();
}

class AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductBloc, AddProductState>(
      listener: (BuildContext context, AddProductState state) {},
      builder: (BuildContext context, AddProductState state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: CustomAppbar(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.lightText,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Text('What are you selling?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: AppColors.lightText),),
                      ),
                      CustomTextfield(
                        controller: titleController,
                        hint: 'Title',
                        icon: const Icon(
                          Icons.title,
                          color: AppColors.lightText,
                        ),
                      ),
                      CustomTextfield(
                        controller: descriptionController,
                        hint: 'Description',
                        icon: const Icon(
                          Icons.description,
                          color: AppColors.lightText,
                        ),
                      ),
                      CustomTextfield(
                        controller: brandController,
                        hint: 'Brand',
                        icon: const Icon(
                          Icons.branding_watermark,
                          color: AppColors.lightText,
                        ),
                      ),
                      CustomTextfield(
                        controller: priceController,
                        hint: 'Price',
                        textInputType: TextInputType.number,
                        icon: const Icon(
                          Icons.monetization_on_outlined,
                          color: AppColors.lightText,
                        ),
                      ),
                      CustomTextfield(
                        controller: ratingController,
                        hint: 'Rating',
                        textInputType: TextInputType.number,
                        icon: const Icon(
                          Icons.rate_review,
                          color: AppColors.lightText,
                        ),
                      ),
                      CustomTextfield(
                        controller: stockController,
                        hint: 'Stock',
                        textInputType: TextInputType.number,
                        icon: const Icon(
                          Icons.add_shopping_cart_rounded,
                          color: AppColors.lightText,
                        ),
                      ),
                      CustomTextfield(
                        controller: imageController,
                        hint: 'Image Link',
                        icon: const Icon(
                          Icons.image,
                          color: AppColors.lightText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * .6,
                          child: CustomButton(
                            isLoading: state.isLoading,
                            buttonText: 'Add Product',
                            onPressed: () =>
                                context.read<AddProductBloc>().addProducts(
                                      token: widget.token,
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  brand: brandController.text,
                                  price: priceController.text,
                                  rating: ratingController.text,
                                  stock: stockController.text,
                                  imageLink: imageController.text,
                                    ).then((value) => Navigator.of(context).pop()),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
