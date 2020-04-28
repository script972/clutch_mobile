import 'package:flutter/material.dart';
import 'package:clutch/domain/network/model/response/company_response.dart';
import 'package:clutch/repository/company_repository.dart';
import 'package:clutch/repository/impl/company_repository_impl.dart';
import 'package:clutch/ui/widget/item/company_item.dart';

class CompaniesTab extends StatefulWidget {
  @override
  _CompaniesTabState createState() => _CompaniesTabState();
}

class _CompaniesTabState extends State<CompaniesTab> {
  CompanyRepository companyRepository = CompanyRepositoryImpl();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder(
      stream: companyRepository.fetchAllCompany(),
      builder: (context, AsyncSnapshot<List<CompanyResponse>> snap) =>
          Container(
            padding: EdgeInsets.only(top: 0, left: 8.0, right: 8.0),
            child:
                /* TODO: Добавить лоудер в при интеграции паттерна представления
                ? Image.asset("assets/images/nothing_to_show.png")
                : */
                GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              children: snap.data
                  .map((CompanyResponse item) => CompanyItem(item))
                  .toList(),
            ),
          ));
}
