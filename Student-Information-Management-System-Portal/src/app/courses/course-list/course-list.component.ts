import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-course-list',
  templateUrl: './course-list.component.html',
  styleUrls: ['./course-list.component.css']
})
export class CourseListComponent implements OnInit {
  result:any;
  constructor(private http:HttpClient) { }

  ngOnInit() {
    this.http.get('https://localhost:44394/api/course').subscribe(res=>{
      this.result=res;
      console.log(this.result);
    })
  }

}
