package com.example.demo.controller;

import com.example.demo.model.Book;
import com.example.demo.repo.BookRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController("")
public class BookController {

    @Autowired
    BookRepo bookRepo;

    @PostMapping("")
    private String registerBook(@RequestBody Book book){
        bookRepo.save(book);
        return "Received";
    }

    @GetMapping("")
    private List<Book> getAllBooks(){
        return bookRepo.findAll();
    }
}
