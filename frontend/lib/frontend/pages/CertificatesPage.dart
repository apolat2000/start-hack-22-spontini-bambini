import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/backend/models/certificate.dart';
import 'package:frontend/backend/repositories/CertificateRepoitory.dart';
import 'package:frontend/frontend/components/TagWidget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CertificatesPage extends StatelessWidget {
  const CertificatesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Certificate> certificates =
        RepositoryProvider.of<CertificateRepository>(context)
            .getAllCertificates();

    return Column(children: [
      AppBar(
        title: Text("Your compass"),
      ),
      Expanded(
          child: ListView.builder(
              itemCount: certificates.length,
              itemBuilder: (context, index) {
                Certificate c = certificates[index];
                return Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Card(
                      child: InkWell(
                        onTap: null,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          width: double.infinity,
                          child: Wrap(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    c.title!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    c.organizationName! +
                                        ", " +
                                        _formatDates(c),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Topics",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Wrap(
                                      runSpacing: 5,
                                      spacing: 5,
                                      children: c.topicList!
                                          .map((t) => TagWidget(
                                              text: t, color: Colors.green))
                                          .toList(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Skills",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Wrap(
                                      runSpacing: 5,
                                      spacing: 5,
                                      children: c.skillsList!
                                          .map((t) => TagWidget(
                                              text: t, color: Colors.blue))
                                          .toList(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Wrap(
                                    children: [
                                      Column(
                                        children: c.achievments!
                                            .map((e) => Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5),
                                                  child: Wrap(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            MdiIcons.arrowRight,
                                                            size: 14,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Expanded(
                                                            child: Text(e),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ))
                                            .toList(),
                                      )
                                    ],
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        child: Text("Download as PDF"),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ));
              }))
    ]);
  }

  String _formatOneDate(DateTime d) {
    return d.month.toString().padLeft(2, "0") + "." + d.year.toString();
  }

  String _formatDates(Certificate e) {
    if (e.endDate == null)
      return _formatOneDate(e.startDate!) + " - now";
    else
      return _formatOneDate(e.startDate!) + " - " + _formatOneDate(e.endDate!);
  }
}
