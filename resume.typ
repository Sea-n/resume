#import "template.typ": *
#import "secrets.typ": secret

#show: resume.with(
  author: (
      firstname: "Sean",
      lastname: "Wei",
      chinesename: "韋詠祥",
      email: "me@sean.taipei",
      phone: secret("phone"),
      github: "Sea-n",
      linkedin: "sean64",
      positions: (
        "IT Volunteer for Taiwan ICDF at Saint Vincent",
      )
  ),
)

#let sidebar_content = [
  #resume_section("Summary")

  #resume_summary[
    Results-driven Computer Science graduate with strong software development and algorithmic problem-solving skills (LeetCode top 1.4%). Experienced in leading technical teams and open-source contributions (300+ PRs, 750+ stars). Combines hands-on project experience in web application development with community leadership at major tech conferences. Passionate about creating scalable solutions and optimizing performance, seeking to leverage technical expertise as a Software Engineer to drive innovation and solve complex problems.
  ]

  #resume_section("Education")
  #education_item[
    National Yang Ming Chiao Tung University
  ][
    Master of Computer Science and Engineering
  ][
    Sep 2023 - Jun 2024 (Suspended)
  ]

  #education_item[
    National Chiao Tung University
  ][
    Bachelor of Computer Science
  ][
    Sep 2019 - Jun 2023
  ]

  #resume_section("Skills")

  #skill_item_body(
    "Achievements",
    [
      - LeetCode: Rating 2120 (Top #strong[1.4%]), solved #strong[100+ Hard] problems
      - GitHub: #strong[300 PRs, 500+ followers, 750+ stars earned]
      - Public Speaking: Delivered #strong[25+ technical talks] at conferences and schools
    ]
  )

  #skill_item_body(
    "Certifications",
    [
      - #strong[CEH] (Certified Ethical Hacker)
      - ISC2 CC (Certified in Cybersecurity)
      - EMT-1 (Emergency Medical Technician)
      - IELTS 6.0
    ]
  )

  #skill_item(
    "Technologies",
    (
      strong[Linux],
      strong[Git],
      "SQL",
      "Docker",
    )
  )

  #skill_item(
    "Programming Languages",
    (
      strong[Bash],
      strong[C/C++],
      "Python",
      "PHP",
    )
  )
]

#let main_content = [
  #resume_section("Experience")
  #work_experience_item_header(
    "Taiwan ICDF",
    "International Cooperation and Development Fund",
    "IT Volunteer (Saint Vincent)",
    "Nov 2024 – Jul 2025",
  )
  #resume_item[
    - Deployed and configured #strong[100+ CCTV cameras] using an automated setup tool, reducing manual effort by #strong[40%].
    - Collaborated with #strong[Taiwanese vendors] and #strong[local government] to ensure seamless integration of surveillance infrastructure.
    - Conducted #strong[cybersecurity assessments] and organized technical documentation for #strong[drone specifications] and #strong[network security policies].
  ]
  #work_experience_item_header(
    "SITCON",
    "Students’ Information Technology Conference",
    "Agenda Team Lead",
    "Jan 2022 – Mar 2024",
  )
  #resume_item[
    - Defined the conference theme and key focus areas, attracting #strong[1000+ participants].
    - Delivered a talk on #strong[parallel programming optimization], video recording viewed by 300+ students.
    - Reviewed and provided feedback for 50+ student session submissions.
    - Organized keynote and panel, invited 10+ industry experts and researchers.
    - Organized mock presentations, improving session quality for #strong[140%] of presentations.
  ]

  #resume_section("Personal Project")
  #personal_project_item_header(
    "Anonymous Page for NCTU",
    "Feb 2020 - Jul 2022",
    project_link: github_project_link("Sea-n/xNCTU"),
  )
  #resume_item[
    - Developed an #strong[anonymous content submission] platform with #strong[OAuth authentication].
    - Processed #strong[8,000+ submissions] automatically with a #strong[98%+ accuracy rate].
    - Integrated with #strong[3 login methods] and #strong[5 social media platforms].
  ]

  #personal_project_item_header(
    "URL Shortener",
    "Sep 2019 - Present",
    project_link: github_project_link("Sea-n/tgpe"),
  )
  #resume_item[
    - Built a #strong[Telegram Bot] for URL shortening, generating #strong[25,000+ links] for #strong[5,000+ users].
    - Implemented #strong[blacklist and abuse detection], handling #strong[1,000+ malicious links].
  ]

  #personal_project_item_header(
    "GSAT Filter",
    "Jun 2018 - Feb 2023",
    project_link: github_project_link("Sea-n/gsat"),
  )
  #resume_item[
    - Designed a #strong[university selection tool] based on Taiwan’s GSAT criteria.
    - Assisted #strong[200,000+ students] in its first year, sustaining #strong[2,000+ organic clicks/month].
  ]
]

#grid(
  columns: (3fr, 5fr),
  column-gutter: 1em,
  sidebar_content,
  main_content,
)
