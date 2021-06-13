import 'package:carrotslabapp/generated/l10n.dart';
import 'package:carrotslabapp/src/models/climate_model.dart';
import 'package:carrotslabapp/src/providers/coordinates_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.0,
      left: 10.0,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: context.watch<CoordinatesProvider>().point != null ? 1 : 0,
        child: Container(
          width: 130,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            color: Colors.black.withOpacity(0.5),
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder(
                  stream:
                      context.read<CoordinatesProvider>().weatherBloc.weather,
                  builder: (_, snapshot) {
                    final weatherData = snapshot.data as ClimateModel?;

                    if (snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            AppLocalization.of(context).weather.toUpperCase(),
                            style: TextStyle(
                                color: Colors.grey[100],
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          Column(
                            children: [
                              weatherDataText(
                                  weatherData!.weather[0].description),
                              weatherDataText(
                                  weatherData.main.temp.toString() + 'ºC'),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return SizedBox();
                    }
                  })),
        ),
      ),
    );
  }

  Widget weatherDataText(String data) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.grey[100], fontWeight: FontWeight.w500, fontSize: 12),
    );
  }
}
