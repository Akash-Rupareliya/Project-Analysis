import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import {FormGroup,FormBuilder} from '@angular/forms';
import {HttpClient} from '@angular/common/http';
@Component({
  selector: 'app-student-add',
  templateUrl: './student-add.component.html',
  styleUrls: ['./student-add.component.css']
})
export class StudentAddComponent implements OnInit {

  constructor(private router:Router,public formBuilder:FormBuilder,private http:HttpClient) { }
  addStudentFormGroup:FormGroup
  ngOnInit() {
    this.addStudentFormGroup=this.formBuilder.group({
      studentName:"",
      studentMobileNo:"",
      studentEmailId:"",
    })
  }
  submit(){
    console.log(this.addStudentFormGroup.value)
    var r=this.http.post('https://localhost:44394/api/student',{StudentName:this.addStudentFormGroup.controls.studentName.value,
    StudentMobileNo:this.addStudentFormGroup.controls.studentMobileNo.value,StudentEmailId:this.addStudentFormGroup.controls.studentEmailId.value
                                                          }).subscribe(res=>{console.log(res)
                                                          })
    console.log("Data Inserted");
    }
  
}

