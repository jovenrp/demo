import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrd/application/widgets/custom_appbar.dart';
import 'package:nrd/application/widgets/spinner_loader.dart';
import 'package:nrd/features/add_product/presentation/add_product_screen.dart';
import 'package:nrd/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:nrd/features/dashboard/bloc/dashboard_state.dart';
import 'package:nrd/features/dashboard/data/models/product_model.dart';
import 'package:nrd/features/login/data/models/user_model.dart';

import '../../../application/utils/app_colors.dart';
import '../../../application/widgets/custom_item_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.user});

  static const String routeName = '/dashboard';
  static const String screenName = 'dashboardScreen';

  final UserModel user;

  static ModalRoute<DashboardScreen> route({required UserModel user}) =>
      MaterialPageRoute<DashboardScreen>(
          settings: const RouteSettings(name: routeName),
          builder: (_) => DashboardScreen(user: user));

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardBloc>().fetchProducts(widget.user).then((value) => context.read<DashboardBloc>().getLocalProducts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (BuildContext context, DashboardState state) {},
      builder: (BuildContext context, DashboardState state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: CustomAppbar(),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _DashboardHeader(
                    user: widget.user,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(18),
                    child: Text(
                      'For Sale',
                      style: TextStyle(
                          fontSize: 24,
                          color: AppColors.lightText,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  state.isFetchingProducts
                      ? const Center(
                          child: SpinnerLoader(),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: _ProductsList(
                            products: state.products ?? <ProductModel>[],
                          ),
                        ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                AddProductScreen.route(token: state.userModel?.token),
              ).then((value) => context.read<DashboardBloc>().getLocalProducts());
            },
            backgroundColor: AppColors.warningOrange,
            child: const Icon(Icons.monetization_on),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}

class _ProductsList extends StatelessWidget {
  const _ProductsList({required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return CustomItemCard(
            product: products[index],
          );
        },
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader({required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      color: AppColors.warningOrange,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage:
                  NetworkImage(user.image ?? 'https://via.placeholder.com/150'),
              backgroundColor: AppColors.lightText,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Welcome back, ${user.firstname}',
                style: const TextStyle(
                    color: AppColors.lightText,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              /*GestureDetector(
                onTap: () {},
                child: const Text(
                  'Account Info',
                  style: TextStyle(
                      color: AppColors.lightText,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.lightText),
                ),
              ),*/
            ],
          )
        ],
      ),
    );
  }
}
