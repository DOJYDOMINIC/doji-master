import 'package:flutter/material.dart';
import 'package:project100/models/requirements_model.dart';
import 'package:project100/shop_model.dart';

import 'constant.dart';

class AddRequirementsScreen extends StatefulWidget {
  const AddRequirementsScreen({Key? key, required this.shopIndex})
      : super(key: key);
  final int shopIndex;

  @override
  State<AddRequirementsScreen> createState() => _AddRequirementsScreenState();
}

class _AddRequirementsScreenState extends State<AddRequirementsScreen> {
  final TextEditingController itemName = TextEditingController();
  final TextEditingController itemQty = TextEditingController();
  final TextEditingController itemRate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Requirements'),
        backgroundColor: main_color,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                child: Column(
                  children: [
                    TextField(
                      controller: itemName,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: itemQty,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: itemRate,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        shopsList[widget.shopIndex]['Requirements'].add(
                          RequirementsModel(
                            itemName: itemName.text,
                            qty: double.parse(itemQty.text),
                            rate: double.parse(itemRate.text),
                          ),
                        );

                        print("item added");
                        print(shopsList[widget.shopIndex]['Requirements'].length);
                        setState(() {});
                        Navigator.pop(context);
                      },
                      child: Text('Add'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ListView.builder(
              // shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: shopsList[widget.shopIndex]['Requirements'].length,
              itemBuilder: (context, index) {
                num totalItemRate = shopsList[widget.shopIndex]['Requirements'][index].qty *
                    shopsList[widget.shopIndex]['Requirements'][index].rate;
                return SizedBox(
                  height: 80,
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black.withOpacity(.1)), color: Colors.white,),


                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          shopsList[widget.shopIndex]['Requirements'][index].itemName.toString(),
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(
                        shopsList[widget.shopIndex]['Requirements'][index].qty.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: Text(
                        '$totalItemRate',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Flexible(
            flex: 2,
              child: Container(
            width: double.infinity,

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Amount ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Price item : ",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Shoptext),
                              ),
                              Text(
                                "$$totalItemRate",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Shoptext),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "GST: ",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Shoptext),
                              ),
                              Text(
                                '200',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Shoptext),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Discount : ",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Shoptext),
                              ),
                              Text(
                                "15",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Shoptext),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500, color: Shoptext),
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Shipping : ",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Shoptext),
                              ),
                              Text(
                                "100",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Shoptext),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
          ))
        ],
      )
    );
  }
}
