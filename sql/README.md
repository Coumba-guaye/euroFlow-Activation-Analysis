# NeuroFlow AI — Analyse Activation & Conversion Produit

## 📈 Impact Business

Simulation :  
Une augmentation du taux d’activation de 35 % à 45 % pourrait générer une hausse significative du chiffre d’affaires mensuel récurrent (MRR).

L’activation représente le levier stratégique prioritaire.
## Objectif

Analyser le parcours utilisateur d’une plateforme SaaS B2B afin d’identifier les leviers d’amélioration de la conversion (gratuit → payant).

---

## Problématique

Malgré un bon volume d’inscriptions, le taux de conversion vers les plans payants reste limité.

Questions clés :

- Où se situe la perte principale dans le funnel ?
- L’activation produit influence-t-elle la conversion ?
- Le délai d’activation a-t-il un impact sur la performance business ?

---

## Stack Technique

- **SQL (DuckDB)** : extraction, jointures, KPI, funnel
- **Python (Pandas, Matplotlib)** : analyse comportementale (Time To First Value)
- **Tableau** : dashboard exécutif et visualisation stratégique

---

## 📊 Résultats Clés

- Taux de conversion global : **20,36 %**
- Taux d’activation (first_value) : **34,76 %**
- Conversion utilisateurs activés : **29,29 %**
- Conversion utilisateurs non activés : **15,06 %**
- Time To First Value moyen : **8,77 jours**
- Médiane : **9 jours**
- 59 % des utilisateurs atteignent la valeur après 7 jours

---

## Insight Principal

L’activation produit est le principal levier de conversion.

Un utilisateur activé convertit presque **2 fois plus** qu’un utilisateur non activé.

Le problème prioritaire n’est pas la vitesse d’activation, mais le fait que **65 % des utilisateurs n’atteignent jamais la first value**.

---

## Recommandations Business

- Simplifier l’onboarding
- Réduire la friction d’accès aux fonctionnalités clés
- Mettre en place des nudges dans les 3 premiers jours
- Personnaliser le parcours selon le segment utilisateur

---

## 📁 Structure du Projet

- `dashboard/` : screenshot du dashboard Tableau (à ajouter)
