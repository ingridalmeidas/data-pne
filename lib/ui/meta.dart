import 'package:flutter/material.dart';

import 'login.dart';

class Meta extends StatefulWidget {
  const Meta({super.key});

  @override
  State<Meta> createState() => _Meta();
}

class _Meta extends State<Meta> {
  String? selectedRegion;
  String? selectedState;
  String? selectedCity;

  // Dados fictícios para as regiões, estados e cidades
  final List<String> regions = [
    'Norte',
    'Nordeste',
    'Centro-Oeste',
    'Sudeste',
    'Sul'
  ];
  final Map<String, List<String>> statesByRegion = {
    'Norte': [
      'Acre',
      'Amapá',
      'Amazonas',
      'Pará',
      'Rondônia',
      'Roraima',
      'Tocantins'
    ],
    'Nordeste': [
      'Alagoas',
      'Bahia',
      'Ceará',
      'Maranhão',
      'Paraíba',
      'Pernambuco',
      'Piauí',
      'Rio Grande do Norte',
      'Sergipe'
    ],
    'Centro-Oeste': [
      'Distrito Federal',
      'Goiás',
      'Mato Grosso',
      'Mato Grosso do Sul'
    ],
    'Sudeste': [
      'Espírito Santo',
      'Minas Gerais',
      'Rio de Janeiro',
      'São Paulo'
    ],
    'Sul': ['Paraná', 'Rio Grande do Sul', 'Santa Catarina'],
  };

  final Map<String, Map> cityInfoByState = {
    'Amazonas': {
      'cidade': 'Manaus',
      'percent_meta': '0.87',
      'nota_enem': '497.79'
    },
    'Roraima': {
      'cidade': 'Boa Vista',
      'percent_meta': '0.69',
      'nota_enem': '508.77'
    },
    'Amapá': {
      'cidade': 'Macapá',
      'percent_meta': '0.74',
      'nota_enem': '502.50'
    },
    'Pará': {'cidade': 'Belém', 'percent_meta': '0.84', 'nota_enem': '533.22'},
    'Tocantins': {
      'cidade': 'Palmas',
      'percent_meta': '0.72',
      'nota_enem': '537.08'
    },
    'Rondônia': {
      'cidade': 'Porto Velho',
      'percent_meta': '0.85',
      'nota_enem': '512.20'
    },
    'Acre': {
      'cidade': 'Rio Branco',
      'percent_meta': '0.78',
      'nota_enem': '513.38'
    },
    'Paraíba': {
      'cidade': 'João Pessoa',
      'percent_meta': '0.86',
      'nota_enem': '555.42'
    },
    'Maranhão': {
      'cidade': 'São Luís',
      'percent_meta': '0.97',
      'nota_enem': '525.69'
    },
    'Piauí': {
      'cidade': 'Teresina',
      'percent_meta': '0.96',
      'nota_enem': '557.23'
    },
    'Ceará': {
      'cidade': 'Fortaleza',
      'percent_meta': '0.85',
      'nota_enem': '525.62'
    },
    'Rio Grande do Norte': {
      'cidade': 'Natal',
      'percent_meta': '0.88',
      'nota_enem': '565.4'
    },
    'Pernambuco': {
      'cidade': 'Recife',
      'percent_meta': '1.06',
      'nota_enem': '551.33'
    },
    'Sergipe': {
      'cidade': 'Aracaju',
      'percent_meta': '0.92',
      'nota_enem': '559.41'
    },
    'Alagoas': {
      'cidade': 'Maceió',
      'percent_meta': '0.73',
      'nota_enem': '534.58'
    },
    'Bahia': {
      'cidade': 'Salvador',
      'percent_meta': '0.84',
      'nota_enem': '545.77'
    },
    'Mato Grosso': {
      'cidade': 'Cuiabá',
      'percent_meta': '0.91',
      'nota_enem': '544.0'
    },
    'Mato Grosso do Sul': {
      'cidade': 'Campo Grande',
      'percent_meta': '0.6',
      'nota_enem': '545.80'
    },
    'Goiás': {
      'cidade': 'Goiânia',
      'percent_meta': '0.83',
      'nota_enem': '572.28'
    },
    'São Paulo': {
      'cidade': 'São Paulo',
      'percent_meta': '0.86',
      'nota_enem': '558.40'
    },
    'Rio de Janeiro': {
      'cidade': 'Rio de Janeiro',
      'percent_meta': '0.89',
      'nota_enem': '566.66'
    },
    'Espírito Santo': {
      'cidade': 'Vitória',
      'percent_meta': '1.17',
      'nota_enem': '579.36'
    },
    'Minas Gerais': {
      'cidade': 'Belo Horizonte',
      'percent_meta': '0.99',
      'nota_enem': '591.11'
    },
    'Paraná': {
      'cidade': 'Curitiba',
      'percent_meta': '0.87',
      'nota_enem': '570.57'
    },
    'Rio Grande do Sul': {
      'cidade': 'Porto Alegre',
      'percent_meta': '0.90',
      'nota_enem': '573.37'
    },
    'Santa Catarina': {
      'cidade': 'Florianópolis',
      'percent_meta': '1.03',
      'nota_enem': '587.67'
    }
  };

