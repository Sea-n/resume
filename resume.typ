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
      "Jsonnet",
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
  #skill_item_list(
    "Languages",
    (
      "Chinese: Native",
      "English: Advanced",
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
    - #strong[Build logs management system with OpenSearch, Vector, and Fluent Bit.]

      Write Ansible playbook to automate the deploy process, and to automatically rolling upgrade
      the cluster to prevent downtime.

    - #strong[Build metrics monitoring system with Prometheus, Thanos, and Grafana.]

      In order to monitor multiple Kubernetes cluster, introducing Thanos to provide the ability to
      query across different cluster and long term metric storage.

    - #strong[Redesign Kubernetes IaC with Flux CD and Ansible.]

      Redesign the deploy process and introduce Flux CD to achieve intuitive GitOps process, which
      makes us to easily manage multiple Kubernetes cluster instances.

    - Design IaC for monitoring mixins with Jsonnet and Flux CD OCI artifacts.
    - Manage high availability OpenLDAP cluster.
    - Write Ansible playbook to do CI/CD for complex Nginx configuration files.
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

  #resume_section("Personal Project")
  #personal_project_item_header(
    "Rust library for OpenSSH key",
    "",
    "Maintainer",
    "Feb. 2020",
    project_link: github_project_link("Leo1003/rust-osshkeys"),
  )
  #resume_item[
    -
  ]
]

#grid(
  columns: (1fr, 2fr),
  column-gutter: 1em,
  sidebar_content,
  main_content,
)
