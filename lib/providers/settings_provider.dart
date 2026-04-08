import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool _emailNotifications = true;
  bool _pushNotifications = true;
  String _selectedLanguage = "English";

  bool get isDarkMode => _isDarkMode;
  bool get emailNotifications => _emailNotifications;
  bool get pushNotifications => _pushNotifications;
  String get selectedLanguage => _selectedLanguage;

  final List<String> languages = ["English", "Hindi", "Spanish", "French", "German"];

  final Map<String, Map<String, String>> _translations = {
    "English": {
      "profile": "Profile",
      "my_account": "My Account",
      "notifications": "Notifications",
      "settings": "Settings",
      "help_center": "Help Center",
      "log_out": "Log Out",
      "appearance": "Appearance",
      "dark_mode": "Dark Mode",
      "language": "Language",
      "privacy_policy": "Privacy Policy",
      "name": "Name",
      "email": "Email",
      "phone": "Phone",
      "address": "Address",
      "how_can_we_help": "How can we help you?",
      "search_help": "Search for help...",
      "faqs": "Frequently Asked Questions",
      "contact_us": "Contact Us",
      "email_support": "Email Support",
      "phone_support": "Phone Support",
      "github": "GitHub Account",
      "logout_confirm": "Are you sure you want to logout?",
      "cancel": "Cancel",
      "yes": "Yes",
    },
    "Hindi": {
      "profile": "प्रोफ़ाइल",
      "my_account": "मेरा खाता",
      "notifications": "सूचनाएं",
      "settings": "सेटिंग्स",
      "help_center": "सहायता केंद्र",
      "log_out": "लॉग आउट",
      "appearance": "दिखावट",
      "dark_mode": "डार्क मोड",
      "language": "भाषा",
      "privacy_policy": "गोपनीयता नीति",
      "name": "नाम",
      "email": "ईमेल",
      "phone": "फ़ोन",
      "address": "पता",
      "how_can_we_help": "हम आपकी कैसे मदद कर सकते हैं?",
      "search_help": "सहायता के लिए खोजें...",
      "faqs": "अक्सर पूछे जाने वाले प्रश्न",
      "contact_us": "संपर्क करें",
      "email_support": "ईमेल समर्थन",
      "phone_support": "फ़ोन समर्थन",
      "github": "गिटहब अकाउंट",
      "logout_confirm": "क्या आप वाकई लॉग आउट करना चाहते हैं?",
      "cancel": "रद्द करें",
      "yes": "हाँ",
    },
    "Spanish": {
      "profile": "Perfil",
      "my_account": "Mi Cuenta",
      "notifications": "Notificaciones",
      "settings": "Ajustes",
      "help_center": "Centro de Ayuda",
      "log_out": "Cerrar Sesión",
      "appearance": "Apariencia",
      "dark_mode": "Modo Oscuro",
      "language": "Idioma",
      "privacy_policy": "Política de Privacidad",
      "name": "Nombre",
      "email": "Correo Electrónico",
      "phone": "Teléfono",
      "address": "Dirección",
      "how_can_we_help": "¿Cómo podemos ayudarte?",
      "search_help": "Buscar ayuda...",
      "faqs": "Preguntas Frecuentes",
      "contact_us": "Contáctenos",
      "email_support": "Soporte por Correo",
      "phone_support": "Soporte Telefónico",
      "github": "Cuenta de GitHub",
      "logout_confirm": "¿Está seguro de que desea cerrar sesión?",
      "cancel": "Cancelar",
      "yes": "Sí",
    },
    "French": {
      "profile": "Profil",
      "my_account": "Mon Compte",
      "notifications": "Notifications",
      "settings": "Paramètres",
      "help_center": "Centre d'Aide",
      "log_out": "Déconnexion",
      "appearance": "Apparence",
      "dark_mode": "Mode Sombre",
      "language": "Langue",
      "privacy_policy": "Politique de Confidentialité",
      "name": "Nom",
      "email": "E-mail",
      "phone": "Téléphone",
      "address": "Adresse",
      "how_can_we_help": "Comment pouvons-nous vous aider ?",
      "search_help": "Rechercher de l'aide...",
      "faqs": "Questions Fréquemment Posées",
      "contact_us": "Contactez-nous",
      "email_support": "Support par E-mail",
      "phone_support": "Support Téléphonique",
      "github": "Compte GitHub",
      "logout_confirm": "Êtes-vous sûr de vouloir vous déconnecter ?",
      "cancel": "Annuler",
      "yes": "Oui",
    },
    "German": {
      "profile": "Profil",
      "my_account": "Mein Konto",
      "notifications": "Benachrichtigungen",
      "settings": "Einstellungen",
      "help_center": "Hilfecenter",
      "log_out": "Abmelden",
      "appearance": "Aussehen",
      "dark_mode": "Dunkelmodus",
      "language": "Sprache",
      "privacy_policy": "Datenschutz-Bestimmungen",
      "name": "Name",
      "email": "E-Mail",
      "phone": "Telefon",
      "address": "Adresse",
      "how_can_we_help": "Wie können wir Ihnen helfen?",
      "search_help": "Suche nach Hilfe...",
      "faqs": "Häufig gestellte Fragen",
      "contact_us": "Kontaktiere uns",
      "email_support": "E-Mail-Support",
      "phone_support": "Telefonischer Support",
      "github": "GitHub-Konto",
      "logout_confirm": "Sind Sie sicher, dass Sie sich abmelden möchten?",
      "cancel": "Abbrechen",
      "yes": "Ja",
    },
  };

  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  void toggleEmailNotifications(bool value) {
    _emailNotifications = value;
    notifyListeners();
  }

  void togglePushNotifications(bool value) {
    _pushNotifications = value;
    notifyListeners();
  }

  void setLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }

  String translate(String key) {
    return _translations[_selectedLanguage]?[key] ?? key;
  }
}
