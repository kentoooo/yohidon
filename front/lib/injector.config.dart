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
import 'presenter/category_list_presenter.dart' as _i10;
import 'presenter/child_category_list_presenter.dart' as _i12;
import 'presenter/home_presenter.dart' as _i15;
import 'presenter/login_presenter.dart' as _i17;
import 'presenter/register_presenter.dart' as _i20;
import 'state/activity_view_state.dart' as _i9;
import 'state/category_list_view_state.dart' as _i11;
import 'state/child_category_list_view_state.dart' as _i13;
import 'state/home_view_state.dart' as _i16;
import 'state/login_view_state.dart' as _i18;
import 'state/register_view_state.dart' as _i21;
import 'usecase/activity/get_activities_usecase.dart' as _i14;
import 'usecase/category_registration_usecase.dart' as _i24;
import 'usecase/change_memo_usecase.dart' as _i25;
import 'usecase/change_page_usecase.dart' as _i26;
import 'usecase/change_slider_usecase.dart' as _i27;
import 'usecase/get_category_usecase.dart' as _i28;
import 'usecase/login/login_usecase.dart' as _i19;
import 'usecase/select_category_usecase.dart' as _i22;
import 'usecase/study_register_usecase.dart'
    as _i23; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i10.CategoryListPresenter>(
      () => _i10.CategoryListPresenter(get<_i11.CategoryListViewState>()));
  gh.factory<_i12.ChildCategoryListPresenter>(() =>
      _i12.ChildCategoryListPresenter(get<_i13.ChildCategoryListViewState>()));
  gh.factory<_i14.GetActivitiesUsecase>(() => _i14.GetActivitiesUsecase(
      get<_i3.ActivityPort>(), get<_i8.ActivityPresenter>()));
  gh.factory<_i15.HomePresenter>(
      () => _i15.HomePresenter(get<_i16.HomeViewState>()));
  gh.factory<_i17.LoginPresenter>(
      () => _i17.LoginPresenter(get<_i18.LoginViewState>()));
  gh.factory<_i19.LoginUsecase>(() => _i19.LoginUsecase(
      get<_i6.UserCredentialPort>(), get<_i17.LoginPresenter>()));
  gh.factory<_i20.RegisterPresenter>(
      () => _i20.RegisterPresenter(get<_i21.RegisterViewState>()));
  gh.factory<_i22.SelectCategoryUsecase>(() => _i22.SelectCategoryUsecase(
      get<_i20.RegisterPresenter>(), get<_i4.CategoryPort>()));
  gh.factory<_i23.StudyRegisterUsecase>(() => _i23.StudyRegisterUsecase(
      get<_i5.StudyLogPort>(), get<_i6.UserCredentialPort>()));
  gh.factory<_i24.CategoryRegistrationUsecase>(() =>
      _i24.CategoryRegistrationUsecase(
          get<_i4.CategoryPort>(),
          get<_i10.CategoryListPresenter>(),
          get<_i12.ChildCategoryListPresenter>(),
          get<_i6.UserCredentialPort>()));
  gh.factory<_i25.ChangeMemoUsecase>(
      () => _i25.ChangeMemoUsecase(get<_i20.RegisterPresenter>()));
  gh.factory<_i26.ChangePageUsecase>(
      () => _i26.ChangePageUsecase(get<_i15.HomePresenter>()));
  gh.factory<_i27.ChangeSliderUsecase>(
      () => _i27.ChangeSliderUsecase(get<_i20.RegisterPresenter>()));
  gh.factory<_i28.GetCategoryUsecase>(() => _i28.GetCategoryUsecase(
      get<_i4.CategoryPort>(),
      get<_i20.RegisterPresenter>(),
      get<_i6.UserCredentialPort>(),
      get<_i10.CategoryListPresenter>(),
      get<_i12.ChildCategoryListPresenter>()));
  gh.singleton<_i9.ActivityViewState>(_i9.ActivityViewState());
  gh.singleton<_i11.CategoryListViewState>(_i11.CategoryListViewState());
  gh.singleton<_i13.ChildCategoryListViewState>(
      _i13.ChildCategoryListViewState());
  gh.singleton<_i16.HomeViewState>(_i16.HomeViewState());
  gh.singleton<_i7.LocalStorage>(_i7.LocalStorage());
  gh.singleton<_i18.LoginViewState>(_i18.LoginViewState());
  gh.singleton<_i21.RegisterViewState>(_i21.RegisterViewState());
  return get;
}
