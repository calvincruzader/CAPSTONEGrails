package myawesomeblog

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/" (controller:'Post', action: 'index')
        "500"(view:'/error')
        "404"(view:'/notFound')

        name testFriendlyURL: "/calvins-blogs/cool-thoughts/$title/" {
          controller = 'Post'
          action = 'show'
        }
    }
}
