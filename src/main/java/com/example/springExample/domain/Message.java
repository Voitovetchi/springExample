package com.example.springExample.domain;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Getter
@Setter
@Entity
public class Message {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "Please fill the message")
    @Length(max = 2048, message = "Message too long (more than 2048 symbols)")
    private String text;
    @Length(max = 255, message = "Tag too long (more than 255 symbols)")
    private String tag;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    private String filename;

    public Message() {
    }

    public Message(String text, String tag, User author) {
        this.author = author;
        this.text = text;
        this.tag = tag;
    }

    public String getAuthorName() {
        return author != null ? author.getUsername() : "<none>";
    }
}
