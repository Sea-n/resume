#import "template.typ": *

#show: resume.with(
  author: (
      firstname: "Shao-Fu",
      lastname: "Chen",
      email: "leo881003@gmail.com",
      phone: "<REDACTED>",
      github: "Leo1003",
      linkedin: "少甫-陳-3b0b3a20a",
      positions: (
        "Aaaaaaaa Aaaaaaaa",
        "Aaaa Aaaaa Aaaaaaaaa",
      )
  ),
)

#let sidebar_content = [
  #resume_section("Skills")
  #skill_item(
    "Programming Language",
    (
      strong[Rust],
      strong[C],
      strong[Bash],
      "C++",
      "Python",
      "ECMAScript",
    )
  )
  #skill_item_list(
    "Technologies",
    (
      strong[Kubernetes],
      strong[Linux],
      strong[Git],
      strong[Ansible],
      "OpenSearch",
      "Flux CD",
      "Dockerfile",
      "GitLab CI",
      "GitHub Actions",
      "Prometheus",
      "Thanos",
    )
  )
  #skill_item_list(
    "Concepts",
    (
      strong[High Availability],
      strong[Object-Oriented Programming],
      strong[Container],
      "Operating System",
      "Infrastructure as Code",
      "DevOps",
      "Monitoring",
      "Public Key Infrastructure",
    )
  )
]

#let main_content = [
  #resume_section("Experience")
  #work_experience_item_header(
    "Information Technology Center",
    "Department of CS, NYCU",
    "Infrastructure Engineer",
    "May. 2020 - Now",
  )
  #resume_item[
    - Build logs management system with OpenSearch, Vector, and Fluent Bit.
    - Redesign Kubernetes IaC with Flux CD and Ansible.
    - Manage high availability OpenLDAP cluster.
  ]

  #resume_section("Education")
  #education_item[
    National Yang Ming Chiao Tung University
  ][
    Institute of Computer Science and Engineering
  ][
    Master of Science
  ][
    Aug. 2022 - Now
  ]

  #education_item[
    National Yang Ming Chiao Tung University
  ][
    Department of Computer Science
  ][
    Bachelor of Science
  ][
    Aug. 2018 - Jul. 2022
  ]

]

#grid(
  columns: (1fr, 2fr),
  column-gutter: 1em,
  sidebar_content,
  main_content,
)
