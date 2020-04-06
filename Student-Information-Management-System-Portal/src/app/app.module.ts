import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { StudentsComponent} from './students/students.component';
import { StudentAddComponent } from './students/student-add/student-add.component';
import { StudentEditComponent } from './students/student-edit/student-edit.component';
import { APP_LAZY_ROUTING } from './app.lazy.routing';
import { RouterModule } from '@angular/router';
import { ReactiveFormsModule } from '@angular/forms';
import {HttpClientModule} from '@angular/common/http'
import { StudentListComponent} from './students/student-list/student-list.component';
import { CoursesComponent } from './courses/courses.component';
import { CourseAddComponent } from './courses/course-add/course-add.component';
import { CourseListComponent } from './courses/course-list/course-list.component';
import { CourseEditComponent } from './courses/course-edit/course-edit.component'

@NgModule({
  declarations: [
    AppComponent,
    StudentsComponent,
    StudentListComponent,
    StudentAddComponent,
    StudentEditComponent,
    CoursesComponent,
    CourseAddComponent,
    CourseListComponent,
    CourseEditComponent,
    
  ],
  imports: [
    HttpClientModule,
    BrowserModule,
    AppRoutingModule,
    APP_LAZY_ROUTING,
    ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
