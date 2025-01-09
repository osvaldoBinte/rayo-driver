import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:rayo_taxi/common/theme/app_color.dart';
import 'package:rayo_taxi/features/travel/data/models/travel_alert/travel_alert_model.dart';
import 'package:rayo_taxi/features/travel/presentation/getxtravel/TravelById/travel_by_id_alert_getx.dart';
import 'package:speech_bubble/speech_bubble.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:speech_bubble/speech_bubble.dart';

class InfoButtonWidget extends StatelessWidget {
  final TravelByIdAlertGetx? travelByIdController;
  final List<TravelAlertModel>? travelList;
  final TravelAlertModel? travel;
  final String imagePath;

  const InfoButtonWidget({
    Key? key,
    this.travelByIdController,
    this.travelList,
    this.travel,
    this.imagePath = 'assets/images/taxi.png',
  }) : super(key: key);

  void _showInfoDialog(BuildContext context) {
    String text;
    
    if (travel != null) {
      text = 'Cliente: ${travel!.client}\n'
             'Fecha: ${travel!.date}\n'
             'Importe: \$ ${travel!.tarifa} MXN';
    } else if (travelByIdController != null && 
        travelByIdController!.state.value is TravelByIdAlertLoaded) {
      var travelData = (travelByIdController!.state.value as TravelByIdAlertLoaded).travels[0];
      var driverName = travelData.client;
      var importe = (travelData.id_status == 1 || travelData.id_status == 2) ? travelData.cost : travelData.tarifa;
      
      text = 'Conductor: $driverName\nFecha: ${travelData.date}\nImporte: \$${importe} MXN';
    } else if (travelList != null && travelList!.isNotEmpty) {
      text = 'Chofer: ${travelList![0].client}\nFecha: ${travelList![0].date}\nImporte: \$ ${travelList![0].tarifa} MXN';
    } else {
      text = 'Sin información disponible';
    }

    QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      title: 'Información del Viaje',
      text: text,
      confirmBtnText: 'Cerrar',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SpeechBubble(
            nipLocation: NipLocation.BOTTOM,
            color: Theme.of(context).colorScheme.buttonColormap,
            borderRadius: 20,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Información',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          IconButton(
            icon: Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
            onPressed: () => _showInfoDialog(context),
          ),
        ],
      ),
    );
  }
}