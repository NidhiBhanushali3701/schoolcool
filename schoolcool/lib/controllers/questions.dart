class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "H2S is more acidic than H2O because",
    "options": ['oxygen is more electronegative than sulphur.', 'atomic number of sulphur is higher than oxygen. ', 'FacebookH — S bond dissociation energy is less as compared to H — O bond.', 'H — O bond dissociation energy is less also compared to H — S bond'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "In the manufacture of sulphuric acid by contact process Tyndall box is used to",
    "options": ['convert SO2 and SO3', ' test the presence of dust particles', 'filter dust particles', 'remove impurities'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "Fluorine differs from rest of the halogens in some of its properties. This is due to",
    "options": ['its smaller size and high electronegativity.', 'lack of d-orbitals.', 'low bond dissociation energy', 'All of the these.'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "Transistion metals, despite high E° oxidation, are poor reducing agents. The incorrect reason is",
    "options": [' high heat of vaporization', 'high ionization energies.', 'low heats of hydration.', 'complex forming nature.'],
    "answer_index": 2,
  },
  {
    "id": 5,
    "question": "Anomalous electronic configuration in the 3d series are of",
    "options": ['Cr and Fe', 'Cu and Zn', 'Fe and Cu', 'Cr and Cu'],
    "answer_index": 2,
  },
];