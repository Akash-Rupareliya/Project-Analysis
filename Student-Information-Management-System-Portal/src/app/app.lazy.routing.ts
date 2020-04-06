import {Routes,RouterModule,PreloadAllModules,NoPreloading, ROUTES} from '@angular/router';

import {StudentsComponent} from './students/students.component';
import {ModuleWithProviders} from '@angular/core';
import {routes as childRoutes} from './students/students.component';
import {routes as childCourseRoutes} from './courses/courses.component';
import { CoursesComponent } from './courses/courses.component';



const APP_LAZY_ROUTES : Routes=[
  {
    path:"courses",component:CoursesComponent,children:childCourseRoutes
  },
 {
    path:"students",component:StudentsComponent,children:childRoutes
  },
]
console.log(APP_LAZY_ROUTES)
export const APP_LAZY_ROUTING: ModuleWithProviders = RouterModule.forRoot(APP_LAZY_ROUTES, {
  preloadingStrategy: NoPreloading,
});
