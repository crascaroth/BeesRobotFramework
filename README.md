
## Infelizmente o Site que escolhi para desenvolver tem um problema que nao consegui solucionar, um Footer que aparece quando ocorre a automatização, tem q ser clicado manualmente para desaparecer

[image](https://user-images.githubusercontent.com/74428545/169338341-20cf11c4-1831-4b06-91a9-497e3198a13d.png)


Teste da API
| Tipo Requisição | Endpoint                                   |
|-----------------|--------------------------------------------|
| GET             | https://api.petfinder.com/v2/organizations |
| Testes          | Casos de Teste                             |
| name            | Organização Existente                      |
|                 | Organização Inexistente                    |
| location        | Cidade Existente                           |
|                 | Cidade Inexistente                         |
|                 | Estado Existente                           |
|                 | Estado Inexistente                         |
|                 | Latitude e Longitude                       |
|                 | Postal Code                                |
| distance        | Distancia Negativa                         |
|                 | Distancia Zero                             |
|                 | Distancia Default                          |
|                 | Distancia 500                              |
|                 | Distancia 500+                             |
| state           | Estado Existente                           |
|                 | Estado Vazio                               |
|                 | Estado com uma Letra                       |
|                 | Estado com mais de Duas Letras             |
|                 | Estado inexistente                         |
| country         | País Existente                             |
|                 | País Vazio                                 |
|                 | País com uma Letra                         |
|                 | País com mais de Duas Letras               |
|                 | País inexistente                           |
| query           | Pesquisa por sinonimos                     |
|                 | pontuação diferenciada mas que exista      |
|                 | Algo que não exista                        |
| sort            | -distance                                  |
|                 | -name                                      |
|                 | -country                                   |
|                 | -state                                     |
| limit           | Limite Negativa                            |
|                 | Limite Zero                                |
|                 | Limite Default                             |
|                 | Limite 100 500                             |
|                 | Limite 100+                                |
| page            | Negativo                                   |
|                 | Zero                                       |
|                 | Default                                    |
|                 | Valor elevado (100)                        |              
