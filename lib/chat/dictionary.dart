class DictionaryEntry {
  final String word;
  final String phonetic;
  final List<Phonetic> phonetics;
  final List<Meaning> meanings;

  const DictionaryEntry({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.meanings,
  });

  factory DictionaryEntry.fromJson(Map<String, dynamic> json) {
    final phoneticsJson = json['phonetics'] as List<dynamic>? ?? [];
    final phoneticsList =
    phoneticsJson.map((e) => Phonetic.fromJson(e)).toList();

    final meaningsJson = json['meanings'] as List<dynamic>? ?? [];
    final meaningsList =
    meaningsJson.map((e) => Meaning.fromJson(e)).toList();

    return DictionaryEntry(
      word: json['word'] ?? '',
      phonetic: json['phonetic'] ?? '',
      phonetics: phoneticsList,
      meanings: meaningsList,
    );
  }

  Map<String, dynamic> toJson() => {
    'word': word,
    'phonetic': phonetic,
    'phonetics': phonetics.map((e) => e.toJson()).toList(),
    'meanings': meanings.map((e) => e.toJson()).toList(),
  };
}

class Phonetic {
  final String text;
  final String audio;

  const Phonetic({
    required this.text,
    required this.audio,
  });

  factory Phonetic.fromJson(Map<String, dynamic> json) {
    return Phonetic(
      text: json['text'] ?? '',
      audio: json['audio'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'text': text,
    'audio': audio,
  };
}

class Meaning {
  final String partOfSpeech;
  final List<Definition> definitions;
  final List<String> synonyms;
  final List<String> antonyms;

  const Meaning({
    required this.partOfSpeech,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  });

  factory Meaning.fromJson(Map<String, dynamic> json) {
    final definitionsJson = json['definitions'] as List<dynamic>? ?? [];
    final definitionsList =
    definitionsJson.map((e) => Definition.fromJson(e)).toList();

    final synonymsJson = json['synonyms'] as List<dynamic>? ?? [];
    final synonymsList = synonymsJson.map((e) => e.toString()).toList();

    final antonymsJson = json['antonyms'] as List<dynamic>? ?? [];
    final antonymsList = antonymsJson.map((e) => e.toString()).toList();

    return Meaning(
      partOfSpeech: json['partOfSpeech'] ?? '',
      definitions: definitionsList,
      synonyms: synonymsList,
      antonyms: antonymsList,
    );
  }

  Map<String, dynamic> toJson() => {
    'partOfSpeech': partOfSpeech,
    'definitions': definitions.map((e) => e.toJson()).toList(),
    'synonyms': synonyms,
    'antonyms': antonyms,
  };
}

class Definition {
  final String definition;
  final String example;
  final List<String> synonyms;
  final List<String> antonyms;

  const Definition({
    required this.definition,
    required this.example,
    required this.synonyms,
    required this.antonyms,
  });

  factory Definition.fromJson(Map<String, dynamic> json) {
    final synonymsJson = json['synonyms'] as List<dynamic>? ?? [];
    final synonymsList = synonymsJson.map((e) => e.toString()).toList();

    final antonymsJson = json['antonyms'] as List<dynamic>? ?? [];
    final antonymsList = antonymsJson.map((e) => e.toString()).toList();

    return Definition(
      definition: json['definition'] ?? '',
      example: json['example'] ?? '',
      synonyms: synonymsList,
      antonyms: antonymsList,
    );
  }

  Map<String, dynamic> toJson() => {
    'definition': definition,
    'example': example,
    'synonyms': synonyms,
    'antonyms': antonyms,
  };
}
