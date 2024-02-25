import 'package:flutter/material.dart';

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  List<String> questions = [
    "Les stations de service sont-elles obligées d'afficher leurs prix sur l'application StationMaster?",
    "Qui est chargé de mettre à jour les prix des carburants sur StationMaster",
    "La dernière date de mise à jour des prix des carburants d'une station de service sur l'application remonte à très loin "
  ];
  List<String> answers = [
    "Les Sociétés de distribution des carburants sont dans l'obligation d'afficher sur l'application les prix des carburants pratiqués dans les stations de service de leur réseau de distribution et ce conformément à l'arrêté ministériel conjoint signé par le Ministre de l'industrie, de l'Investissement, du Commerce et de l'Economie Numérique, du Ministre de l'Energie, des Mines et du Développement Durable et du Ministre Délégué auprès du chef du Gouvernement chargé des Affaires Générales et de la Gouvernance, relatifs aux modalités d'information du Consommateur",
    "La mise à jour des prix sur StationMaster est effectuée par les sociétés de distribution des carburants après chaque changement de prix au niveau de leurs réseaux de distribution respectifs sur une plateforme digitale gérée par le Ministère de l'Economie et des Finances",
    "Il pourrait s'agir d'une station de service ayant fermé de façon définitive ou temporaire et qui n'a pas été signalée. Nous vous invitons donc à la signaler dans la rubrique <<réclamation>>."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
        backgroundColor: Color(0xFF0B9A96),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(
                  questions[index],
                  style: TextStyle(color: Color(0xFF0B9A96)),
                ),
                onTap: () => _showAnswerDialog(context, index),
              ),
              ListTile(
                title: Text(answers[index]),
                onTap: () {}, // No action needed for answer ListTile
              ),
              Divider(), // Add a divider after each answer
            ],
          );
        },
      ),
    );
  }

  Future<void> _showAnswerDialog(BuildContext context, int index) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(questions[index]),
          content: Text(answers[index]),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fermer'),
            ),
          ],
        );
      },
    );
  }
}
