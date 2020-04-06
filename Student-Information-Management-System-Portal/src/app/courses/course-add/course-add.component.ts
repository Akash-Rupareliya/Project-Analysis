import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { FormBuilder, FormGroup } from '@angular/forms';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-course-add',
  templateUrl: './course-add.component.html',
  styleUrls: ['./course-add.component.css']
})
export class CourseAddComponent implements OnInit {

  
  constructor(private router:Router,public formBuilder:FormBuilder,private http:HttpClient) { }
  addCourseFormGroup:FormGroup
  ngOnInit() {
    this.addCourseFormGroup=this.formBuilder.group({
      courseName:"",
      courseFee:"",
    })
  }
  submit(){
    console.log(this.addCourseFormGroup.value)
   this.http.post('https://localhost:44394/api/Course',{CourseName:this.addCourseFormGroup.controls.courseName.value,
   CourseFee:this.addCourseFormGroup.controls.courseFee.value}).subscribe(res=>{console.log(res)
   });
    console.log("Data Inserted");
    }
  }
