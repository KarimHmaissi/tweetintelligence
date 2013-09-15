package org.hmaissi.twitterIntelligence.auth

class TwitterUser {

	transient springSecurityService

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

    String twitterId
    String accessToken
    String secretToken

    //flag to check if initial tweets have been downloaded
    boolean initialDataLoaded

	static constraints = {
		username blank: false, unique: true
		password blank: false
        twitterId blank: false, unique: true
        accessToken blank: false, unique: true
        secretToken blank: false, unique: true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
