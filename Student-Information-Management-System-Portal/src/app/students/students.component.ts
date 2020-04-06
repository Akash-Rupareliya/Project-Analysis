import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, Routes } from '@angular/router';
import { StudentAddComponent } from './student-add/student-add.component';
import { StudentEditComponent } from './student-edit/student-edit.component';
import {StudentListComponent} from './student-list/student-list.component';
@Component({
  selector: 'app-students',
  templateUrl: './students.component.html',
  styleUrls: ['./students.component.css']
})
export class StudentsComponent implements OnInit {

  constructor(private router:Router,private route:ActivatedRoute) { }

  ngOnInit() {
  }
  navigateToList(){
    console.log('List');
    this.router.navigateByUrl('students/list');
  }
  navigateToAdd(){
    console.log('Add');
    this.router.navigateByUrl('students/add');
  }
  navigateToEdit(){
    console.log("Edit");
    this.router.navigateByUrl("students/1");
  }
}
export const routes: Routes = [
   { path: "", component:StudentsComponent },
   { path: "add", component: StudentAddComponent },
   { path: "list", component: StudentListComponent },
   { path: ":id", component: StudentEditComponent },
];