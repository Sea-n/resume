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
        "System Team Leader in NYCU CSIT",
      )
  ),
)

#let sidebar_content = [
  #resume_section("Education")
  #education_item[
    National Yang Ming Chiao Tung University
  ][
    Institute of Computer Science and Engineering
  ][
    Master of Science
  ][
    Aug. 2022 - Estimate 2024
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

  #resume_section("Skills")
  #skill_item(
    "Programming Language",
    (
      strong[Rust],
      strong[C],
      strong[Bash],
      "C++",
      "C#",
      "Python",
      "Javascript",
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
      "Mandarin: Native",
      "English: Advanced",
    )
  )
]

#let main_content = [
  #resume_section("Experience")
  #work_experience_item_header(
    "Information Technology Center",
    "Department of CS, NYCU",
    "Infrastructure Engineer (Part-time)",
    "May. 2020 - Estimate 2024",
  )
  #resume_item[
    - #strong[In charge of the system team leader.]
    - #strong[Build logs management system with OpenSearch, Vector, and Fluent Bit.]

      Write Ansible playbook to automate the deploy process, and to automatically rolling upgrade
      the cluster to prevent downtime.

    - #strong[Construct metrics monitoring system with Prometheus, Thanos, and Grafana.]

      In order to monitor multiple Kubernetes cluster, introducing Thanos to provide the ability to
      query across different cluster and long term metric storage.

    - #strong[Redesign Kubernetes IaC with Flux CD and Ansible.]

      Redesign the deploy process and introduce Flux CD to achieve intuitive GitOps process, which
      makes us to easily manage multiple Kubernetes cluster instances.

    - Design IaC for monitoring mixins with Jsonnet and Flux CD OCI artifacts.
    - Manage high availability OpenLDAP cluster.
    - Write Ansible playbook to do CI/CD for complex Nginx configuration files.
  ]

  #resume_section("Personal Project")
  #personal_project_item_header(
    "genetlink",
    "",
    "Contributor",
    "Sep. 2021",
    project_link: github_project_link("rust-netlink/genetlink"),
  )
  #resume_item[
    - Contribute the whole genetlink protocol implementation to the rust-netlink project.
    - Along with another 2 crates: `netlink-packet-generic`, `netlink-packet-wireguard`, which
      enable Rust program to operate Wireguard tunnel without the need to depend on C library.
  ]

  #personal_project_item_header(
    "rust-osshkeys",
    "",
    "Maintainer",
    "Feb. 2020",
    project_link: github_project_link("Leo1003/rust-osshkeys"),
  )
  #resume_item[
    - Build a Rust library for accessing OpenSSH key in different formats.
      Makes it possible to use, convert OpenSSH keys easily with Rust programs.
  ]

  #personal_project_item_header(
    "cjail",
    "",
    "Maintainer",
    "Feb. 2018",
    project_link: github_project_link("Leo1003/cjail"),
  )
  #resume_item[
    - A container jail to run process in an isolated environment. Learned a lot while working
      on this project, including Linux namespace, cgroup, rlimits, signals, etc.
  ]
]

#grid(
  columns: (1fr, 2fr),
  column-gutter: 1em,
  sidebar_content,
  main_content,
)
