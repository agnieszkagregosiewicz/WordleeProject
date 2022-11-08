package com.game.wordleeproject.model;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import java.util.Collection;

public class CurrentUser extends User {
    private final com.game.wordleeproject.model.User user;
    public CurrentUser(String login, String password, Double score, Long gamesPlayedQ, Double aDouble, Collection<? extends GrantedAuthority> authorities,
                       com.game.wordleeproject.model.User user) {
        super(login, password, authorities);
        this.user = user;
    }


    public com.game.wordleeproject.model.User getUser() {
        return user;
    }
}
