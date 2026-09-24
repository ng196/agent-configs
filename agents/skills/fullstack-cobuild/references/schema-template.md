# Schema Documentation Template

Use this exact structure when presenting the database schema to the user.

## Entity: <Name>

**Purpose**: one sentence

**Table name**: `snake_case_plural`

| Column          | Type          | Nullable | Default     | Notes / Constraints                  |
|-----------------|---------------|----------|-------------|--------------------------------------|
| id              | uuid / bigint | no       | gen_random  | Primary key                          |
| ...             | ...           | ...      | ...         | ...                                  |
| created_at      | timestamptz   | no       | now()       |                                      |
| updated_at      | timestamptz   | no       | now()       |                                      |

**Indexes**:
- `idx_<table>_<cols>` on (col1, col2) — reason

**Unique constraints**:
- unique (col1, col2) — reason

**Relationships**:
- belongs_to :parent (FK parent_id → parents.id, on_delete: cascade)
- has_many :children
- has_and_belongs_to_many :tags through :taggings

**Soft delete**: yes / no (deleted_at column)

**Ownership / tenancy**: owned by user_id / organization_id / global

**Expected cardinality notes**: e.g. "average 12 items per user, peak 500"

**Query patterns that matter**:
- List by owner ordered by created_at desc
- Find by slug within organization
- Full-text search on title + body

---

Repeat the block for every entity. After all entities, add a short "Relationship Graph" section in textual form:

```
User 1──* Project 1──* Task *──1 Status
Project *──* Tag
```
