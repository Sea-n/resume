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
  #resume_section("Education")
  #education_item[
    University of Aaaaaaaa Aaaaaaa-Aaaaaaaaa
  ][
    Master of Computer Science
  ][
    #resume_gpa("4.00", "4.00")
  ][
    Aug. 0000 - Aug. 0000
  ]

  #education_item[
    University of Aaaaaaaa-Aaaaaaa
  ][
    B.S. in Computer Science
  ][
    #resume_gpa("4.00", "4.00")
  ][
    Aug. 0000 - Aug. 0000
  ]
]

#let main_content = []

#grid(
  columns: (1fr, 2fr),
  column-gutter: 1em,
  sidebar_content,
  main_content,
)
