abstract class ApiProperties {
  static const Map<String, String> byName = {
    'endpoint': 'search',
    'fieldName': 'name',
  };
  static const Map<String, String> byFaction = {
    'endpoint': 'factions',
    'fieldName': 'faction',
  };
  static const Map<String, String> byCardSet = {
    'endpoint': 'sets',
    'fieldName': 'cardSet',
  };
  static const apiHeaders = {
    'X-RapidAPI-Key': '43b03448b2msh30b84be8f8ac5acp115528jsn2ff909d20a67',
    'X-RapidAPI-Host': 'omgvamp-hearthstone-v1.p.rapidapi.com',
  };
  static const baseUrl = 'https://omgvamp-hearthstone-v1.p.rapidapi.com/cards';
  static const mockApiBaseUrl =
      'https://6319ef0e8e51a64d2bf0edea.mockapi.io/api/cards/cards';
}
