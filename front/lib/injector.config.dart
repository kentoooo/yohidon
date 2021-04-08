// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'driver/local_storage.dart' as _i6;
import 'port/category_port.dart' as _i3;
import 'port/study_log_port.dart' as _i4;
import 'port/user_credential_port.dart' as _i5;
import 'presenter/login_presenter.dart' as _i7;
import 'presenter/register_presenter.dart' as _i10;
import 'state/login_view_state.dart' as _i8;
import 'state/register_view_state.dart' as _i11;
import 'usecase/change_slider_usecase.dart' as _i14;
import 'usecase/get_category_usecase.dart' as _i15;
import 'usecase/login/login_usecase.dart' as _i9;
import 'usecase/select_category_usecase.dart' as _i12;
import 'usecase/study_register_usecase.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.CategoryPort>(() => _i3.CategoryGateway());
  gh.factory<_i4.StudyLogPort>(() => _i4.StudyLogGateway());
  gh.factory<_i5.UserCredentialPort>(
      () => _i5.UserCredentialGateway(get<_i6.LocalStorage>()));
  gh.factory<_i7.LoginPresenter>(
      () => _i7.LoginPresenter(get<_i8.LoginViewState>()));
  gh.factory<_i9.LoginUsecase>(() => _i9.LoginUsecase(
      get<_i5.UserCredentialPort>(), get<_i7.LoginPresenter>()));
  gh.factory<_i10.RegisterPresenter>(
      () => _i10.RegisterPresenter(get<_i11.RegisterViewState>()));
  gh.factory<_i12.SelectCategoryUsecase>(
      () => _i12.SelectCategoryUsecase(get<_i10.RegisterPresenter>()));
  gh.factory<_i13.StudyRegisterUsecase>(() => _i13.StudyRegisterUsecase(
      get<_i4.StudyLogPort>(), get<_i5.UserCredentialPort>()));
  gh.factory<_i14.ChangeSliderUsecase>(
      () => _i14.ChangeSliderUsecase(get<_i10.RegisterPresenter>()));
  gh.factory<_i15.GetCategoryUsecase>(() => _i15.GetCategoryUsecase(
      get<_i3.CategoryPort>(),
      get<_i10.RegisterPresenter>(),
      get<_i5.UserCredentialPort>()));
  gh.singleton<_i6.LocalStorage>(_i6.LocalStorage());
  gh.singleton<_i8.LoginViewState>(_i8.LoginViewState());
  gh.singleton<_i11.RegisterViewState>(_i11.RegisterViewState());
  return get;
}
