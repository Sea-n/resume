// const color
#let color_darknight = rgb("#131A28")
#let color_darksky = rgb("#335E99")
#let color_darkgray = rgb("#333333")
#let color_gray = rgb("#555555")
#let color_lightgray = rgb("#888")

// layout utility
#let justify_align(left_body, right_body) = {
  block[
    #left_body
    #box(width: 1fr)[
      #align(right)[
        #right_body
      ]
    ]
  ]
}

#let justify_align_3(left_body, mid_body, right_body) = {
  block[
    #box(width: 1fr)[
      #align(left)[
        #left_body
      ]
    ]
    #box(width: 1fr)[
      #align(center)[
        #mid_body
      ]
    ]
    #box(width: 1fr)[
      #align(right)[
        #right_body
      ]
    ]
  ]
}

#let resume(author: (:), body) = {
  set document(
    author: author.firstname + " " + author.lastname,
    title: "resume",
  )

  set text(
    font: (
      "Inter",
      "Noto Sans CJK TC",
    ),
    lang: "zh",
    size: 11pt,
    fill: color_darknight,
    fallback: true
  )

  set page(
    paper: "a4",
    margin: (left: 15mm, right: 15mm, top: 10mm, bottom: 10mm),
    footer: [
      #set text(fill: gray, size: 8pt)
      #justify_align_3[
        #smallcaps[#datetime.today().display()]
      ][
        #smallcaps[
          #author.firstname
          #author.lastname
          #sym.dot.c
          #"Resume"
        ]
      ][
      ]
    ],
    footer-descent: 0pt,
  )

  // set paragraph spacing
  set par(spacing: 0.75em, justify: true)

  set heading(
    numbering: none,
    outlined: false,
  )

  let name = {
    align(center)[
      #pad(bottom: 5pt)[
        #block[
          #set text(size: 32pt, style: "normal", font: ("Inter"))
          #text(weight: "light")[#author.firstname]
          #text(weight: "light")[#author.lastname]
          #set text(size: 32pt, style: "normal", font: ("Noto Sans CJK TC"))
          #text(weight: "medium")[#author.chinesename]
        ]
      ]
    ]
  }

  let positions = {
    set text(
      size: 9pt,
      weight: "regular"
    )
    align(center)[
      #smallcaps[
        #author.positions.join(
          text[#"  "#sym.dot.c#"  "]
        )
      ]
    ]
  }

  let contacts = {
    set box(height: 11pt)

    let linkedin_icon = box(image("assets/icons/linkedin.svg"))
    let github_icon = box(image("assets/icons/square-github.svg"))
    let email_icon = box(image("assets/icons/square-envelope-solid.svg"))
    let phone_icon = box(image("assets/icons/square-phone-solid.svg"))
    let separator = box(width: 5pt)

    align(center)[
      #block[
        #align(horizon)[
          #phone_icon
          #box[#text(author.phone)]
          #separator
          #email_icon
          #box[#link("mailto:" + author.email)[#author.email]]
          #separator
          #github_icon
          #box[#link("https://github.com/" + author.github)[#author.github]]
          #separator
          #linkedin_icon
          #box[
            #link("https://www.linkedin.com/in/" + author.linkedin)[#author.linkedin]
          ]
        ]
      ]
    ]
  }

  name
  positions
  contacts
  body
}

#let github_project_link(project_path) = {
  let github_icon = box(image("assets/icons/square-github.svg"));
  let github_url = "https://github.com/" + project_path;

  set box(height: 10pt)

  block[
    #align(horizon)[
      #github_icon
      #box[#link(github_url)[#github_url]]
    ]
  ]
}

// general style
#let resume_section(title) = {
  set text(
    size: 16pt,
    weight: "regular",
    fill: color_darksky,
  )
  set line(
    stroke: color_darksky,
  )
  align(left)[
    #smallcaps[
      // #text[#title.slice(0, 3)]#strong[#text[#title.slice(3)]]
      #strong[#text[#title]]
    ]
    #box(width: 1fr, line(length: 100%))
  ]
}

#let resume_item(body) = {
  set text(size: 10pt, style: "normal", weight: "light")
  set par(leading: 0.64em)
  body
}

#let resume_summary(body) = {
  set text(size: 10pt, style: "normal", weight: "light")
  set par(leading: 0.32em)
  body
}

#let resume_time(body) = {
  set text(weight: "regular", style: "italic", size: 9pt)
  body
}

#let resume_organization(body) = {
  set text(size: 12pt, style: "normal", weight: "bold")
  body
}

#let resume_department(body) = {
  set text(size: 10pt, style: "normal", weight: "medium", fill: color_gray)
  body
}

#let resume_location(body) = {
  set text(size: 10pt, style: "italic", weight: "light")
  body
}

#let resume_position(body) = {
  set text(size: 10pt, weight: "regular")
  smallcaps[#body]
}

#let resume_link(body) = {
  set text(size: 10pt, weight: "regular", fill: color_lightgray)
  body
}

#let resume_category(body) = {
  set text(size: 12pt, weight: "bold")
  upper[#body]
}

// sections specific components
#let education_item(organization, department, time_frame) = {
  set block(above: 0.7em, below: 0.7em)
  set pad(top: 5pt)
  pad[
    #block[
      #resume_organization[#organization]
    ]
    #resume_department[#department]

    #align(right)[
      #resume_time[#time_frame]
    ]
  ]
}

#let work_experience_item_header(
  company,
  location,
  position,
  time_frame
) = {
  set block(above: 0.7em, below: 0.7em)
  set pad(top: 5pt)
  pad[
    #justify_align[
      #resume_organization[#company]
    ][
      #resume_location[#location]
    ]
    #justify_align[
      #resume_position[#position]
    ][
      #resume_time[#time_frame]
    ]
  ]
}

#let personal_project_item_header(
  name,
  duration,
  project_link: none,
) = {
  set block(above: 0.7em, below: 0.7em)
  set pad(top: 5pt)
  pad[
    #justify_align[
      #resume_organization[#name]
    ][
      #resume_time[#duration]
    ]
    #if project_link != none {
      resume_link[#project_link]
    }
  ]
}

#let skill_item(category, items) = {
  set block(below: 1em)
  set pad(top: 5pt)

  pad[
    #resume_category[#category]

    #set text(size: 10pt, style: "normal", weight: "light")
    #items.join(" • ")
  ]
}

#let skill_item_list(category, items) = {
  set block(below: 1em)
  set pad(top: 5pt)

  pad[
    #resume_category[#category]

    #set text(size: 10pt, style: "normal", weight: "light")
    #list(..items)
  ]
}

#let skill_item_body(category, body) = {
  set block(below: 1em)
  set pad(top: 5pt)

  resume_category[#category]

  set text(size: 10pt, style: "normal", weight: "light")
  body
}