  final Map<String, Map> tipoEscola = {
    'Amazonas': {
      'publica': '92.38%',
      'privada': '7.62%',
      'nao_respondeu': '0%'
    },
    'Roraima': {'publica': '90.73%', 'privada': '9.27%', 'nao_respondeu': '0%'},
    'Amapá': {'publica': '86.96%', 'privada': '13.04%', 'nao_respondeu': '0%'},
    'Pará': {'publica': '72.53%', 'privada': '27.47%', 'nao_respondeu': '0%'},
    'Tocantins': {
      'publica': '85.57%',
      'privada': '14.43%',
      'nao_respondeu': '0%'
    },
    'Rondônia': {
      'publica': '92.68%',
      'privada': '7.32%',
      'nao_respondeu': '0%'
    },
    'Acre': {'publica': '89.6%', 'privada': '10.4%', 'nao_respondeu': '0%'},
    'Paraíba': {
      'publica': '63.77%',
      'privada': '36.23%',
      'nao_respondeu': '0%'
    },
    'Maranhão': {
      'publica': '80.89%',
      'privada': '19.11%',
      'nao_respondeu': '0%'
    },
    'Piauí': {'publica': '67.47%', 'privada': '32.53%', 'nao_respondeu': '0%'},
    'Ceará': {'publica': '83.62%', 'privada': '16.38%', 'nao_respondeu': '0%'},
    'Rio Grande do Norte': {
      'publica': '65.49%',
      'privada': '34.51%',
      'nao_respondeu': '0%'
    },
    'Pernambuco': {
      'publica': '71.1%',
      'privada': '28.9%',
      'nao_respondeu': '0%'
    },
    'Sergipe': {
      'publica': '56.15%',
      'privada': '43.85%',
      'nao_respondeu': '0%'
    },
    'Alagoas': {
      'publica': '61.23%',
      'privada': '38.77%',
      'nao_respondeu': '0%'
    },
    'Bahia': {'publica': '67.05%', 'privada': '32.95%', 'nao_respondeu': '0%'},
    'Mato Grosso': {
      'publica': '72.54%',
      'privada': '27.46%',
      'nao_respondeu': '0%'
    },
    'Mato Grosso do Sul': {
      'publica': '81.27%',
      'privada': '18.73%',
      'nao_respondeu': '0%'
    },
    'Goiás': {'publica': '67.07%', 'privada': '32.93%', 'nao_respondeu': '0%'},
    'São Paulo': {
      'publica': '66.31%',
      'privada': '33.69%',
      'nao_respondeu': '0%'
    },
    'Rio de Janeiro': {
      'publica': '61.76%',
      'privada': '38.24%',
      'nao_respondeu': '0%'
    },
    'Espírito Santo': {
      'publica': '72.63%',
      'privada': '27.37%',
      'nao_respondeu': '0%'
    },
    'Minas Gerais': {
      'publica': '69.35%',
      'privada': '30.65%',
      'nao_respondeu': '0%'
    },
    'Paraná': {'publica': '65.91%', 'privada': '34.09%', 'nao_respondeu': '0%'},
    'Rio Grande do Sul': {
      'publica': '61.89%',
      'privada': '38.11%',
      'nao_respondeu': '0%'
    },
    'Santa Catarina': {
      'publica': '60.79%',
      'privada': '39.21%',
      'nao_respondeu': '0%'
    }
  };

  final Map<String, Map> tipoEnsino = {
    'Amazonas': {'regular': '99.44%', 'especial': '0.56%'},
    'Roraima': {'regular': '99.66%', 'especial': '0.34%'},
    'Amapá': {'regular': '99.53%', 'especial': '0.47%'},
    'Pará': {'regular': '99.52%', 'especial': '0.48%'},
    'Tocantins': {'regular': '99.67%', 'especial': '0.33%'},
    'Rondônia': {'regular': '99.43%', 'especial': '0.57%'},
    'Acre': {'regular': '99.69%', 'especial': '0.31%'},
    'Paraíba': {'regular': '99.31%', 'especial': '0.69%'},
    'Maranhão': {'regular': '99.64%', 'especial': '0.36%'},
    'Piauí': {'regular': '99.63%', 'especial': '0.37%'},
    'Ceará': {'regular': '99.74%', 'especial': '0.26%'},
    'Rio Grande do Norte': {'regular': '99.56%', 'especial': '0.44%'},
    'Pernambuco': {'regular': '99.45%', 'especial': '0.55%'},
    'Sergipe': {'regular': '99.44%', 'especial': '0.56%'},
    'Alagoas': {'regular': '99.57%', 'especial': '0.43%'},
    'Bahia': {'regular': '99.26%', 'especial': '0.74%'},
    'Mato Grosso': {'regular': '99.69%', 'especial': '0.31%'},
    'Mato Grosso do Sul': {'regular': '99.56%', 'especial': '0.44%'},
    'Goiás': {'regular': '99.47%', 'especial': '0.53%'},
    'São Paulo': {'regular': '99.71%', 'especial': '0.29%'},
    'Rio de Janeiro': {'regular': '99.59%', 'especial': '0.41%'},
    'Espírito Santo': {'regular': '99.76%', 'especial': '0.24%'},
    'Minas Gerais': {'regular': '99.45%', 'especial': '0.55%'},
    'Paraná': {'regular': '99.63%', 'especial': '0.37%'},
    'Rio Grande do Sul': {'regular': '99.69%', 'especial': '0.31%'},
    'Santa Catarina': {'regular': '99.58%', 'especial': '0.42%'}
  };

