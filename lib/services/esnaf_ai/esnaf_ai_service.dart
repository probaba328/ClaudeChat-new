/// Esnaf AI — Trendyol/Hepsiburada satıcılarına özel iş asistanı.
///
/// Ayarlar `SettingsService` üzerinden saklanır; anahtar adları:
///   esnafEnabled       – bool  (varsayılan: false)
///   esnafStoreName     – String (mağaza adı)
///   esnafPlatform      – 'trendyol' | 'hepsiburada' | 'her_ikisi'
///   esnafPlan          – String (plan / paket adı)
class EsnafAiService {
  static const List<Map<String, String>> platformOptions = <Map<String, String>>[
    <String, String>{'value': 'trendyol', 'label': 'Trendyol'},
    <String, String>{'value': 'hepsiburada', 'label': 'Hepsiburada'},
    <String, String>{'value': 'her_ikisi', 'label': 'Her İkisi'},
  ];

  static const List<String> planOptions = <String>[
    'Ücretsiz',
    'Temel',
    'Pro',
    'Kurumsal',
  ];

  static String platformLabel(String value) {
    switch (value) {
      case 'trendyol':
        return 'Trendyol';
      case 'hepsiburada':
        return 'Hepsiburada';
      case 'her_ikisi':
        return 'Trendyol & Hepsiburada';
      default:
        return value;
    }
  }

  /// Verilen ayarlarla Esnaf AI sistem promptunu üretir.
  static String buildSystemPrompt({
    required String storeName,
    required String platform,
    required String plan,
  }) {
    final storePart = storeName.trim().isEmpty ? '—' : storeName.trim();
    final platformPart = platformLabel(platform);
    final planPart = plan.trim().isEmpty ? '—' : plan.trim();

    return '''Sen Esnaf AI'sın — Trendyol/Hepsiburada satıcılarına özel iş asistanısın.

Mağaza: $storePart | Platform: $platformPart | Plan: $planPart

Görevlerin:
- Sipariş yönetimi
- Stok takibi
- Müşteri şikayeti yanıtı
- Günlük rapor
- Ürün SEO (başlık/açıklama)
- Fiyat ve kampanya analizi

Kurallar:
- Her zaman somut rakam ver
- Tablo veya madde listesi kullan
- Acil uyarılara 🚨 koy
- IBAN/şifre/API key asla isteme
- Bilmediğin kurallarda "Trendyol Yardım Merkezi'ni kontrol et" de''';
  }
}
