# UI Page Specification Template

Use this structure for every distinct screen, modal, or major view.

## Screen: <Name>

**Route / Identifier**: `/projects/:id` or `Modal: CreateTask`

**Purpose**: one sentence describing why this screen exists

**Primary user & job**: who uses it and what they are trying to accomplish

**Entry points**:
- From ProjectList → click project card
- Direct URL
- After successful create → redirect here

**Layout**:
- Top nav: global
- Left sidebar: project navigation (active: Overview)
- Main content: ...
- Right panel (optional): activity feed

**Content blocks** (top to bottom or left to right):
1. Header — project name + status badge + primary actions (Edit, Share)
2. Stats row — 3 metric cards
3. Main list / table / form
4. ...

**Data displayed** (exact fields):
- Project.name
- Project.status
- Task.title, Task.assignee.avatar, Task.due_date
- ...

**Interactive elements**:
| Element              | Type     | Behavior / Result                          |
|----------------------|----------|--------------------------------------------|
| "New Task" button    | primary  | Opens CreateTask modal                     |
| Task row             | click    | Navigates to TaskDetail                    |
| Status dropdown      | select   | Optimistic update + toast on success/fail  |
| ...                  | ...      | ...                                        |

**States**:
- Loading: skeleton matching the layout
- Empty: illustration + "No tasks yet" + CTA
- Error: inline banner with retry
- Success feedback: toast or inline confirmation

**Permissions**:
- Viewer: read-only
- Editor: can create/edit tasks
- Admin: can delete project

**Responsive notes**:
- Mobile: sidebar becomes bottom sheet, stats become horizontal scroll
- Tablet: ...

**Accessibility**:
- Focus order follows visual order
- Status changes announced via live region

**Navigation map**:
- ← back to ProjectList
- → TaskDetail
- → Settings (project)

**Open questions / unresolved**:
- (should be empty by freeze time)