  final Map<String, Map> tipoAdministracao = {
    'Amazonas': {
      'estadual': '86.51%',
      'federal': '3.06%',
      'municipal': '0.4%',
      'privada': '10.03%'
    },
    'Roraima': {
      'estadual': '76.39%',
      'federal': '11.14%',
      'municipal': '0.02%',
      'privada': '12.45%'
    },
    'Amapá': {
      'estadual': '78.19%',
      'federal': '4.56%',
      'municipal': '0.02%',
      'privada': '17.23%'
    },
    'Pará': {
      'estadual': '61.83%',
      'federal': '4.67%',
      'municipal': '0.47%',
      'privada': '33.03%'
    },
    'Tocantins': {
      'estadual': '69.34%',
      'federal': '10.43%',
      'municipal': '0.17%',
      'privada': '20.06%'
    },
    'Rondônia': {
      'estadual': '81.64%',
      'federal': '8.03%',
      'municipal': '0.03%',
      'privada': '10.3%'
    },
    'Acre': {
      'estadual': '79.99%',
      'federal': '6.09%',
      'municipal': '0.07%',
      'privada': '13.86%'
    },
    'Paraíba': {
      'estadual': '53.1%',
      'federal': '6.43%',
      'municipal': '0.05%',
      'privada': '40.2%'
    },
    'Maranhão': {
      'estadual': '69.83%',
      'federal': '8.52%',
      'municipal': '0.05%',
      'privada': '21.6%'
    },
    'Piauí': {
      'estadual': '55.45%',
      'federal': '5.01%',
      'municipal': '0.38%',
      'privada': '39.16%'
    },
    'Ceará': {
      'estadual': '80.77%',
      'federal': '1.64%',
      'municipal': '0.03%',
      'privada': '17.56%'
    },
    'Rio Grande do Norte': {
      'estadual': '47.83%',
      'federal': '12.67%',
      'municipal': '0.05%',
      'privada': '39.45%'
    },
    'Pernambuco': {
      'estadual': '65.13%',
      'federal': '4.78%',
      'municipal': '0.03%',
      'privada': '30.07%'
    },
    'Sergipe': {
      'estadual': '49.92%',
      'federal': '2.61%',
      'municipal': '0.03%',
      'privada': '47.44%'
    },
    'Alagoas': {
      'estadual': '46.75%',
      'federal': '10.28%',
      'municipal': '0.02%',
      'privada': '42.95%'
    },
    'Bahia': {
      'estadual': '59.39%',
      'federal': '5.35%',
      'municipal': '0.09%',
      'privada': '35.18%'
    },
    'Mato Grosso': {
      'estadual': '52.49%',
      'federal': '11.79%',
      'municipal': '0.14%',
      'privada': '35.59%'
    },
    'Mato Grosso do Sul': {
      'estadual': '68.8%',
      'federal': '5.51%',
      'municipal': '0.3%',
      'privada': '25.4%'
    },
    'Goiás': {
      'estadual': '56.18%',
      'federal': '3.35%',
      'municipal': '0.04%',
      'privada': '40.43%'
    },
    'São Paulo': {
      'estadual': '60.55%',
      'federal': '0.64%',
      'municipal': '0.74%',
      'privada': '38.07%'
    },
    'Rio de Janeiro': {
      'estadual': '47.03%',
      'federal': '7.43%',
      'municipal': '0.92%',
      'privada': '44.62%'
    },
    'Espírito Santo': {
      'estadual': '59.26%',
      'federal': '8.93%',
      'municipal': '0.08%',
      'privada': '31.73%'
    },
    'Minas Gerais': {
      'estadual': '58.69%',
      'federal': '5.55%',
      'municipal': '0.25%',
      'privada': '35.51%'
    },
    'Paraná': {
      'estadual': '52.34%',
      'federal': '3.46%',
      'municipal': '0.13%',
      'privada': '44.06%'
    },
    'Rio Grande do Sul': {
      'estadual': '51.23%',
      'federal': '0.49%',
      'municipal': '0.54%',
      'privada': '44.73%'
    },
    'Santa Catarina': {
      'estadual': '38.72%',
      'federal': '13.81%',
      'municipal': '0.28%',
      'privada': '47.19%'
    }
  };

  final Map<String, Map> tipoLocalizacao = {
    'Amazonas': {'urbana': '99.99%', 'rural': '0.01%'},
    'Roraima': {'urbana': '97.68%', 'rural': '2.32%'},
    'Amapá': {'urbana': '95.5%', 'rural': '4.5%'},
    'Pará': {'urbana': '99.99%', 'rural': '0.01%'},
    'Tocantins': {'urbana': '99.94%', 'rural': '0.06%'},
    'Rondônia': {'urbana': '99.33%', 'rural': '0.67%'},
    'Acre': {'urbana': '98.12%', 'rural': '1.88%'},
    'Paraíba': {'urbana': '100%', 'rural': '0%'},
    'Maranhão': {'urbana': '96.7%', 'rural': '3.3%'},
    'Piauí': {'urbana': '98.58%', 'rural': '1.42%'},
    'Ceará': {'urbana': '100%', 'rural': '0%'},
    'Rio Grande do Norte': {'urbana': '100%', 'rural': '0%'},
    'Pernambuco': {'urbana': '100%', 'rural': '0%'},
    'Sergipe': {'urbana': '100%', 'rural': '0%'},
    'Alagoas': {'urbana': '100%', 'rural': '0%'},
    'Bahia': {'urbana': '100%', 'rural': '0%'},
    'Mato Grosso': {'urbana': '99.99%', 'rural': '0.01%'},
    'Mato Grosso do Sul': {'urbana': '99.56%', 'rural': '0.44%'},
    'Goiás': {'urbana': '100%', 'rural': '0%'},
    'São Paulo': {'urbana': '100%', 'rural': '0%'},
    'Rio de Janeiro': {'urbana': '99.95%', 'rural': '0.05%'},
    'Espírito Santo': {'urbana': '100%', 'rural': '0%'},
    'Minas Gerais': {'urbana': '100%', 'rural': '0%'},
    'Paraná': {'urbana': '100%', 'rural': '0%'},
    'Rio Grande do Sul': {'urbana': '100%', 'rural': '0%'},
    'Santa Catarina': {'urbana': '100%', 'rural': '0%'}
  };

