package com.xworkz.Bakery.dto;

import lombok.*;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@EqualsAndHashCode
public class LoginDTO implements Serializable {
    private String email;
    private String password;
}
