import 'package:clutch/presentation/event/main_event.dart';
import 'package:clutch/presentation/state/main_state.dart';
import 'package:clutch/repository/company_repository.dart';
import 'package:clutch/repository/impl/company_repository_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  CompanyRepository companyRepository = CompanyRepositoryImpl();

  MainBloc() {
    assert(companyRepository != null);
  }

  @override
  MainState get initialState => MainLoading();

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is LoadMain) {
      yield* _mapLoadMainToState(event);
    }
  }

  Stream<MainState> _mapLoadMainToState(LoadMain event) async* {
    yield MainLoading();
    try {
      final companyList = companyRepository.fetchAllCompany();
    } catch (error) {}
  }
}