  final Map<String, Map> raca = {
    'Amazonas': {
      'parda': '70.82%',
      'branca': '18.38%',
      'preta': '5.33%',
      'nao_declarado': '2.38%',
      'amarela': '2.17%',
      'indigena': '0.92%'
    },
    'Roraima': {
      'parda': '66.09%',
      'branca': '20.01%',
      'preta': '7.19%',
      'nao_declarado': '2.03%',
      'amarela': '1.08%',
      'indigena': '3.59%'
    },
    'Amapá': {
      'parda': '61.2%',
      'branca': '21.15%',
      'preta': '13.15%',
      'nao_declarado': '2.52%',
      'amarela': '1.54%',
      'indigena': '0.45%'
    },
    'Pará': {
      'parda': '57.15%',
      'branca': '24.78%',
      'preta': '13.52%',
      'nao_declarado': '1.89%',
      'amarela': '1.94%',
      'indigena': '0.73%'
    },
    'Tocantins': {
      'parda': '51.7%',
      'branca': '30.43%',
      'preta': '12.24%',
      'nao_declarado': '1.83%',
      'amarela': '3.37%',
      'indigena': '0.43%'
    },
    'Rondônia': {
      'parda': '60.49%',
      'branca': '22.74%',
      'preta': '10.62%',
      'nao_declarado': '2.5%',
      'amarela': '2.92%',
      'indigena': '0.74%'
    },
    'Acre': {
      'parda': '59.97%',
      'branca': '21.34%',
      'preta': '12.04%',
      'nao_declarado': '2.23%',
      'amarela': '3.7%',
      'indigena': '0.72%'
    },
    'Paraíba': {
      'parda': '46.95%',
      'branca': '37.22%',
      'preta': '10.39%',
      'nao_declarado': '1.96%',
      'amarela': '2.68%',
      'indigena': '0.79%'
    },
    'Maranhão': {
      'parda': '59.02%',
      'branca': '24.27%',
      'preta': '13.42%',
      'nao_declarado': '1.68%',
      'amarela': '1.31%',
      'indigena': '0.3%'
    },
    'Piauí': {
      'parda': '57.16%',
      'branca': '22.32%',
      'preta': '14.9%',
      'nao_declarado': '1.96%',
      'amarela': '3.16%',
      'indigena': '0.5%'
    },
    'Ceará': {
      'parda': '65.89%',
      'branca': '20.89%',
      'preta': '7.8%',
      'nao_declarado': '3.24%',
      'amarela': '1.66%',
      'indigena': '0.52%'
    },
    'Rio Grande do Norte': {
      'parda': '43.7%',
      'branca': '42.71%',
      'preta': '9.59%',
      'nao_declarado': '1.59%',
      'amarela': '2.11%',
      'indigena': '0.31%'
    },
    'Pernambuco': {
      'parda': '44.18%',
      'branca': '36.96%',
      'preta': '12.85%',
      'nao_declarado': '3.05%',
      'amarela': '2.46%',
      'indigena': '0.5%'
    },
    'Sergipe': {
      'parda': '50.41%',
      'branca': '26.89%',
      'preta': '15.63%',
      'nao_declarado': '3.3%',
      'amarela': '3%',
      'indigena': '0.77%'
    },
    'Alagoas': {
      'parda': '50.09%',
      'branca': '31.51%',
      'preta': '11.6%',
      'nao_declarado': '2.55%',
      'amarela': '3.7%',
      'indigena': '0.55%'
    },
    'Bahia': {
      'parda': '43.17%',
      'branca': '19.85%',
      'preta': '31.76%',
      'nao_declarado': '2.46%',
      'amarela': '2.19%',
      'indigena': '0.56%'
    },
    'Mato Grosso': {
      'parda': '47.69%',
      'branca': '32.67%',
      'preta': '15.21%',
      'nao_declarado': '1.76%',
      'amarela': '2.31%',
      'indigena': '0.36%'
    },
    'Mato Grosso do Sul': {
      'parda': '39.28%',
      'branca': '48.78%',
      'preta': '6.66%',
      'nao_declarado': '1.81%',
      'amarela': '2.63%',
      'indigena': '0.84%'
    },
    'Goiás': {
      'parda': '41.17%',
      'branca': '42.34%',
      'preta': '9.14%',
      'nao_declarado': '3.94%',
      'amarela': '3.1%',
      'indigena': '0.31%'
    },
    'São Paulo': {
      'parda': '26.43%',
      'branca': '58.35%',
      'preta': '9.85%',
      'nao_declarado': '1.53%',
      'amarela': '3.44%',
      'indigena': '0.39%'
    },
    'Rio de Janeiro': {
      'parda': '31.06%',
      'branca': '50.94%',
      'preta': '14.57%',
      'nao_declarado': '1.97%',
      'amarela': '1.17%',
      'indigena': '0.29%'
    },
    'Espírito Santo': {
      'parda': '40.91%',
      'branca': '40.91%',
      'preta': '14.86%',
      'nao_declarado': '1.62%',
      'amarela': '1.24%',
      'indigena': '0.46%'
    },
    'Minas Gerais': {
      'parda': '36.21%',
      'branca': '46.5%',
      'preta': '12.93%',
      'nao_declarado': '2.24%',
      'amarela': '1.71%',
      'indigena': '0.4%'
    },
    'Paraná': {
      'parda': '16.25%',
      'branca': '76.06%',
      'preta': '3.51%',
      'nao_declarado': '1.73%',
      'amarela': '2.31%',
      'indigena': '0.13%'
    },
    'Rio Grande do Sul': {
      'parda': '11.03%',
      'branca': '76.52%',
      'preta': '10.47%',
      'nao_declarado': '1.43%',
      'amarela': '0.4%',
      'indigena': '0.15%'
    },
    'Santa Catarina': {
      'parda': '13.24%',
      'branca': '77.79%',
      'preta': '6.1%',
      'nao_declarado': '1.88%',
      'amarela': '0.81%',
      'indigena': '0.18%'
    }
  };

