import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder,FormGroup } from '@angular/forms';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-student-edit',
  templateUrl: './student-edit.component.html',
  styleUrls: ['./student-edit.component.css']
})
export class StudentEditComponent implements OnInit {

  editStudentFormGroup:FormGroup
  constructor(private router:Router,private formBuilder:FormBuilder,private http:HttpClient,private route:ActivatedRoute) {
    
   }
  ngOnInit() {
    this.editStudentFormGroup=this.formBuilder.group({
      studentName:"",
      studentMobileNo:"",
      studentEmailId:"",
    })
  }
  submit(){
  }
}
