roles = Role.create(
    [
        {
          is_admin: 1,
          is_user: 0,
          role_name: "Admin"
        },
        {
          is_admin: 0,
          is_user: 1,
          role_name: "User"
        }
      ]

)

users = User.create(
  [
    {
      login: "gnome1",
      password: "1qaz2wsx"
    },
    {
      login: "gnome12",
      password: "1qaz2wsx"
    }
  ]
)

  routes = Route.create(
  [
    {
      r_description: "Długa trasa na cały dzień",
      route_name: "Długa"
    },
    {
      r_description: "Krótka trasa na pół dnia",
      route_name: "Krótka"
    }
  ]
)

profiles = Profile.create(
  [
    {
      title:"gnomiarz",
      route: routes[0],
      role: roles[0],
      user: users[0]
    },
    {
      title:"Użytkowniczacz",
      route: routes[1],
      role: roles[1],
      user: users[1]
    }
  ]
)

gnomes = Gnome.create(
  [
    {
      g_description:"Gnomek, typowy gnomek",
      gnome_name: "Gnomek",
      location_x: 24,
      location_y: 453,
      route: routes[1]
    },
    {
      g_description:"Domek, typowy domek",
      gnome_name: "Domek",
      location_x: 345,
      location_y: 234,
      route: routes[1]
    },
    {
      g_description:"Kołek, typowy kołek",
      gnome_name: "Kołek",
      location_x: 24,
      location_y: 5466,
      route: routes[1]
    },
    {
      g_description:"Człek, typowy człek",
      gnome_name: "Człek",
      location_x: 2344,
      location_y: 546456,
      route: routes[0]
    },
    {
      g_description:"Wałek, typowy wałek",
      gnome_name: "Wałek",
      location_x: 24,
      location_y: 66,
      route: routes[0]
    },
    {
      g_description:"Kotek, typowy kotek",
      gnome_name: "Kotek",
      location_x: 244,
      location_y: 5,
      route: routes[0]
    },
    {
      g_description:"ULTRAGNOM, niesamowity ULTRA WIELKI GNOM",
      gnome_name: "ULTRAGNOM",
      location_x: 4,
      location_y: 66,
      route: routes[0]
    }])

    likes = Like.create(
    [
    {
      gnome: gnomes[0],
      profile: profiles[0]
    },
    {
      gnome: gnomes[0],
      profile: profiles[0]
    },
    {
      gnome: gnomes[2],
      profile: profiles[0]
    },
    {
      gnome: gnomes[3],
      profile: profiles[1]
    },    
    {
      gnome: gnomes[0],
      profile: profiles[1]
    }
  ]
)