  final Map<String, Map> rendaMensal = {
    'Amazonas': {
      'a': '7.8%',
      'b': '38.11%',
      'c': '22.85%',
      'd': '8.76%',
      'e': '5.65%',
      'f': '3.38%',
      'g': '3.38%',
      'h': '2.35%',
      'i': '1.66%',
      'j': '0.99%',
      'k': '0.76%',
      'l': '0.77%',
      'm': '0.74%',
      'n': '0.69%',
      'o': '0.7%',
      'p': '0.7%',
      'q': '0.87%'
    },
    'Roraima': {
      'a': '4.66%',
      'b': '27.13%',
      'c': '21.08%',
      'd': '9.85%',
      'e': '6.57%',
      'f': '5.85%',
      'g': '5.75%',
      'h': '4.12%',
      'i': '3.35%',
      'j': '2.35%',
      'k': '1.61%',
      'l': '1.21%',
      'm': '1.2%',
      'n': '1.49%',
      'o': '1.22%',
      'p': '1.35%',
      'q': '1.22%'
    },
    'Amapá': {
      'a': '6.97%',
      'b': '36.62%',
      'c': '20.41%',
      'd': '7.1%',
      'e': '5.21%',
      'f': '3.75%',
      'g': '3.77%',
      'h': '3.55%',
      'i': '2.66%',
      'j': '1.73%',
      'k': '1.33%',
      'l': '1.06%',
      'm': '1.45%',
      'n': '1.22%',
      'o': '1.13%',
      'p': '0.93%',
      'q': '1.1%'
    },
    'Pará': {
      'a': '6.64%',
      'b': '34.98%',
      'c': '20.47%',
      'd': '8.03%',
      'e': '5.18%',
      'f': '3.92%',
      'g': '4.14%',
      'h': '3.29%',
      'i': '2.41%',
      'j': '1.38%',
      'k': '1.26%',
      'l': '1.07%',
      'm': '1.39%',
      'n': '1.34%',
      'o': '1.26%',
      'p': '1.44%',
      'q': '1.83%'
    },
    'Tocantins': {
      'a': '2.34%',
      'b': '18.91%',
      'c': '20.14%',
      'd': '11.11%',
      'e': '8.75%',
      'f': '6.14%',
      'g': '6.66%',
      'h': '5.26%',
      'i': '3.92%',
      'j': '2.38%',
      'k': '2.06%',
      'l': '1.32%',
      'm': '2.03%',
      'n': '1.9%',
      'o': '2.32%',
      'p': '2.26%',
      'q': '2.5%'
    },
    'Rondônia': {
      'a': '4.91%',
      'b': '25.83%',
      'c': '24.59%',
      'd': '10.49%',
      'e': '8.41%',
      'f': '5.29%',
      'g': '6.17%',
      'h': '3.77%',
      'i': '2.41%',
      'j': '1.46%',
      'k': '1.32%',
      'l': '0.85%',
      'm': '1.12%',
      'n': '0.87%',
      'o': '0.81%',
      'p': '0.78%',
      'q': '0.94%'
    },
    'Acre': {
      'a': '6.55%',
      'b': '36.03%',
      'c': '20.81%',
      'd': '7.86%',
      'e': '5.43%',
      'f': '3.78%',
      'g': '4.65%',
      'h': '3.17%',
      'i': '2.53%',
      'j': '1.43%',
      'k': '1.31%',
      'l': '1.16%',
      'm': '1.19%',
      'n': '1%',
      'o': '1.13%',
      'p': '0.78%',
      'q': '1.17%'
    },
    'Paraíba': {
      'a': '3.86%',
      'b': '27.07%',
      'c': '20.04%',
      'd': '9.78%',
      'e': '6.81%',
      'f': '5.14%',
      'g': '5.32%',
      'h': '3.97%',
      'i': '2.84%',
      'j': '1.86%',
      'k': '1.59%',
      'l': '1.41%',
      'm': '1.75%',
      'n': '2.11%',
      'o': '1.92%',
      'p': '2%',
      'q': '2.53%'
    },
    'Maranhão': {
      'a': '5.69%',
      'b': '35.67%',
      'c': '22.74%',
      'd': '8.23%',
      'e': '5.17%',
      'f': '3.77%',
      'g': '3.96%',
      'h': '3.12%',
      'i': '2.09%',
      'j': '1.27%',
      'k': '1.09%',
      'l': '0.9%',
      'm': '1.21%',
      'n': '1.05%',
      'o': '1.23%',
      'p': '1.13%',
      'q': '1.69%'
    },
    'Piauí': {
      'a': '5.39%',
      'b': '32.83%',
      'c': '19.36%',
      'd': '8.99%',
      'e': '5.97%',
      'f': '4.81%',
      'g': '4.66%',
      'h': '3.81%',
      'i': '2.72%',
      'j': '1.76%',
      'k': '1.3%',
      'l': '1.18%',
      'm': '1.39%',
      'n': '1.44%',
      'o': '1.38%',
      'p': '1.3%',
      'q': '1.7%'
    },
    'Ceará': {
      'a': '3.27%',
      'b': '44.3%',
      'c': '25.82%',
      'd': '6.69%',
      'e': '4.42%',
      'f': '2.41%',
      'g': '2.56%',
      'h': '1.89%',
      'i': '1.48%',
      'j': '0.93%',
      'k': '0.73%',
      'l': '0.6%',
      'm': '0.81%',
      'n': '0.93%',
      'o': '0.89%',
      'p': '0.92%',
      'q': '1.36%'
    },
    'Rio Grande do Norte': {
      'a': '3.14%',
      'b': '25.78%',
      'c': '19.58%',
      'd': '10.15%',
      'e': '6.69%',
      'f': '5.4%',
      'g': '5.99%',
      'h': '4.5%',
      'i': '3.14%',
      'j': '2.2%',
      'k': '1.54%',
      'l': '1.38%',
      'm': '1.72%',
      'n': '1.96%',
      'o': '2.01%',
      'p': '2.05%',
      'q': '2.94%'
    },
    'Pernambuco': {
      'a': '5.01%',
      'b': '29.66%',
      'c': '19.16%',
      'd': '8.31%',
      'e': '5.72%',
      'f': '4.05%',
      'g': '4.39%',
      'h': '3.56%',
      'i': '2.61%',
      'j': '1.86%',
      'k': '1.51%',
      'l': '1.21%',
      'm': '1.95%',
      'n': '2.03%',
      'o': '2.19%',
      'p': '2.52%',
      'q': '2.26%'
    },
    'Sergipe': {
      'a': '3.95%',
      'b': '27.32%',
      'c': '18.57%',
      'd': '9.7%',
      'e': '5.97%',
      'f': '5.04%',
      'g': '5.22%',
      'h': '4.39%',
      'i': '3.58%',
      'j': '2.42%',
      'k': '1.8%',
      'l': '1.36%',
      'm': '2.02%',
      'n': '2.06%',
      'o': '1.92%',
      'p': '2.09%',
      'q': '2.61%'
    },
    'Alagoas': {
      'a': '4.95%',
      'b': '31.51%',
      'c': '18.88%',
      'd': '9.6%',
      'e': '5.64%',
      'f': '4.7%',
      'g': '4.96%',
      'h': '3.96%',
      'i': '2.98%',
      'j': '1.63%',
      'k': '1.55%',
      'l': '1.18%',
      'm': '1.53%',
      'n': '1.56%',
      'o': '1.57%',
      'p': '1.65%',
      'q': '2.14%'
    },
    'Bahia': {
      'a': '4.88%',
      'b': '28.83%',
      'c': '20.31%',
      'd': '9.25%',
      'e': '6.16%',
      'f': '4.53%',
      'g': '4.93%',
      'h': '3.77%',
      'i': '2.63%',
      'j': '1.83%',
      'k': '1.41%',
      'l': '1.17%',
      'm': '1.62%',
      'n': '1.88%',
      'o': '1.79%',
      'p': '2%',
      'q': '3.01%'
    },
    'Mato Grosso': {
      'a': '1.66%',
      'b': '13.24%',
      'c': '18.5%',
      'd': '10.85%',
      'e': '9.25%',
      'f': '7.31%',
      'g': '7.51%',
      'h': '5.9%',
      'i': '4.5%',
      'j': '2.91%',
      'k': '2.04%',
      'l': '1.71%',
      'm': '2.59%',
      'n': '2.55%',
      'o': '2.48%',
      'p': '2.94%',
      'q': '4.07%'
    },
    'Mato Grosso do Sul': {
      'a': '1.1%',
      'b': '14.08%',
      'c': '21.19%',
      'd': '13.15%',
      'e': '10.09%',
      'f': '7.01%',
      'g': '7.28%',
      'h': '5.25%',
      'i': '4.07%',
      'j': '2.5%',
      'k': '2.04%',
      'l': '1.48%',
      'm': '2.4%',
      'n': '2.13%',
      'o': '1.98%',
      'p': '1.77%',
      'q': '2.5%'
    },
    'Goiás': {
      'a': '1.41%',
      'b': '13.66%',
      'c': '18.75%',
      'd': '12.06%',
      'e': '9.46%',
      'f': '7.47%',
      'g': '7.14%',
      'h': '5.59%',
      'i': '4.04%',
      'j': '2.47%',
      'k': '2.14%',
      'l': '1.62%',
      'm': '2.38%',
      'n': '2.56%',
      'o': '2.52%',
      'p': '2.67%',
      'q': '4.06%'
    },
    'São Paulo': {
      'a': '1.82%',
      'b': '9.68%',
      'c': '17.04%',
      'd': '10.75%',
      'e': '9.9%',
      'f': '7.22%',
      'g': '8.73%',
      'h': '6.26%',
      'i': '4.57%',
      'j': '2.68%',
      'k': '2.21%',
      'l': '1.8%',
      'm': '2.64%',
      'n': '2.79%',
      'o': '2.73%',
      'p': '3.13%',
      'q': '6.07%'
    },
    'Rio de Janeiro': {
      'a': '2.78%',
      'b': '15%',
      'c': '17.87%',
      'd': '10.56%',
      'e': '7.76%',
      'f': '6.47%',
      'g': '6.48%',
      'h': '5.41%',
      'i': '4.03%',
      'j': '2.71%',
      'k': '2.15%',
      'l': '1.89%',
      'm': '2.64%',
      'n': '2.77%',
      'o': '2.88%',
      'p': '3.24%',
      'q': '5.37%'
    },
    'Espírito Santo': {
      'a': '2.15%',
      'b': '13.07%',
      'c': '17.88%',
      'd': '9.9%',
      'e': '7.89%',
      'f': '6.62%',
      'g': '7.49%',
      'h': '5.41%',
      'i': '3.9%',
      'j': '2.75%',
      'k': '2.6%',
      'l': '2.16%',
      'm': '2.86%',
      'n': '3.19%',
      'o': '3.12%',
      'p': '3.43%',
      'q': '5.49%'
    },
    'Minas Gerais': {
      'a': '1.42%',
      'b': '10.43%',
      'c': '16.32%',
      'd': '10.48%',
      'e': '9.6%',
      'f': '7.08%',
      'g': '8.12%',
      'h': '6.1%',
      'i': '4.47%',
      'j': '2.85%',
      'k': '2.49%',
      'l': '2.18%',
      'm': '2.85%',
      'n': '3.1%',
      'o': '3.33%',
      'p': '3.6%',
      'q': '5.58%'
    },
    'Paraná': {
      'a': '0.94%',
      'b': '4.95%',
      'c': '11.67%',
      'd': '10.26%',
      'e': '10.17%',
      'f': '8.54%',
      'g': '10.22%',
      'h': '7.83%',
      'i': '5.95%',
      'j': '3.77%',
      'k': '3.17%',
      'l': '2.51%',
      'm': '3.49%',
      'n': '3.8%',
      'o': '3.74%',
      'p': '3.79%',
      'q': '5.19%'
    },
    'Rio Grande do Sul': {
      'a': '1.6%',
      'b': '9.8%',
      'c': '15.25%',
      'd': '10.02%',
      'e': '8.97%',
      'f': '6.9%',
      'g': '7.38%',
      'h': '6.2%',
      'i': '4.51%',
      'j': '2.81%',
      'k': '2.4%',
      'l': '2.38%',
      'm': '3.17%',
      'n': '3.57%',
      'o': '3.62%',
      'p': '4.28%',
      'q': '7.14%'
    },
    'Santa Catarina': {
      'a': '1%',
      'b': '5.56%',
      'c': '12.23%',
      'd': '9.76%',
      'e': '8.71%',
      'f': '7.32%',
      'g': '8.99%',
      'h': '6.93%',
      'i': '5.49%',
      'j': '3.63%',
      'k': '3.14%',
      'l': '3.01%',
      'm': '3.93%',
      'n': '4.13%',
      'o': '4.67%',
      'p': '5.21%',
      'q': '6.31%'
    }
  };

