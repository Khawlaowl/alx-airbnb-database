<<<<<<< HEAD
# Normalization Steps
=======
# Entity-Relationship Diagram (ERD)

## Description
Ce fichier contient le diagramme entité-relation pour le projet AirBnB.

## Entités et Attributs
- **User** :
  - `user_id` (Primary Key)
  - `first_name`, `last_name`
  - `email` (Unique), `password_hash`
  - `phone_number`, `role`
  - `created_at`
  
- **Property** :
  - `property_id` (Primary Key)
  - `host_id` (Foreign Key → User.user_id)
  - `name`, `description`
>>>>>>> 6a8b57e15ddd7bbd7814a33316a34a335ce916c7
