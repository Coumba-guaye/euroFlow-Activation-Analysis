## NeuroFlow AI — Product Activation & Conversion Analysis

### Contexte
NeuroFlow AI est une plateforme SaaS B2B basée sur l’IA. Malgré une acquisition correcte, la conversion vers les plans payants reste limitée.

Objectif : identifier où se situe la perte dans le parcours utilisateur (signup → activation → conversion payante) et proposer des leviers produit.

---

### Stack
- SQL (DuckDB) : extraction, jointures, KPI
- Python (Pandas, Matplotlib) : Time to First Value & analyses comportementales
- Tableau : dashboard exécutif (funnel, KPI, distribution)

---

### Résultats clés
- Conversion globale : **20,36 %**
- Activation rate (first_value) : **34,76 %**
- Conversion utilisateurs activés : **29,29 %**
- Conversion utilisateurs non activés : **15,06 %**
- Time to First Value moyen : **8,77 jours** (médiane : **9 jours**)

---

### Insight principal
L’activation produit est le levier majeur de conversion : un utilisateur activé convertit ~2x plus.
La priorité business est d’augmenter le taux d’activation et de réduire la friction pour atteindre la first value.

---

### Recommandations
- Simplifier l’onboarding et réduire le “time-to-value”
- Nudges (emails/in-app) dans les 3 premiers jours
- Mise en avant automatique des features clés
- Parcours guidé selon le segment (freelancer / SMB / mid-market)

---

### Contenu du repo
- `sql/` : scripts d’import + KPI (conversion, activation, funnel, cohortes)
- `python/` : notebook d’analyse Time to First Value
- `dashboard/` : screenshot du dashboard Tableau (à ajouter)