  final Map<String, Map> acessoInternet = {
    'Amazonas': {'sim': '73.27%', 'nao': '26.73%'},
    'Roraima': {'sim': '76.83%', 'nao': '23.17%'},
    'Amapá': {'sim': '65.22%', 'nao': '34.78%'},
    'Pará': {'sim': '70.49%', 'nao': '29.21%'},
    'Tocantins': {'sim': '84.76%', 'nao': '15.24%'},
    'Rondônia': {'sim': '77.24%', 'nao': '22.76%'},
    'Acre': {'sim': '67.25%', 'nao': '32.75%'},
    'Paraíba': {'sim': '91.17%', 'nao': '8.83%'},
    'Maranhão': {'sim': '69.91%', 'nao': '30.09%'},
    'Piauí': {'sim': '78.61%', 'nao': '21.39%'},
    'Ceará': {'sim': '67.89%', 'nao': '32.11%'},
    'Rio Grande do Norte': {'sim': '89.32%', 'nao': '10.68%'},
    'Pernambuco': {'sim': '91.42%', 'nao': '8.58%'},
    'Sergipe': {'sim': '84.4%', 'nao': '15.6%'},
    'Alagoas': {'sim': '89.66%', 'nao': '10.34%'},
    'Bahia': {'sim': '90.5%', 'nao': '9.5%'},
    'Mato Grosso': {'sim': '88.42%', 'nao': '11.58%'},
    'Mato Grosso do Sul': {'sim': '89.83%', 'nao': '10.17%'},
    'Goiás': {'sim': '90.5%', 'nao': '9.5%'},
    'São Paulo': {'sim': '93.89%', 'nao': '6.11%'},
    'Rio de Janeiro': {'sim': '92.4%', 'nao': '7.6%'},
    'Espírito Santo': {'sim': '93.82%', 'nao': '6.18%'},
    'Minas Gerais': {'sim': '93.98%', 'nao': '6.02%'},
    'Paraná': {'sim': '96.16%', 'nao': '3.84%'},
    'Rio Grande do Sul': {'sim': '92.98%', 'nao': '7.02%'},
    'Santa Catarina': {'sim': '96.3%', 'nao': '3.7%'}
  };

