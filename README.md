# README

Pour ajouter un edge case scenario, je me suis permis de modifier vos specs.
Pour verifier que vos tests originaux passent, veuillez regarder le [PRECEDENT COMMIT](https://github.com/GuillaumeOcculy/argus_test/tree/61f196d15b33b29968493c728d26fe72d19aa8af).

### Mon edge case: Un Rider plus loin mais plus rapide

Au lieu d'attribuer une route au rider le plus proche du restaurant, je l'assigne à celui qui effectuera le trajet complet le plus rapidement possible.

Ex: 

  -  Rider1 (ayant un velo) est à 10 km du restaurant.

  -  Rider3 (ayant un scooter) est à 11km du restaurant.

  -  Le Rider1 est le plus proche mais le Rider3 arrivera en premier.
