
import 'package:clutch/presentation/model/offer_details_model_ui.dart';

abstract class OfferRepository {
  Future<OfferDetailsModelUi> fetchCompanyById(int id);
  /*Future<MainInfo> fetchAllCompany(CompanyAndOffersSearch body);

  Future<CompanyDetailsResponse> fetchCompanyDetails(int id);*/
}