  @override
  void initState() {
    super.initState();
    // criar default de estados pra iniciar com os estados
    //_filteredEstados = _estados;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Análise"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Login(title: 'DataPNE')),
                );
              },
            ),
          ]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "Selecione a região e o estado para a análise:",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: buildRegionDropDown(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: buildStateDropDown(),
                ),
              ],
            ),
            buildCityInfo(),
            buildTipoEscola(),
            buildTipoEnsino(),
            buildTipoAdministracao(),
            buildTipoLocalizacao(),
            buildRaca(),
            buildRendaMensal(),
            buildAcessoInternet(),
          ],
        ),
      ),
    );
  }

  Widget buildRegionDropDown() {
    return DropdownButton<String>(
      hint: Text(
        'Região',
        style: TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
      value: selectedRegion,
      onChanged: (value) {
        setState(() {
          selectedRegion = value;
          selectedState = null;
          selectedCity = null;
        });
      },
      items: regions.map((region) {
        return DropdownMenuItem<String>(
          value: region,
          child: Text(region),
        );
      }).toList(),
    );
  }

  Widget buildStateDropDown() {
    List<String>? states =
        selectedRegion != null ? statesByRegion[selectedRegion] : [];
    return DropdownButton<String>(
      hint: Text(
        'Estado',
        style: TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
      value: selectedState,
      onChanged: (value) {
        setState(() {
          selectedState = value;
          selectedCity = null;
        });
      },
      items: states?.map((state) {
        return DropdownMenuItem<String>(
          value: state,
          child: Text(state),
        );
      }).toList(),
    );
  }

  Widget buildCityInfo() {
    Map? cityInfo =
        selectedState != null ? cityInfoByState[selectedState] : null;
    return cityInfoByState[selectedState] == null
        ? const Center(child: Text(''))
        : Column(
            children: [
              Card(
                color: Theme.of(context).colorScheme.onSecondary,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 10, right: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      Text(
                        cityInfo!['cidade'],
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Indicador da Meta 3',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(cityInfo!['percent_meta'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 38.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Nota do Enem',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(cityInfo!['nota_enem'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 38.0)),
                                        ],
                                      ),
                                    ))),
                          ])
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  Widget buildTipoEscola() {
    Map? tipoEscolaInfo =
        selectedState != null ? tipoEscola[selectedState] : null;
    return tipoEscolaInfo == null
        ? const Center(child: Text(''))
        : Column(
            children: [
              Card(
                color: Theme.of(context).colorScheme.onSecondary,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 10, right: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      Text(
                        "Tipo de Escola",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Pública',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(tipoEscolaInfo['publica'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Privada',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(tipoEscolaInfo['privada'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Não Respondeu',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(tipoEscolaInfo['nao_respondeu'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                          ])
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  Widget buildTipoEnsino() {
    Map? tipoEnsinoInfo =
        selectedState != null ? tipoEnsino[selectedState] : null;
    return tipoEnsinoInfo == null
        ? const Center(child: Text(''))
        : Column(
            children: [
              Card(
                color: Theme.of(context).colorScheme.onSecondary,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 10, right: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      Text(
                        "Tipo de Ensino",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Ensino Regular',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(tipoEnsinoInfo['regular'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Educação Especial',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(tipoEnsinoInfo['especial'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                          ])
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  Widget buildTipoAdministracao() {
    Map? tipoAdministracaoInfo =
        selectedState != null ? tipoAdministracao[selectedState] : null;
    return tipoAdministracaoInfo == null
        ? const Center(child: Text(''))
        : Column(
            children: [
              Card(
                color: Theme.of(context).colorScheme.onSecondary,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 10, right: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      Text(
                        "Tipo de Administração",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Federal',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(tipoAdministracaoInfo['federal'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Estadual',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(
                                              tipoAdministracaoInfo['estadual'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Municipal',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(
                                              tipoAdministracaoInfo[
                                                  'municipal'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Privada',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(tipoAdministracaoInfo['privada'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                          ])
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  Widget buildTipoLocalizacao() {
    Map? tipoLocalizacaoInfo =
        selectedState != null ? tipoLocalizacao[selectedState] : null;
    return tipoLocalizacaoInfo == null
        ? const Center(child: Text(''))
        : Column(
            children: [
              Card(
                color: Theme.of(context).colorScheme.onSecondary,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 10, right: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      Text(
                        "Tipo de Localização",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Rural',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(tipoLocalizacaoInfo['rural'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Urbana',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(tipoLocalizacaoInfo['urbana'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                          ])
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  Widget buildRaca() {
    Map? racaInfo = selectedState != null ? raca[selectedState] : null;
    return racaInfo == null
        ? const Center(child: Text(''))
        : Column(
            children: [
              Card(
                color: Theme.of(context).colorScheme.onSecondary,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 10, right: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      Text(
                        "Raça",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Parda',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(racaInfo['parda'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Branca',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(racaInfo['branca'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Preta',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(racaInfo['preta'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Amarelo',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(racaInfo['amarela'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Indígena',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(racaInfo['indigena'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Não Declarado',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(racaInfo['nao_declarado'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                          ])
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  Widget buildRendaMensal() {
    Map? rendaMensalInfo =
        selectedState != null ? rendaMensal[selectedState] : null;
    return rendaMensalInfo == null
        ? const Center(child: Text(''))
        : Column(
            children: [
              Card(
                color: Theme.of(context).colorScheme.onSecondary,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 10, right: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      Text(
                        "Renda Mensal da Família",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Nenhuma Renda',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(rendaMensalInfo['a'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Até R\$ 1100.0",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(rendaMensalInfo['b'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'De R\$ 1100.1 até R\$ 1650.0',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(rendaMensalInfo['c'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'De R\$ 1650.1 até R\$ 2200.0',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(rendaMensalInfo['d'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'De R\$ 2200.1 até R\$ 2750.0',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(rendaMensalInfo['e'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'De R\$ 2750.1 até R\$ 3300.0',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(rendaMensalInfo['f'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'De R\$ 3300.1 até R\$ 4400.0',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(rendaMensalInfo['g'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'De R\$ 4400.1 até R\$ 5500.0',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(rendaMensalInfo['h'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'De R\$ 5500.1 até R\$ 6600.0',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(rendaMensalInfo['i'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'De R\$ 6600.1 até R\$ 7700.0',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(rendaMensalInfo['j'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'De R\$ 7700.1 até R\$ 8800.0',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(rendaMensalInfo['k'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'De R\$ 8800.1 até R\$ 9900.0',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(rendaMensalInfo['l'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'De R\$ 9900.1 até R\$ 11000.0',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(rendaMensalInfo['m'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'De R\$ 11000.1 até R\$ 13200.0',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(rendaMensalInfo['n'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'De R\$ 13200.1 até R\$ 16500.0',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(rendaMensalInfo['o'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'De R\$ 16500.1 até R\$ 22000.0',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(rendaMensalInfo['p'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Acima de R\$ 22000.0',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(rendaMensalInfo['q'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                          ]),
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  Widget buildAcessoInternet() {
    Map? acessoInternetInfo =
        selectedState != null ? acessoInternet[selectedState] : null;
    return acessoInternetInfo == null
        ? const Center(child: Text(''))
        : Column(
            children: [
              Card(
                color: Theme.of(context).colorScheme.onSecondary,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 10, right: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      Text(
                        "Acesso à Internet",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Sim',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(acessoInternetInfo['sim'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                            Flexible(
                                child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Não',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          ),
                                          Text(acessoInternetInfo['nao'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0)),
                                        ],
                                      ),
                                    ))),
                          ])
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}
