import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/backend/models/organization.dart';
import 'package:frontend/backend/repositories/OrganizationRepository.dart';
import 'package:frontend/frontend/components/TagWidget.dart';
import 'package:frontend/services/not_implemented.dart';
import 'package:oktoast/oktoast.dart';

class CompassPage extends StatelessWidget {
  const CompassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Organization> organizations =
        RepositoryProvider.of<OrganizationRepository>(context)
            .getAllOrganisations();

    return Column(children: [
      AppBar(
        title: Text("Your compass"),
      ),
      Expanded(
          child: ListView.builder(
        itemCount: 1 + organizations.length,
        itemBuilder: (context, index) {
          if (index == 0)
            return Wrap(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your preferences",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: [
                        TagWidget(text: "coding", color: Colors.red),
                        TagWidget(text: "git", color: Colors.red),
                        TagWidget(text: "startup", color: Colors.red),
                        TagWidget(text: "impact", color: Colors.red),
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.1),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: InkWell(
                              onTap: notImplemented,
                              child: Text(
                                "+",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            );
          else {
            Organization o = organizations[index - 1];
            return Padding(
                padding: EdgeInsets.only(top: 20),
                child: Card(
                  child: InkWell(
                    onTap: null,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      width: double.infinity,
                      child: Wrap(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                o.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Values",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Wrap(
                                  runSpacing: 5,
                                  spacing: 5,
                                  children: o.values
                                      .map((t) => TagWidget(
                                          text: t, color: Colors.green))
                                      .toList(),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("What you can learn...",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Wrap(
                                  runSpacing: 5,
                                  spacing: 5,
                                  children: o.learningResource
                                      .map((t) => TagWidget(
                                          text: t, color: Colors.blue))
                                      .toList(),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    child: Text("Apply"),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ));
          }
        },
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      ))
    ]);
  }
}
