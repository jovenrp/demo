import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrd/features/add_product/bloc/add_product_bloc.dart';
import 'package:nrd/features/add_product/domain/repositories/add_product_repository_impl.dart';
import 'package:nrd/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:nrd/features/dashboard/domain/repositories/dashboard_repository_impl.dart';
import 'package:nrd/features/login/bloc/login_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/login/domain/repositories/login_repository_impl.dart';
import '../../features/splash/bloc/splash_bloc.dart';
import '../services/persistence_service.dart';

class BlocsProvider {
  static List<SingleChildWidget> provide({
    required PersistenceService persistenceService,
  }) =>
      <SingleChildWidget>[
        BlocProvider<SplashBloc>(
          create: (_) => SplashBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(
            loginRepository: LoginRepositoryImpl(),
          ),
        ),
        BlocProvider<DashboardBloc>(
          create: (_) => DashboardBloc(
            dashboardRepository: DashboardRepositoryImpl(),
          ),
        ),
        BlocProvider<AddProductBloc>(
          create: (_) => AddProductBloc(
            addProductRepository: AddProductRepositoryImpl(),
          ),
        ),
      ];
}
