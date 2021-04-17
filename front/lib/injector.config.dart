// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'driver/local_storage.dart' as _i7;
import 'port/activity_port.dart' as _i3;
import 'port/category_port.dart' as _i4;
import 'port/study_log_port.dart' as _i5;
import 'port/user_credential_port.dart' as _i6;
import 'presenter/activity_presenter.dart' as _i8;
import 'presenter/home_presenter.dart' as _i11;
import 'presenter/login_presenter.dart' as _i13;
import 'presenter/register_presenter.dart' as _i16;
import 'state/activity_view_state.dart' as _i9;
import 'state/home_view_state.dart' as _i12;
import 'state/login_view_state.dart' as _i14;
import 'state/register_view_state.dart' as _i17;
import 'usecase/activity/get_activities_usecase.dart' as _i10;
import 'usecase/category_registration_usecase.dart' as _i20;
import 'usecase/change_memo_usecase.dart' as _i21;
import 'usecase/change_page_usecase.dart' as _i22;
import 'usecase/change_slider_usecase.dart' as _i23;
import 'usecase/get_category_usecase.dart' as _i24;
import 'usecase/login/login_usecase.dart' as _i15;
import 'usecase/select_category_usecase.dart' as _i18;
import 'usecase/study_register_usecase.dart'
    as _i19; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ActivityPort>(() => _i3.ActivityGateway());
  gh.factory<_i4.CategoryPort>(() => _i4.CategoryGateway());
  gh.factory<_i5.StudyLogPort>(() => _i5.StudyLogGateway());
  gh.factory<_i6.UserCredentialPort>(
      () => _i6.UserCredentialGateway(get<_i7.LocalStorage>()));
  gh.factory<_i8.ActivityPresenter>(
      () => _i8.ActivityPresenter(get<_i9.ActivityViewState>()));
  gh.factory<_i10.GetActivitiesUsecase>(() => _i10.GetActivitiesUsecase(
      get<_i3.ActivityPort>(), get<_i8.ActivityPresenter>()));
  gh.factory<_i11.HomePresenter>(
      () => _i11.HomePresenter(get<_i12.HomeViewState>()));
  gh.factory<_i13.LoginPresenter>(
      () => _i13.LoginPresenter(get<_i14.LoginViewState>()));
  gh.factory<_i15.LoginUsecase>(() => _i15.LoginUsecase(
      get<_i6.UserCredentialPort>(), get<_i13.LoginPresenter>()));
  gh.factory<_i16.RegisterPresenter>(
      () => _i16.RegisterPresenter(get<_i17.RegisterViewState>()));
  gh.factory<_i18.SelectCategoryUsecase>(
      () => _i18.SelectCategoryUsecase(get<_i16.RegisterPresenter>()));
  gh.factory<_i19.StudyRegisterUsecase>(() => _i19.StudyRegisterUsecase(
      get<_i5.StudyLogPort>(), get<_i6.UserCredentialPort>()));
  gh.factory<_i20.CategoryRegistrationUsecase>(() =>
      _i20.CategoryRegistrationUsecase(get<_i4.CategoryPort>(),
          get<_i16.RegisterPresenter>(), get<_i6.UserCredentialPort>()));
  gh.factory<_i21.ChangeMemoUsecase>(
      () => _i21.ChangeMemoUsecase(get<_i16.RegisterPresenter>()));
  gh.factory<_i22.ChangePageUsecase>(
      () => _i22.ChangePageUsecase(get<_i11.HomePresenter>()));
  gh.factory<_i23.ChangeSliderUsecase>(
      () => _i23.ChangeSliderUsecase(get<_i16.RegisterPresenter>()));
  gh.factory<_i24.GetCategoryUsecase>(() => _i24.GetCategoryUsecase(
      get<_i4.CategoryPort>(),
      get<_i16.RegisterPresenter>(),
      get<_i6.UserCredentialPort>()));
  gh.singleton<_i9.ActivityViewState>(_i9.ActivityViewState());
  gh.singleton<_i12.HomeViewState>(_i12.HomeViewState());
  gh.singleton<_i7.LocalStorage>(_i7.LocalStorage());
  gh.singleton<_i14.LoginViewState>(_i14.LoginViewState());
  gh.singleton<_i17.RegisterViewState>(_i17.RegisterViewState());
  return get;
}
