import { Component, OnInit } from '@angular/core';
import { CourseAddComponent } from './course-add/course-add.component';
import { Routes, Router } from '@angular/router';
import { CourseListComponent } from './course-list/course-list.component';
import { CourseEditComponent } from './course-edit/course-edit.component';

@Component({
  selector: 'app-courses',
  templateUrl: './courses.component.html',
  styleUrls: ['./courses.component.css']
})
export class CoursesComponent implements OnInit {

  constructor(private router:Router) { }

  ngOnInit() {
  }
  
  navigateToList(){
    console.log('List');
    this.router.navigateByUrl('courses/list');
  }
  navigateToAdd(){
    console.log('Add');
    this.router.navigateByUrl('courses/add');
  }
  navigateToEdit(){
    console.log("Edit");
    this.router.navigateByUrl("courses/1");
  }

}
export const routes: Routes = [
  { path: "", component:CoursesComponent },
  { path: "add", component: CourseAddComponent },
  { path: "list", component: CourseListComponent },
  { path: ":id", component: CourseEditComponent },
];
