// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'port/category_port.dart' as _i3;
import 'presenter/register_presenter.dart' as _i4;
import 'state/RegisterViewState.dart' as _i5;
import 'usecase/get_category_usecase.dart' as _i7;
import 'usecase/select_category_usecase.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.CategoryPort>(() => _i3.CategoryGateway());
  gh.factory<_i4.RegisterPresenter>(
      () => _i4.RegisterPresenter(get<_i5.RegisterViewState>()));
  gh.factory<_i6.SelectCategoryUsecase>(
      () => _i6.SelectCategoryUsecase(get<_i4.RegisterPresenter>()));
  gh.factory<_i7.GetCategoryUsecase>(() => _i7.GetCategoryUsecase(
      get<_i3.CategoryPort>(), get<_i4.RegisterPresenter>()));
  gh.singleton<_i5.RegisterViewState>(_i5.RegisterViewState());
  return get;
}
