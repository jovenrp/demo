// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddProductState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool get isAddingProducts => throw _privateConstructorUsedError;
  UserModel? get userModel => throw _privateConstructorUsedError;
  ProductsModel? get product => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddProductStateCopyWith<AddProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddProductStateCopyWith<$Res> {
  factory $AddProductStateCopyWith(
          AddProductState value, $Res Function(AddProductState) then) =
      _$AddProductStateCopyWithImpl<$Res, AddProductState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      bool isAddingProducts,
      UserModel? userModel,
      ProductsModel? product,
      String? errorMessage});
}

/// @nodoc
class _$AddProductStateCopyWithImpl<$Res, $Val extends AddProductState>
    implements $AddProductStateCopyWith<$Res> {
  _$AddProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? isAddingProducts = null,
    Object? userModel = freezed,
    Object? product = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddingProducts: null == isAddingProducts
          ? _value.isAddingProducts
          : isAddingProducts // ignore: cast_nullable_to_non_nullable
              as bool,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductsModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddProductStateImplCopyWith<$Res>
    implements $AddProductStateCopyWith<$Res> {
  factory _$$AddProductStateImplCopyWith(_$AddProductStateImpl value,
          $Res Function(_$AddProductStateImpl) then) =
      __$$AddProductStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      bool isAddingProducts,
      UserModel? userModel,
      ProductsModel? product,
      String? errorMessage});
}

/// @nodoc
class __$$AddProductStateImplCopyWithImpl<$Res>
    extends _$AddProductStateCopyWithImpl<$Res, _$AddProductStateImpl>
    implements _$$AddProductStateImplCopyWith<$Res> {
  __$$AddProductStateImplCopyWithImpl(
      _$AddProductStateImpl _value, $Res Function(_$AddProductStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? isAddingProducts = null,
    Object? userModel = freezed,
    Object? product = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$AddProductStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddingProducts: null == isAddingProducts
          ? _value.isAddingProducts
          : isAddingProducts // ignore: cast_nullable_to_non_nullable
              as bool,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductsModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddProductStateImpl implements _AddProductState {
  _$AddProductStateImpl(
      {this.isLoading = false,
      this.hasError = false,
      this.isAddingProducts = false,
      this.userModel,
      this.product,
      this.errorMessage});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final bool isAddingProducts;
  @override
  final UserModel? userModel;
  @override
  final ProductsModel? product;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AddProductState(isLoading: $isLoading, hasError: $hasError, isAddingProducts: $isAddingProducts, userModel: $userModel, product: $product, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProductStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.isAddingProducts, isAddingProducts) ||
                other.isAddingProducts == isAddingProducts) &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, hasError,
      isAddingProducts, userModel, product, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProductStateImplCopyWith<_$AddProductStateImpl> get copyWith =>
      __$$AddProductStateImplCopyWithImpl<_$AddProductStateImpl>(
          this, _$identity);
}

abstract class _AddProductState implements AddProductState {
  factory _AddProductState(
      {final bool isLoading,
      final bool hasError,
      final bool isAddingProducts,
      final UserModel? userModel,
      final ProductsModel? product,
      final String? errorMessage}) = _$AddProductStateImpl;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  bool get isAddingProducts;
  @override
  UserModel? get userModel;
  @override
  ProductsModel? get product;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$AddProductStateImplCopyWith<_$AddProductStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
