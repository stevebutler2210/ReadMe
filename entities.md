```mermaid
---
title: Draft ReadMe App Entities
---
erDiagram
  User ||--o{ ReadingListItem : hasManyBooksThrough
  Book ||--o{ ReadingListItem : hasManyUsersThrough
  Club }o--o{ User : members
  Club }o--|| Cycle : activeCycle
  Nomination ||--|| Book : has
  Nomination ||--|| Cycle : has
  Nomination ||--|| User : has
  Vote ||--|| Book : has
  Vote ||--|| Cycle : has
  Vote ||--|| User : has

  User {
    UUID id
    string email
    string encrypted_password
    timestamp created_at
    timestamp updated_at
  }

  Book {
    UUID id
    string external_id
    string title
    string[] authors
    string thumbnail_url
  }

  Club {
    UUID id
    string name
  }

  Cycle {
    UUID id
    enum phase
  }

  ReadingListItem {
    UUID id
    UUID book_id
    UUID user_id
    enum status
  }
```
