// const color
#let color_darknight = rgb("#131A28")
#let color_darksky = rgb("#482")
#let color_gray = rgb("#808080")

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
    title: author.firstname + " Resume",
  )

  set text(
    font: (
      "Inter",
      "Noto Sans CJK TC",
    ),
    lang: "en",
    size: 11pt,
    fill: color_darknight,
    fallback: true,
    costs: (hyphenation: 200%),
  )

  set page(
    paper: "a4",
    margin: (left: 15mm, right: 15mm, top: 10mm, bottom: 10mm),
    footer: [
      #set text(fill: gray, size: 8pt)
      #justify_align_3[
        #datetime.today().display()
      ][
        #author.firstname
        #author.lastname
        #sym.dot.c
        #"Resume"
      ][
      ]
    ],
    footer-descent: 0pt,
  )

  // set paragraph spacing
  set par(spacing: 0.75em, justify: true)

  let name = {
    align(center)[
      #pad(bottom: 5pt)[
        #set text(weight: "light", size: 32pt)
        #author.firstname
        #author.lastname
        #set text(weight: "regular")
        #author.mandarinname
      ]
    ]
  }

  let positions = {
    set text(
      size: 9pt,
      weight: "regular"
    )
    align(center)[
      #author.positions.join(
        text[#"  "#sym.dot.c#"  "]
      )
    ]
  }

  let contacts = {
    set box(height: 11pt)

    let email_icon = box(image("assets/icons/envelope.svg"))
    let phone_icon = box(image("assets/icons/phone.svg"))
    let github_icon = box(image("assets/icons/github.svg"))
    let linkedin_icon = box(image("assets/icons/linkedin.svg"))
    let globe_icon = box(image("assets/icons/globe.svg"))
    let separator = box(width: 5pt)

    align(center)[
      #block[
        #align(horizon)[
          #email_icon
          #box[#link("mailto:" + author.email)[#author.email]]
          #separator
          #phone_icon
          #box[#link("tel:" + author.phone)[#author.phone]]
          #separator
          #github_icon
          #box[#link("https://github.com/" + author.github)[#author.github]]
          #separator
          #linkedin_icon
          #box[
            #link("https://www.linkedin.com/in/" + author.linkedin)[#author.linkedin]
          ]
          #separator
          #globe_icon
          #box[
            #link("https://" + author.site)[#author.site]
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
  let github_icon = box(image("assets/icons/github.svg"));
  let github_url = "https://github.com/" + project_path;

  set box(height: 10pt)

  block[
    #align(horizon)[
      #github_icon
      #box[#link(github_url)[#project_path]]
    ]
  ]
}

// general style
#let resume_section(title) = {
  set text(
    size: 16pt,
    weight: "bold",
    fill: color_darksky,
  )
  set line(
    stroke: color_darksky,
  )
  align(left)[
    #title
    #box(width: 1fr, line(length: 100%))
  ]
}

#let resume_item(body) = {
  set text(size: 10pt, style: "normal", weight: "light")
  set par(leading: 0.48em)
  set list(spacing: 0.8em)
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
  body
}

#let resume_link(body) = {
  set text(size: 10pt, weight: "regular", fill: color_gray)
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
    #items.join(" • ")
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

  resume_item[#body]
}
