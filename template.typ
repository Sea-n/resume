// const color
#let color_darknight = rgb("#131A28")
#let color_h1 = rgb("#482")
#let color_h2 = rgb("#248")
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
    size: 10pt,
    weight: "light",
    fill: color_darknight,
    fallback: true,
    costs: (hyphenation: 200%),
  )

  set page(
    paper: "a4",
    margin: (left: 15mm, right: 15mm, top: 10mm, bottom: 10mm),
    footer: [
      #set text(fill: gray, size: 0.8em)
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
      #pad(bottom: 0.5em)[
        #set text(size: 3em)
        #author.firstname
        #author.lastname
        #set text(weight: "regular")
        #author.mandarinname
      ]
    ]
  }

  let positions = {
    align(center)[
      #set text(weight: "regular")
      #author.positions.join(
        text[#"  •  "]
      )
    ]
  }

  let contacts = {
    set box(height: 1em)

    let email_icon = box(image("assets/icons/envelope.svg"))
    let phone_icon = box(image("assets/icons/phone.svg"))
    let github_icon = box(image("assets/icons/github.svg"))
    let linkedin_icon = box(image("assets/icons/linkedin.svg"))
    let globe_icon = box(image("assets/icons/globe.svg"))
    let separator = box(width: 0.5em)

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

  set box(height: 1em)

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
    size: 1.6em,
    weight: "bold",
    fill: color_h1,
  )
  set line(
    stroke: color_h1,
  )
  align(left)[
    #title
    #box(width: 1fr, line(length: 100%))
  ]
}

#let resume_item(body) = {
  set par(leading: 0.6em)
  set list(spacing: 1em)
  body
}

#let resume_summary(body) = {
  set par(leading: 0.6em)
  set list(spacing: 1em)
  set text(costs: (hyphenation: 1000%))
  body
}

#let resume_time(body) = {
  set text(weight: "regular", style: "italic", size: 0.9em)
  body
}

#let resume_organization(body) = {
  set text(size: 1.2em, weight: "bold", fill: color_h2)
  body
}

#let resume_department(body) = {
  set text(weight: "medium", fill: color_gray)
  body
}

#let resume_location(body) = {
  set text(style: "italic")
  body
}

#let resume_position(body) = {
  set text(weight: "regular")
  body
}

#let resume_link(body) = {
  set text(weight: "regular", fill: color_gray)
  body
}

#let resume_category(body) = {
  set text(size: 1.2em, weight: "bold", fill: color_h2)
  upper[#body]
}

// sections specific components
#let education_item(organization, department, time_frame) = {
  set block(above: 0.7em, below: 0.7em)
  set pad(top: 0.5em)
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
  set block(above: 0.6em, below: 0.6em)
  set pad(top: 0.6em, bottom: 0.4em)
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
  set pad(top: 0.5em)
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
  set pad(bottom: 0.6em)

  pad[
    #resume_category[#category]

    •  #items.join(" • ")
  ]
}

#let skill_item_list(category, items) = {
  set pad(bottom: 0.6em)

  pad[
    #resume_category[#category]

    #list(..items)
  ]
}

#let skill_item_body(category, body) = {
  set pad(bottom: 0.6em)

  pad[
    #resume_category[#category]

    #resume_item[#body]
  ]
}
