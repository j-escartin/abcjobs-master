package com.abcjobs.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.abcjobs.model.BulkEmail;

public interface BulkEmailRepository extends JpaRepository <BulkEmail, Long> {

}
