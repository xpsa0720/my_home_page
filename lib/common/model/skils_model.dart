class Skils_Model {
  final String title;
  final List<String> Language;
  final List<String> Framwork;
  final List<String> Language_skil;
  final String descriptor;
  final String gif_path;
  final List<String> platform;
  final List<String> package;
  final bool isRight;
  final bool isMaking;
  final int personnel;

  Skils_Model({
    required this.title,
    required this.Framwork,
    required this.descriptor,
    required this.Language,
    required this.Language_skil,
    required this.gif_path,
    required this.isRight,
    required this.platform,
    required this.personnel,
    required this.package,
    this.isMaking = false,
  });
}
