import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/backend/auth/auth_cubit.dart';
import 'package:frontend/backend/models/certificate.dart';
import 'package:frontend/backend/models/user.dart';
import 'package:frontend/backend/repositories/CertificateRepoitory.dart';
import 'package:frontend/frontend/components/TagWidget.dart';
import 'package:frontend/services/deep_analyse.dart';
import 'package:frontend/services/not_implemented.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:oktoast/oktoast.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Widget _subtitle(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 10),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
              Divider()
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    User user =
        (BlocProvider.of<AuthCubit>(context).state as AuthenticatedState).user;

    List<DeepAnalyze> analyzes = analyzeCertificates(
        RepositoryProvider.of<CertificateRepository>(context)
            .getAllCertificates());
    return Column(
      children: [
        AppBar(
          title: ListTile(
            title: Text(user.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                MdiIcons.door,
                color: Colors.transparent,
              ),
            ),
            trailing: IconButton(
              onPressed: () => BlocProvider.of<AuthCubit>(context).logOut(),
              icon: Icon(
                MdiIcons.door,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
            child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            SizedBox(
              height: 0,
            ),
            _subtitle("Education"),
            Wrap(children: [
              Column(
                children: RepositoryProvider.of<CertificateRepository>(context)
                    .getAllEducation()
                    .map((e) => Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Wrap(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.title!,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    e.organizationName! +
                                        ", " +
                                        _formatDates(e),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Wrap(
                                      spacing: 5,
                                      runSpacing: 5,
                                      children: e.topicList!
                                          .map((e) => TagWidget(
                                              text: e, color: Colors.blue))
                                          .toList(),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ]),
            _subtitle("Work experience"),
            Wrap(children: [
              Column(
                children: RepositoryProvider.of<CertificateRepository>(context)
                    .getAllWorkExperience()
                    .map((e) => Padding(
                          padding: EdgeInsets.only(bottom: 40),
                          child: Wrap(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.title!,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    e.organizationName! +
                                        ", " +
                                        _formatDates(e),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Wrap(
                                      spacing: 5,
                                      runSpacing: 5,
                                      children: e.topicList!
                                          .map((e) => TagWidget(
                                              text: e, color: Colors.blue))
                                          .toList(),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ]),
            _subtitle("Skills"),
            Wrap(
              spacing: 5,
              runSpacing: 5,
              children: RepositoryProvider.of<CertificateRepository>(context)
                  .getAllSkills()
                  .map(
                    (e) => TagWidget(text: e, color: Colors.red),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
                child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
              child: Wrap(
                children: [
                  Column(
                    children: [
                      _subtitle("Deep analyze"),
                      Wrap(
                        children: [
                          Column(
                            children: analyzes
                                .map((e) => Wrap(
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
                                            Text(e.title()),
                                            IconButton(
                                              onPressed: () =>
                                                  showToast(e.explanation()),
                                              icon: Icon(
                                                MdiIcons.information,
                                                size: 18,
                                              ),
                                              splashRadius: 15,
                                            )
                                          ],
                                        )
                                      ],
                                    ))
                                .toList(),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )),
          ],
        ))
      ],
    );
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
