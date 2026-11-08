# Votre modèle local avec ShaetherLm et BeeLlama

Ce kit prépare BeeLlama et le modèle Qwen3.8-27B utilisé avec ShaetherLm. Vous choisissez un dossier, le kit récupère les fichiers et les vérifie. ShaetherLm se charge ensuite de démarrer le moteur.

**Profil NVIDIA 16 Go — Windows 10/11 64 bits.** BeeLlama 0.4.9, CUDA 13.3, modèle hybride IQ4_XS / IQ3_S de 13,54 Go, modèle de conversation Sharp v22.4.0. Versions figées pour une installation reproductible ; pas de mise à jour silencieuse.

## Pack optionnel conseillé — 16 Go de VRAM + 32 Go de RAM

Ce pack accompagne ShaetherLm pour profiter d'un agent local avec **BeeLlama + Qwen3.8-27B**, sans commandes à recopier. Il reste facultatif : vous pouvez utiliser Ollama ou une API.

**Retour d'utilisation de Séb :** sur une **RTX 5070 Ti 16 Go avec 32 Go de RAM**, environ **30 tokens/s en moyenne**, avec un contexte utilisé jusqu'à environ **93 000 tokens**. Ces chiffres décrivent son expérience sur cette configuration, pas une limite du modèle ni une vitesse garantie pour tous les GPU de 16 Go. Commencez avec 64K, puis essayez 90K (92 160 tokens) après un premier essai stable.

## Avant de commencer

- Carte NVIDIA avec 16 Go de VRAM : profil de départ, pas une garantie pour tous les GPU. La génération du GPU, son pilote et la mémoire déjà occupée comptent aussi. Ce kit CUDA n'est pas destiné aux cartes AMD/Intel.
- Pilote NVIDIA récent compatible avec CUDA 13.3. Le kit fournit les bibliothèques CUDA nécessaires, mais n'installe ni pilote ni CUDA Toolkit.
- **32 Go de RAM recommandés** pour garder de la marge ; la mémoire système ne remplace pas la VRAM.
- **25 Go libres sur un disque local**, de préférence SSD. Environ 14,6 Go à télécharger. Les archives téléchargées restent dans `.downloads` pour faciliter une reprise.
- Fermez les logiciels qui consomment beaucoup de VRAM. Pour le premier essai, évitez de charger un autre modèle en parallèle.

## 1. Préparer le moteur

1. Décompressez entièrement le ZIP du kit dans un dossier. Ne lancez pas les fichiers depuis l'intérieur du ZIP.
2. Ouvrez **INSTALL.cmd**. Une fenêtre de suivi apparaît.
3. Choisissez un dossier vide, par exemple `C:\AI\BeeLlama-0.4.9`. Appuyez sur Entrée pour accepter le dossier proposé dans votre profil Windows. Évitez un dossier synchronisé OneDrive ou un partage réseau.
4. Vérifiez la carte affichée, puis tapez **O** pour confirmer le téléchargement.
5. Si vous possédez déjà exactement le GGUF indiqué plus haut, donnez son chemin pour le copier ; sinon appuyez sur Entrée pour le télécharger. Un autre modèle ne sera pas accepté par ce kit.
6. Attendez le message de vérification réussie. Le calcul de l'empreinte du GGUF peut prendre un moment.

Aucun compte administrateur ni Python n'est nécessaire. Le lanceur autorise son script PowerShell pour cette exécution seulement ; il ne change pas les règles permanentes de Windows. Respectez les restrictions de votre organisation si un poste est administré.

En cas de coupure réseau, relancez INSTALL et indiquez **le même dossier** : les fichiers complets sont vérifiés et les téléchargements partiels peuvent reprendre. Si l'intégrité est refusée, ne lancez pas le fichier concerné ; supprimez uniquement son téléchargement incomplet `.part` indiqué dans l'erreur, puis recommencez. Un dossier contenant une installation étrangère au kit est refusé.

## 2. Connecter ShaetherLm

1. Ouvrez **Settings**, puis choisissez le backend **BeeLlama** dans Connection.
2. Dans l'onglet **BeeLlama**, renseignez **BeeLlama folder** avec le dossier choisi à l'étape précédente — celui contenant `beellama`, `models` et `chat_template.jinja`.
3. Réglez **Context sur 64K (65 536 tokens)** et laissez **MTP désactivé** pour commencer.
4. Cliquez sur **Save & Apply**, puis attendez le chargement.
5. Envoyez un court message et vérifiez qu'une réponse arrive. Vous pouvez ensuite demander la date pour essayer un outil.

ShaetherLm démarre son serveur sur **127.0.0.1:11435**, accessible localement. N'ouvrez pas un second serveur à la main. Ollama utilise normalement un autre port, mais un modèle Ollama encore chargé peut occuper la VRAM.

Le fichier `CONNECT_TO_SHAETHERLM.txt` créé dans votre dossier rappelle le chemin exact. Le kit ne modifie pas le JSON de ShaetherLm et ne touche pas à ses conversations ou à ses mémoires.

## 3. Ajuster le contexte

| Réglage | Utilisation |
|---|---|
| 32K | Repli si 64K ne tient pas dans la VRAM disponible. |
| **64K** | Point de départ conseillé pour ce kit. |
| **90K** | À essayer après un chargement réussi et une utilisation stable. |

Dans ShaetherLm, 1K = 1 024 tokens : 90K correspond à 92 160 tokens. Un grand contexte utilise davantage de mémoire et ne rend pas le modèle plus rapide. Le réglage **Max response tokens** est distinct : il limite la longueur de chaque réponse et de son raisonnement.

L'application utilise Flash Attention, KVarN5 pour le cache K, KVarN4 pour V et une fin de cache de précision supérieure de 1 024 tokens. Ces paramètres sont déjà gérés par ShaetherLm : aucun copier-coller de commande n'est nécessaire.

## Si quelque chose ne démarre pas

- **Pilote NVIDIA non détecté** : installez ou réparez le pilote officiel, puis relancez le kit.
- **DLL manquante / incompatibilité CUDA** : vérifiez la compatibilité du pilote avec CUDA 13.3 ; ne téléchargez pas des DLL sur des sites tiers.
- **Mémoire GPU insuffisante** : fermez les autres consommateurs de VRAM, puis essayez 32K dans Settings.
- **Téléchargement impossible** : vérifiez votre connexion et l'accès à GitHub et Hugging Face. Le kit ne demande aucun jeton d'accès.
- **Dossier déjà rempli** : choisissez un nouveau dossier vide. Le kit ne remplace pas une installation existante.

**VERIFY.cmd** vérifie les empreintes du modèle et du template, puis le démarrage de l'exécutable. Il ne charge pas les poids et ne mesure pas les performances : le vrai essai de chargement se fait dans ShaetherLm.

## Provenance et diffusion

Le ZIP ne contient ni moteur, ni modèle, ni données personnelles. Les téléchargements sont réalisés depuis leurs dépôts officiels et vérifiés par SHA-256. Les licences de chaque composant restent applicables : voir **SOURCES.md**. Le kit d'accompagnement est distribué avec la licence Freeware de ShaetherLm fournie dans ce dossier.

Version du kit : 1.0 — références vérifiées le 7 novembre 2026. L'ensemble moteur/modèle/template correspond au profil utilisé sur la machine de référence ; le fonctionnement sur votre propre matériel doit être vérifié.
