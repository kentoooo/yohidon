// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'port/category_port.dart' as _i3;
import 'port/study_log_port.dart' as _i4;
import 'presenter/register_presenter.dart' as _i6;
import 'state/RegisterViewState.dart' as _i7;
import 'usecase/change_slider_usecase.dart' as _i9;
import 'usecase/get_category_usecase.dart' as _i10;
import 'usecase/select_category_usecase.dart' as _i8;
import 'usecase/study_register_usecase.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.CategoryPort>(() => _i3.CategoryGateway());
  gh.factory<_i4.StudyLogPort>(() => _i4.StudyLogGateway());
  gh.factory<_i5.StudyRegisterUsecase>(
      () => _i5.StudyRegisterUsecase(get<_i4.StudyLogPort>()));
  gh.factory<_i6.RegisterPresenter>(
      () => _i6.RegisterPresenter(get<_i7.RegisterViewState>()));
  gh.factory<_i8.SelectCategoryUsecase>(
      () => _i8.SelectCategoryUsecase(get<_i6.RegisterPresenter>()));
  gh.factory<_i9.ChangeSliderUsecase>(
      () => _i9.ChangeSliderUsecase(get<_i6.RegisterPresenter>()));
  gh.factory<_i10.GetCategoryUsecase>(() => _i10.GetCategoryUsecase(
      get<_i3.CategoryPort>(), get<_i6.RegisterPresenter>()));
  gh.singleton<_i7.RegisterViewState>(_i7.RegisterViewState());
  return get;
}
