**Presentation Evaluation Platform (Ruby on Rails)**

**Project Description:**
- This is a presentation feedback platform designed for classroom use. It supports two roles: Instructors and Students.

- Instructors can create events (presentations), assign student presenters, assign grades, and view all submitted evaluations.

- Students can submit evaluations for presentations they did not participate in and view comments received as presenters.

- Once a student submits an evaluation, the form disappears from their dashboard.

**Roles & Permissions**

Instructors/Admins:

- Log in via brutus@osu.edu or ta@osu.edu 
  - *Use "password" as the password for all accounts*

- Create events (date optional)

- Assign student presenters

- View audience-submitted evaluations on their dashboard
- Assign grades to student presentations

Students:

- Log in with:

  - alice@osu.edu, bob@osu.edu, carol@osu.edu, dave@osu.edu, eve@osu.edu, frank@osu.edu, grace@osu.edu, heidi@osu.edu, ivan@osu.edu, judy@osu.edu
    - *Use "password" as the password for all accounts*

- Presenters can view feedback from the audience and the grade they received from the instructor

- Audience members can submit evaluations

- Students cannot self-evaluate

- Completed evaluations disappear from their feed


**Evaluation Criteria**

Audience members (students not presenting) can rate presenters on:

- Clarity (1–5)

- Organization (1–5)

- Technical Content (1–5)

- Comments (text field)

- Evaluations are stored and visible to instructors and presenters.

**Features**
- Role-Based Access via Devise and CanCanCan

- Instructor Dashboard:
    - Create events
    - Assign presenters
    - View feedback for all presentations
      - Assign Grades

- Student Dashboard:
  - View upcoming evaluation forms (for non-presenters only)
  - View received feedback and grade if they were a presenter
  - Evaluation forms disappear once completed
  - Validation: No self-evaluation allowed

**Technologies Used**
- Ruby on Rails

- Devise (Authentication)

- CanCanCan (Authorization)

- PostgreSQL / SQLite (Development DB)

- HTML & CSS for views


**How to Run**
Clone the repo:

- git clone https://github.com/CSE3901-SP25-11309/project4-group2.git
- cd instructor_webpage
- bundle install
- rails db:migrate
- rails db:seed (allows the premade emails and presenter data to work)
- rails server
- Visit http://localhost:3000 in your browser
- Log in using one of the student/instructor emails above
