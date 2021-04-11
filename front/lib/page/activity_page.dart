import 'package:flutter/material.dart';
import 'package:yohidon/state/activity_view_state.dart';
import 'package:provider/provider.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<ActivityViewState>();
    return Container(
        padding: EdgeInsets.only(top: 20),
        child: Center(
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: state.items.length,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      margin: EdgeInsets.only(bottom: 13),
                      padding: EdgeInsets.only(
                          left: 24, top: 12, bottom: 12, right: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white70,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white10,
                              blurRadius: 10,
                              spreadRadius: 5,
                              offset: Offset(8.0, 8.0),
                            ),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 67,
                                width: 57,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              Container(
                                width: 230,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      state.items[index].userName,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(state.items[index].activityName),
                                    Text(state.items[index].activityDate),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                state.items[index].timeSpent,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "h",
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
    );
  }
}
