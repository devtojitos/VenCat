import 'package:cached_network_image/cached_network_image.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vencat/DataModel/ProjectModel/project_model.dart';

class YourProjectCardWidget extends StatelessWidget {
   const YourProjectCardWidget({super.key,this.data});
 final ProjectModel? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width *0.85,
      height: 80,
      child: Card(
        color: Colors.white70,
        elevation: 4,
        shadowColor: Colors.blue,
        child: ExpansionTileItem(
          tilePadding: EdgeInsets.all(2),
          isHasTrailing: false,
          title: Container(
            child: Row(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: [
                        Wrap(
                          children: [
                            Text(
                                ("${data!.projectBusinessModel!.businessBasicInfoModel!.businessTitle}"),
                                style: Get
                                    .textTheme
                                    .bodyMedium),
                          ],
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              size: 20,
                            ),
                            Text(
                              "created on: 12-4-2024",
                              style: TextStyle(
                                  fontSize: 12),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .start,
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                              children: [
                                Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons
                                          .city,
                                      size: 18,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets
                                          .all(
                                          3.0),
                                      child: Text(
                                        "${data!.projectBusinessModel!.businessBasicInfoModel!.businessLocationCity}",
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.money,
                                      size: 18,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets
                                          .all(
                                          3.0),
                                      child: Text(
                                          "${data!.projectBusinessModel!.businessBasicInfoModel!.businessField}"),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons
                                          .people,
                                      size: 18,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets
                                          .all(
                                          3.0),
                                      child: Text(
                                        "8/${data!.projectBusinessModel!.businessBasicInfoModel!.partnersNumber}",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons
                                          .location_pin,
                                      size: 18,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets
                                          .all(
                                          3.0),
                                      child: Text(
                                          "${data!.projectBusinessModel!.businessBasicInfoModel!.businessLocationArea}",
                                          style: Get
                                              .textTheme
                                              .bodyLarge),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons
                                          .sitemap,
                                      size: 18,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets
                                          .all(
                                          3.0),
                                      child: Text(
                                          "${data!.projectBusinessModel!.businessBasicInfoModel!.businessType}",
                                          style: Get
                                              .textTheme
                                              .bodyLarge),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.money,
                                      size: 18,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets
                                          .all(
                                          3.0),
                                      child: Text(
                                        "${data!.projectBusinessModel!.businessBasicInfoModel!.businessCapital}",
                                        style: Get
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      width:
                      MediaQuery.of(context)
                          .size
                          .width *
                          0.24,
                      child: CachedNetworkImage(
                        imageUrl:
                        'https://st2.depositphotos.com/4035913/6124/i/450/depositphotos_61243831-stock-photo-letter-s-logo.jpg',
                      ),
                    ),
                    Card(
                      child: Row(
                        children: [
                          Icon(Icons.handshake),
                          Icon(Icons.attach_money)
                        ],
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty
                            .all<Color>(
                            Colors.blue),
                        padding:
                        MaterialStateProperty.all<
                            EdgeInsetsGeometry>(
                          EdgeInsets.all(
                              3.0), // Set padding
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "View Details",
                        style: Get
                            .textTheme.bodyLarge,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          children: [
          ],
        ),
      ),
    );
  }
}
