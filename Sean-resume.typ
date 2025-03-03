#import "template.typ": *

#show: resume.with(
  author: (
      firstname: "Sean",
      lastname: "Wei",
      mandarinname: "韋詠祥",
      email: "me@sean.taipei",
      phone: "+1 (784) 432-1575",
      github: "Sea-n",
      linkedin: "sean64",
      site: "sean.cat/about",
      positions: (
        "IT Volunteer for Taiwan ICDF in Saint Vincent",
      )
  ),
)

#let sidebar_content = [
  #resume_section("Summary")

  #resume_summary[
    Software engineer with #strong[algorithmic excellence] (LeetCode Top 1.5% rated), #strong[cybersecurity expertise] (CEH certified), and #strong[networking proficiency] (course speaker).
  ]



  #resume_section("Education")

  #education_item[
    National Yang Ming Chiao Tung University
  ][
    Master of Computer Science
  ][
    Sep 2023 - Jun 2024 (On Hold)
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
      - LeetCode: Rating 2100+ (#strong[Top 1.5%]), solved #strong[100+ Hard-level] problems.
      - Public Speaking: Delivered #strong[30+ technical talks] at conferences and schools.
      - GitHub: #strong[300 PRs, 500+ followers], earned 750+ stars.
    ]
  )

  #skill_item_body(
    "Certifications",
    [
      - #strong[CEH] (Certified Ethical Hacker)
      - ISC2 CC (Certified in Cybersecurity)
      - IELTS Score 6.0
    ]
  )

  #skill_item(
    "Programming Languages",
    (
      strong[C/C++],
      strong[Bash],
      strong[PHP (Laravel)],
      "Vue.js",
      "Python (Django, Flask)",
      "JavaScript",
      "Node.js",
      "Java",
      "Verilog",
      "Qt",
      "Perl",
    )
  )

  #skill_item(
    "Technologies",
    (
      strong[Linux],
      strong[Git],
      "SQL",
      "Docker",
      "OAuth",
      "Kubernetes",
      "Pthreads",
      "AWK",
      "Postfix",
      "Cisco IOS",
      "Juniper JunOS",
      "VyOS",
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
    - Wrote an automated tool using #strong[Selenium] to configure #strong[100+ CCTV cameras], reducing setup time by #strong[40%].
    - Collaborated with #strong[Taiwanese provider] and #strong[local government] to ensure seamless integration of surveillance infrastructure.
    - Performed #strong[cybersecurity assessments] and compiled technical documentation for #strong[network security policies].
  ]

  #work_experience_item_header(
    "SITCON",
    "Students’ Information Technology Conference",
    "Agenda Team Lead",
    "Jan 2022 – Mar 2024",
  )
  #resume_item[
    - Defined the key focus area for the conference, attended by #strong[1000+ participants].
    - Delivered a talk on #strong[parallel programming] to 300+ students.
    - Reviewed and provided feedback for #strong[100+ session submissions].
    - Organized mock presentations, improving session quality for #strong[140%] of presentations.
  ]

  #work_experience_item_header(
    "IT Center of NYCU CS",
    "",
    "Course Speaker, Network Team, Web Team",
    "Sep 2020 – Jun 2024",
  )
  #resume_item[
    - Taught 9 courses to #strong[100+ students], including #strong[OSPF], RIP, #strong[LACP], FHRP, VyOS.
    - Used #strong[Kubernetes] to deploy and debug #strong[Laravel] services.
  ]



  #resume_section("Personal Project")

  #personal_project_item_header(
    "Anonymous Page for NCTU",
    "Feb 2020 - Jul 2022",
    project_link: github_project_link("Sea-n/xNCTU"),
  )
  #resume_item[
    - Developed an #strong[anonymous content submission] platform with #strong[OAuth authentication].
    - Automatically processed #strong[8,000+ submissions] with a #strong[98%+ accuracy rate].
    - Integrated with #strong[3 login methods] and #strong[5 social media platforms].
  ]

  #personal_project_item_header(
    "URL Shortener",
    "Sep 2019 - Present",
    project_link: github_project_link("Sea-n/tgpe"),
  )
  #resume_item[
    - Developed a #strong[Telegram Bot] for URL shortening, generating #strong[over 25,000 links] for more than #strong[1,000 users].
    - Implemented #strong[blacklist and abuse detection] system, handling #strong[1,000+ malicious links].
  ]

  #personal_project_item_header(
    "GSAT Filter",
    "Jun 2018 - Feb 2023",
    project_link: github_project_link("Sea-n/gsat"),
  )
  #resume_item[
    - Designed a #strong[university selection tool] based on Taiwan’s GSAT criteria.
    - Assisted #strong[200,000+ students] in its first year, sustaining #strong[2,000+ organic clicks per month].
  ]
]

#grid(
  columns: (3fr, 5fr),
  column-gutter: 1em,
  sidebar_content,
  main_content,
)
