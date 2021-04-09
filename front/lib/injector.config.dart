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
import 'presenter/home_presenter.dart' as _i7;
import 'presenter/login_presenter.dart' as _i9;
import 'presenter/register_presenter.dart' as _i12;
import 'state/home_view_state.dart' as _i8;
import 'state/login_view_state.dart' as _i10;
import 'state/register_view_state.dart' as _i13;
import 'usecase/change_page_usecase.dart' as _i16;
import 'usecase/change_slider_usecase.dart' as _i17;
import 'usecase/get_category_usecase.dart' as _i18;
import 'usecase/login/login_usecase.dart' as _i11;
import 'usecase/select_category_usecase.dart' as _i14;
import 'usecase/study_register_usecase.dart'
    as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.CategoryPort>(() => _i3.CategoryGateway());
  gh.factory<_i4.StudyLogPort>(() => _i4.StudyLogGateway());
  gh.factory<_i5.UserCredentialPort>(
      () => _i5.UserCredentialGateway(get<_i6.LocalStorage>()));
  gh.factory<_i7.HomePresenter>(
      () => _i7.HomePresenter(get<_i8.HomeViewState>()));
  gh.factory<_i9.LoginPresenter>(
      () => _i9.LoginPresenter(get<_i10.LoginViewState>()));
  gh.factory<_i11.LoginUsecase>(() => _i11.LoginUsecase(
      get<_i5.UserCredentialPort>(), get<_i9.LoginPresenter>()));
  gh.factory<_i12.RegisterPresenter>(
      () => _i12.RegisterPresenter(get<_i13.RegisterViewState>()));
  gh.factory<_i14.SelectCategoryUsecase>(
      () => _i14.SelectCategoryUsecase(get<_i12.RegisterPresenter>()));
  gh.factory<_i15.StudyRegisterUsecase>(() => _i15.StudyRegisterUsecase(
      get<_i4.StudyLogPort>(), get<_i5.UserCredentialPort>()));
  gh.factory<_i16.ChangePageUsecase>(
      () => _i16.ChangePageUsecase(get<_i7.HomePresenter>()));
  gh.factory<_i17.ChangeSliderUsecase>(
      () => _i17.ChangeSliderUsecase(get<_i12.RegisterPresenter>()));
  gh.factory<_i18.GetCategoryUsecase>(() => _i18.GetCategoryUsecase(
      get<_i3.CategoryPort>(),
      get<_i12.RegisterPresenter>(),
      get<_i5.UserCredentialPort>()));
  gh.singleton<_i8.HomeViewState>(_i8.HomeViewState());
  gh.singleton<_i6.LocalStorage>(_i6.LocalStorage());
  gh.singleton<_i10.LoginViewState>(_i10.LoginViewState());
  gh.singleton<_i13.RegisterViewState>(_i13.RegisterViewState());
  return get;
}
