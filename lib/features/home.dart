import 'package:currency_app/config_api/config_model.dart';
import 'package:currency_app/config_api/config_repo.dart';
import 'package:currency_app/convert_api/convert_repo.dart';
import 'package:currency_app/utils/api_state_folder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List<DropdownMenuEntry<String>> currencyList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var repo = ref.watch(configRepoProvider);
      repo.params.headers = {
        "apikey": "ANaMY3OL22p2OXqHopXBFrhf3iZhh9bP",
      };
      await repo.execute();
      repo = ref.watch(configRepoProvider);
      print(repo.currentResult);
    });
  }

  // void _fetchCurrencies() async {
  //   final response = ref.read(configRepoProvider);
  //   print("$response");
  //   final currList = response.factory;
  //     print("$currList");
  //     currencyList = currList.map((Currency curr) {
  //       return DropdownMenuEntry<String>(
  //         value: curr.currencySymbol,
  //         label: curr.currencyName,
  //       );
  //     }).toList();
  //     print("$currencyList");
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController textEditingController1 = TextEditingController();
    TextEditingController textEditingController2 = TextEditingController();
    TextEditingController fromController = TextEditingController();
    TextEditingController toController = TextEditingController();
    var configRepo = ref.watch(configRepoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency Converter App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: size.width / 2,
                    child: Text("From :", style: TextStyle(fontSize: 25))),
                Expanded(
                  child: Container(
                    height: size.height / 10,
                    child: ApiStateFolder(
                      repos: [configRepo],
                      buildLoaded: () {
                        currencyList = (configRepo.currentResult!.symbols)!
                            .entries
                            .map((symbol) {
                          return DropdownMenuEntry<String>(
                            value: symbol.key,
                            label: symbol.value,
                          );
                        }).toList();
                        return DropdownMenu<String>(
                          label: Text("From"),
                          width: size.width / 2 - 20,
                          dropdownMenuEntries: currencyList,
                          controller: fromController,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: size.height / 10,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: textEditingController1,
                      onChanged: (value) async {
                        var convertRepo = ref.watch(convertRepoProvider);
                        convertRepo.params.headers =  {
                          "apikey": "ANaMY3OL22p2OXqHopXBFrhf3iZhh9bP",
                        };
                        convertRepo.params.fromSym = fromController.text;
                        convertRepo.params.toSym = toController.text;
                        convertRepo.params.amount = value;
                        await convertRepo.execute();
                        convertRepo = ref.watch(convertRepoProvider);
                        textEditingController2.text = convertRepo.currentResult!.result.toString();
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Amount to be converted',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey[600] ?? Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: size.width / 2,
                    child: Text(
                      "To :",
                      style: TextStyle(fontSize: 25),
                    )),
                Expanded(
                    child: Container(
                        height: size.height / 10,
                        child: ApiStateFolder(
                          repos: [configRepo],
                          buildLoaded: () {
                            currencyList = (configRepo.currentResult!.symbols)!
                                .entries
                                .map((symbol) {
                              return DropdownMenuEntry<String>(
                                value: symbol.key,
                                label: symbol.value,
                              );
                            }).toList();
                            return DropdownMenu<String>(
                              label: Text("To"),
                              width: size.width / 2 - 20,
                              dropdownMenuEntries: currencyList,
                              controller: toController,
                            );
                          },
                        ),
                    ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: size.height / 10,
                    child: TextField(
                      controller: textEditingController2,
                      enabled: false,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Converted amount',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey[600] ?? Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
