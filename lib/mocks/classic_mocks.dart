const List<Map<String, dynamic>> mockData = [
  {
    "title": "Casablanca",
    "id": 1,
    "vote_count": 8800,
    "vote_average": 8.5,
    "image_url": "assets/images/padrino.jpg",
    "description": "Una historia de amor ambientada durante la Segunda Guerra Mundial en Casablanca, Marruecos, donde los refugiados intentan escapar de la persecución nazi.",
    "year": 1942,
    "genre": "Drama, Romance, Bélico"
  },
  {
    "title": "Lo que el viento se llevó",
    "id": 2,
    "vote_count": 15430,
    "vote_average": 8.2,
    "image_url": "assets/images/padrino.jpg",
    "description": "Una romántica historia histórica sobre la vida de Scarlett O'Hara, una joven sureña durante la Guerra Civil de Estados Unidos.",
    "year": 1939,
    "genre": "Drama, Romance, Bélico"
  },
  {
    "title": "Ciudadano Kane",
    "id": 3,
    "vote_count": 17400,
    "vote_average": 8.3,
    "image_url": "assets/images/padrino.jpg",
    "description": "La historia de un magnate de la prensa y su ascenso al poder, seguido de su caída trágica, narrado a través de una serie de flashbacks.",
    "year": 1941,
    "genre": "Drama, Misterio"
  },
  {
    "title": "El mago de Oz",
    "id": 4,
    "vote_count": 12560,
    "vote_average": 8.1,
    "image_url": "assets/images/padrino.jpg",
    "description": "La historia de Dorothy y su viaje al mundo mágico de Oz, donde busca la ayuda de tres nuevos amigos para regresar a casa.",
    "year": 1939,
    "genre": "Aventura, Fantasía, Musical"
  },
  {
    "title": "Pulp Fiction",
    "id": 5,
    "vote_count": 27913,
    "vote_average": 8.9,
    "image_url": "assets/images/padrino.jpg",
    "description": "Una película que entrelaza varias historias de crimen y violencia en Los Ángeles, narradas de manera no lineal.",
    "year": 1994,
    "genre": "Crimen, Drama"
  },
  {
    "title": "El Padrino",
    "id": 6,
    "vote_count": 20637,
    "vote_average": 9.2,
    "image_url": "assets/images/padrino.jpg",
    "description": "La historia de la familia mafiosa Corleone, su ascenso al poder y las tensiones dentro de la familia.",
    "year": 1972,
    "genre": "Crimen, Drama"
  },
  {
    "title": "Lawrence de Arabia",
    "id": 7,
    "vote_count": 7880,
    "vote_average": 8.5,
    "image_url": "assets/images/padrino.jpg",
    "description": "La épica historia del oficial británico T.E. Lawrence y su participación en la revuelta árabe contra el Imperio Otomano.",
    "year": 1962,
    "genre": "Aventura, Biografía, Bélico"
  },
  {
    "title": "La lista de Schindler",
    "id": 8,
    "vote_count": 15853,
    "vote_average": 8.9,
    "image_url": "assets/images/padrino.jpg",
    "description": "La historia de Oskar Schindler, un empresario alemán que salvó a miles de judíos durante el Holocausto.",
    "year": 1993,
    "genre": "Drama, Bélico"
  },
  {
    "title": "12 hombres en pugna",
    "id": 9,
    "vote_count": 8656,
    "vote_average": 8.9,
    "image_url": "assets/images/padrino.jpg",
    "description": "Doce jurados discuten el veredicto en un caso de asesinato, enfrentándose a sus propios prejuicios y emociones.",
    "year": 1957,
    "genre": "Drama"
  },
  {
    "title": "Cantando bajo la lluvia",
    "id": 10,
    "vote_count": 7800,
    "vote_average": 8.3,
    "image_url": "assets/images/padrino.jpg",
    "description": "Una historia de amor y superación en el contexto de la transición del cine mudo al cine sonoro en Hollywood.",
    "year": 1952,
    "genre": "Comedia, Musical, Romance"
  },
  {
    "title": "El bueno, el feo y el malo",
    "id": 11,
    "vote_count": 8610,
    "vote_average": 8.8,
    "image_url": "assets/images/padrino.jpg",
    "description": "Tres pistoleros se enfrentan por encontrar una fortuna en oro durante la Guerra Civil estadounidense.",
    "year": 1966,
    "genre": "Western"
  },
  {
    "title": "Con la muerte en los talones",
    "id": 12,
    "vote_count": 12456,
    "vote_average": 8.4,
    "image_url": "assets/images/padrino.jpg",
    "description": "Un hombre es acusado injustamente de un crimen que no cometió, mientras trata de escapar de los asesinos que lo persiguen.",
    "year": 1959,
    "genre": "Suspense, Acción"
  },
  {
    "title": "Vértigo",
    "id": 13,
    "vote_count": 16287,
    "vote_average": 8.6,
    "image_url": "assets/images/padrino.jpg",
    "description": "Un detective privado sufre de vértigo mientras investiga el caso de una mujer que se suicida, pero que podría estar viva.",
    "year": 1958,
    "genre": "Misterio, Suspense"
  },
  {
    "title": "El sonido de la música",
    "id": 14,
    "vote_count": 13589,
    "vote_average": 8.2,
    "image_url": "assets/images/padrino.jpg",
    "description": "Una joven novicia se convierte en la niñera de una familia militar en Austria, mientras estalla la Segunda Guerra Mundial.",
    "year": 1965,
    "genre": "Musical, Drama"
  },
  {
    "title": "¡Qué bello es vivir!",
    "id": 15,
    "vote_count": 12500,
    "vote_average": 8.0,
    "image_url": "assets/images/padrino.jpg",
    "description": "Un hombre desilusionado con su vida recibe la oportunidad de ver cómo sería el mundo si él nunca hubiera nacido.",
    "year": 1946,
    "genre": "Drama, Fantasía, Familia"
  },
  {
    "title": "El puente sobre el río Kwai",
    "id": 16,
    "vote_count": 11289,
    "vote_average": 8.1,
    "image_url": "assets/images/padrino.jpg",
    "description": "Un grupo de prisioneros de guerra británicos es forzado a construir un puente para los japoneses durante la Segunda Guerra Mundial.",
    "year": 1957,
    "genre": "Bélico, Drama"
  },
  {
    "title": "Ben-Hur",
    "id": 17,
    "vote_count": 11120,
    "vote_average": 8.0,
    "image_url": "assets/images/padrino.jpg",
    "description": "La épica historia de un hombre que busca venganza después de ser traicionado por su amigo en la antigua Roma.",
    "year": 1959,
    "genre": "Bélico, Drama"
  },
  {
    "title": "Al este del Edén",
    "id": 18,
    "vote_count": 11000,
    "vote_average": 8.1,
    "image_url": "assets/images/padrino.jpg",
    "description": "Un drama familiar que explora la rivalidad entre dos hermanos y sus complejas relaciones con su padre.",
    "year": 1955,
    "genre": "Drama"
  }
];
