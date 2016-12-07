// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'myawesomeblog.SecUser'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'myawesomeblog.SecUserSecRole'
grails.plugin.springsecurity.authority.className = 'myawesomeblog.SecRole'
grails.plugin.springsecurity.fii.rejectPublicInvocations = false
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/post/index'
grails.plugin.springsecurity.ui.register.postRegisterUrl = '/post/index'
grails.plugin.springsecurity.successHandler.alwaysUseDefault = true
grails.plugin.springsecurity.logout.afterLogoutUrl = '/post/index'

grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/post/index',     access: ['permitAll']],
	[pattern: '/post/edit',      access: ['ROLE_ADMIN']],
	[pattern: '/post/create',    access: ['ROLE_ADMIN']],
	[pattern: '/post/delete/**',    access: ['ROLE_ADMIN']],
	[pattern: '/post/searchBlogs',  access: ['permitAll']],
	[pattern: '/post/save',      access: ['ROLE_ADMIN']],
	[pattern: '/comment/**',      access: ['permitAll']],
	[pattern: '/post/update/**',      access: ['ROLE_ADMIN']],


	[pattern: '/post/show',      access: ['permitAll']],
	[pattern: '/user/create',    access: ['permitAll']],
	[pattern: '/user/show',      access: ['permitAll']],
	[pattern: '/comment/saveComment', access: ['permitAll']],
	[pattern: '/calvins-blogs/**', access: ['permitAll']],


	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]
